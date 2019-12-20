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
	#name : #WaveEngineOld,
	#superclass : #Object,
	#instVars : [
		'mainExecutor',
		'joinHandler',
		'subExecutors',
		'engineAnnouncer',
		'workList',
		'activations',
		'scheduler',
		'process',
		'pluginData',
		'processHandlers'
	],
	#category : #'NewWave-Engine'
}

{ #category : #'as yet unclassified' }
WaveEngineOld class >> initialNode: startNode [
	| we | 
	we := WaveExecutor initialNode: startNode.
	^ self new 
		addExecutor: we;
		yourself.
]

{ #category : #'as yet unclassified' }
WaveEngineOld class >> initialProcess: aProcess [
	| we | 
	we := WaveExecutor initialNode: aProcess initialFlowElement.
	^ self new 
		addExecutor: we;
		process: aProcess;
		yourself.
]

{ #category : #accessing }
WaveEngineOld >> activations [
	^ activations
]

{ #category : #accessing }
WaveEngineOld >> addExecutor: anExecutor [
	self mainExecutor: anExecutor.
	self mainExecutor engine: self.
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
				, ann executor worker process identityHash asString) logCr.
			ann executor worker stop ]
]

{ #category : #accessing }
WaveEngineOld >> addSubExecutor: anInitialSequence [
	| se |
	se := SubExecutor initialSequence: anInitialSequence engine: self.
	se startSubExecutor.
	subExecutors add: se.
]

{ #category : #accessing }
WaveEngineOld >> engineAnnouncer [
	^ engineAnnouncer 
]

{ #category : #accessing }
WaveEngineOld >> engineAnnouncer: anAnnouncer [
	engineAnnouncer := anAnnouncer 
]

{ #category : #accessing }
WaveEngineOld >> initialize [
	super initialize.
	self joinHandler: (JoinHandler context: self).
	self subExecutors: OrderedCollection new.
	self engineAnnouncer: Announcer new.
	workList := WaveWorkList new.
	activations := Dictionary new.
	pluginData := Dictionary new
	"scheduler := TaskScheduler new."
	"scheduler start."
]

{ #category : #accessing }
WaveEngineOld >> joinHandler [
	^ joinHandler 
]

{ #category : #accessing }
WaveEngineOld >> joinHandler: aJoinHandler [
	joinHandler := aJoinHandler 
]

{ #category : #accessing }
WaveEngineOld >> logNewActivation: anActivation on: anExecutor forNode: aNode [
"TODO when adding a history"


]

{ #category : #accessing }
WaveEngineOld >> mainExecutor [
	^ mainExecutor
]

{ #category : #accessing }
WaveEngineOld >> mainExecutor: executors [
	mainExecutor := executors 
]

{ #category : #accessing }
WaveEngineOld >> process [
	^ process
]

{ #category : #accessing }
WaveEngineOld >> process: anObject [
	process := anObject
]

{ #category : #accessing }
WaveEngineOld >> scheduler [
	^ scheduler
]

{ #category : #accessing }
WaveEngineOld >> startEngine [
	mainExecutor tryToExecuteNext.
	mainExecutor waveAnnouncer announce: StartAnnouncer new.
]

{ #category : #accessing }
WaveEngineOld >> stopEngine [
	"scheduler stop."
	pluginData do: [ :plugin | plugin stop ].
	"I am force stopping all the workers in the engine."
	mainExecutor workers valuesDo: [ :d | d stop ].
]

{ #category : #accessing }
WaveEngineOld >> subExecutors [
	^ subExecutors 
]

{ #category : #accessing }
WaveEngineOld >> subExecutors: aSubExecutor [
	subExecutors := aSubExecutor 
]

{ #category : #accessing }
WaveEngineOld >> workList [
	^ workList
]
