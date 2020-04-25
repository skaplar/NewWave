"
I am a copy of class WaveEngine. This comment is copied from there, and might not be entirely accurate

I am a class that represents the engine of the workflow. Execution is started through this class by calling message startEngine which accesses the main executor.
Engine contains one main executor and other subexecutors (depending on the model) and a system of announcers which announnces when something happens during execution.

We create engine using, and then provide it with main executor. Main executor needs the node from which he will start executing. We start the execution by simply calling startEngine. 

start := StartEvent new.
start description: 'StartEvent'.

end := EndEvent new.
end description: 'End Event ee'.

seq1 := Sequence source: start target: end.
start addOutgoingFlow: seq1.
end addIncomingFlow: seq1. 

engine := WaveEngine new.
we := WaveExecutor initialNode: start.
engine addExecutor: we.
engine startEngine.

Internal Representation and Key Implementation Points.

Instance Variables
	engineAnnouncer: Announcer for receiving announcements in the engine (eg. joinCompleted)
	joinHandler:		JoinHandler for handling joins in the engine
	mainExecutor:		WaveExecutor for performing main execution
	subExecutors:		SubExecutor for spawning new subexecutors (type of WaveExecutor)


    Implementation Points
"
Class {
	#name : #NWProcessHandler,
	#superclass : #Object,
	#instVars : [
		'mainExecutor',
		'joinHandler',
		'subExecutors',
		'engineAnnouncer',
		'workList',
		'activations',
		'process',
		'engine',
		'processScheduler'
	],
	#category : #'NewWave-Engine'
}

{ #category : #'as yet unclassified' }
NWProcessHandler class >> initialNode: startNode [
	| we | 
	we := NWExecutor initialNode: startNode.
	^ self new 
		addExecutor: we;
		yourself.
]

{ #category : #'as yet unclassified' }
NWProcessHandler class >> initialProcess: aProcess [
	| we | 
	we := NWExecutor initialNode: aProcess initialFlowElement.
	^ self new 
		addExecutor: we;
		process: aProcess;
		yourself.
]

{ #category : #'as yet unclassified' }
NWProcessHandler class >> initialProcess: aProcess engine: anEngine [
	| we | 
	we := NWExecutor initialNode: aProcess initialFlowElement.
	^ self new 
		addExecutor: we;
		process: aProcess;
		engine: anEngine;
		yourself.
]

{ #category : #accessing }
NWProcessHandler >> activations [
	^ activations
]

{ #category : #adding }
NWProcessHandler >> addDataObjectFromServer: aDataObject [
	| toRemove |
	self deprecated: 'Ova metoda izgleda ne radi nista za sada, tako da mozemo da je zakomentarisemo.'.
	toRemove := process dataObjects detect: [ :each | each valuedDataObject id = aDataObject id ] ifNone: [ nil ].
	toRemove valuedDataObject: aDataObject.
]

{ #category : #accessing }
NWProcessHandler >> addExecutor: anExecutor [
	self mainExecutor: anExecutor.
	self mainExecutor processHandler: self.
	"parameter iz announcera mi je seekvenca "
	engineAnnouncer
		when: JoinEventAnnouncer
		do: [ :ann | 
			| tmpExecutor rez |
			tmpExecutor := joinHandler addSequenceToExecutors: ann parameter.
			rez := joinHandler checkIsExecutorCompleted: tmpExecutor.
			rez
				ifTrue: [ | an |
					an := tmpExecutor returnNodeAfterJoin.
					mainExecutor flowHandler node: an.
					mainExecutor tryToExecuteNext: tmpExecutor joinNode ].
			('Ending-SUB-Worker process is '
				, ann executor worker process identityHash asString) traceCr.
			ann executor worker stop ]
]

{ #category : #accessing }
NWProcessHandler >> addSubExecutor: anInitialSequence [
	| se |
	se := NWSubExecutor initialSequence: anInitialSequence processHandler: self.
	se startSubExecutor.
	subExecutors add: se.
]

{ #category : #adding }
NWProcessHandler >> addTaskToServer: task [
		| nWClassDecsription |
		"Ovo je bilo kada sam slao objekte instanci klasa, sada vec saljem NewWaveDOClassDescription kada pokrenem model."
		"dataObject := task dataOutputAssociations first valuedDataObject.
		nWClassDecsription := (NWClassDescriptionGenerator dataObject: dataObject) createClassDescription."
		nWClassDecsription := task dataOutputAssociations first valuedDataObject.
		nWClassDecsription processName: process name.
		nWClassDecsription processId: process id.
		nWClassDecsription processInstanceId: process processInstanceId.
		nWClassDecsription taskName: task name.
		nWClassDecsription taskDescription: task description.
		nWClassDecsription userName: task user username.
		nWClassDecsription groupName: task group groupName.
		nWClassDecsription taskId: task id.
		engine server addTaskWrapper: nWClassDecsription addTask: task.
		^ nWClassDecsription.
]

{ #category : #accessing }
NWProcessHandler >> engine [
	^ engine
]

{ #category : #accessing }
NWProcessHandler >> engine: anObject [
	engine := anObject
]

{ #category : #accessing }
NWProcessHandler >> engineAnnouncer [
	^ engineAnnouncer 
]

{ #category : #accessing }
NWProcessHandler >> engineAnnouncer: anAnnouncer [
	engineAnnouncer := anAnnouncer 
]

{ #category : #accessing }
NWProcessHandler >> initialize [
	super initialize.
	self joinHandler: (NWJoinHandler context: self).
	self subExecutors: OrderedCollection new.
	self engineAnnouncer: Announcer new.
	workList := NWWorkList new.
	activations := Dictionary new.
	processScheduler := TaskScheduler new.
]

{ #category : #accessing }
NWProcessHandler >> joinHandler [
	^ joinHandler 
]

{ #category : #accessing }
NWProcessHandler >> joinHandler: aJoinHandler [
	joinHandler := aJoinHandler 
]

{ #category : #accessing }
NWProcessHandler >> logNewActivation: anActivation on: anExecutor forNode: aNode [
"TODO when adding a history"


]

{ #category : #accessing }
NWProcessHandler >> mainExecutor [
	^ mainExecutor
]

{ #category : #accessing }
NWProcessHandler >> mainExecutor: executors [
	mainExecutor := executors 
]

{ #category : #accessing }
NWProcessHandler >> process [
	^ process
]

{ #category : #accessing }
NWProcessHandler >> process: anObject [
	process := anObject
]

{ #category : #accessing }
NWProcessHandler >> processScheduler [
	^ processScheduler
]

{ #category : #accessing }
NWProcessHandler >> startEngine [
	processScheduler start.
	mainExecutor tryToExecuteNext.
	mainExecutor waveAnnouncer announce: StartAnnouncer new.
]

{ #category : #accessing }
NWProcessHandler >> stopEngine [
	"I am force stopping all the workers in the engine."
	processScheduler stop.
	mainExecutor workers valuesDo: [ :d | d stop ].
]

{ #category : #accessing }
NWProcessHandler >> stopNotRunningBoundaryEvents [
	"When the node/task is completed, we check for the non-running scheduler tasks.
	called by the tryToExecuteNext: from NWExecutor"
	processScheduler tasksDo: [ :task |
		task isRunning ifFalse: [ task delete. ].
	].
]

{ #category : #accessing }
NWProcessHandler >> subExecutors [
	^ subExecutors 
]

{ #category : #accessing }
NWProcessHandler >> subExecutors: aSubExecutor [
	subExecutors := aSubExecutor 
]

{ #category : #accessing }
NWProcessHandler >> workList [
	^ workList
]
