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
		'engine'
	],
	#category : #'NewWave-Engine'
}

{ #category : #'as yet unclassified' }
NWProcessHandler class >> initialNode: startNode [
	| we | 
	we := WaveExecutor initialNode: startNode.
	^ self new 
		addExecutor: we;
		yourself.
]

{ #category : #'as yet unclassified' }
NWProcessHandler class >> initialProcess: aProcess [
	| we | 
	we := WaveExecutor initialNode: aProcess initialFlowElement.
	^ self new 
		addExecutor: we;
		process: aProcess;
		yourself.
]

{ #category : #'as yet unclassified' }
NWProcessHandler class >> initialProcess: aProcess engine: anEngine [
	| we | 
	we := WaveExecutor initialNode: aProcess initialFlowElement.
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
	se := SubExecutor initialSequence: anInitialSequence processHandler: self.
	se startSubExecutor.
	subExecutors add: se.
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
	self joinHandler: (JoinHandler context: self).
	self subExecutors: OrderedCollection new.
	self engineAnnouncer: Announcer new.
	workList := WaveWorkList new.
	activations := Dictionary new.
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
NWProcessHandler >> startEngine [
	mainExecutor tryToExecuteNext.
	mainExecutor waveAnnouncer announce: StartAnnouncer new.
]

{ #category : #accessing }
NWProcessHandler >> stopEngine [
	"I am force stopping all the workers in the engine."
	mainExecutor workers valuesDo: [ :d | d stop ].
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