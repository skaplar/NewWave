"
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
	#name : #WaveEngine,
	#superclass : #Object,
	#instVars : [
		'mainExecutor',
		'joinHandler',
		'subExecutors',
		'engineAnnouncer',
		'workList',
		'activations',
		'scheduler'
	],
	#category : #'NewWave-Engine'
}

{ #category : #'as yet unclassified' }
WaveEngine class >> initialNode: startNode [
	| we | 
	we := WaveExecutor initialNode: startNode.
	^ self new 
		addExecutor: we;
		yourself.
]

{ #category : #accessing }
WaveEngine >> activations [
	^ activations
]

{ #category : #accessing }
WaveEngine >> addExecutor: anExecutor [
	self mainExecutor: anExecutor.
	self mainExecutor engine: self.
	"parameter iz announcera mi je seekvenca "
	engineAnnouncer subscribe: JoinEventAnnouncer 
	do: [ 
			:ann | | tmpExecutor rez | 
			tmpExecutor := joinHandler addSequenceToExecutors: ann parameter.
			rez := joinHandler checkIsExecutorCompleted: tmpExecutor.
			rez ifTrue: [ | an |
				an := tmpExecutor returnNodeAfterJoin.
				mainExecutor flowHandler node: an. 
				mainExecutor tryToExecuteNext: tmpExecutor joinNode.
			].
			('Ending-SUB-Worker process is ', ann executor worker process identityHash asString) logCr.
			ann executor worker stop.
	].
]

{ #category : #accessing }
WaveEngine >> addSubExecutor: anInitialSequence [
	| se |
	se := SubExecutor initialSequence: anInitialSequence engine: self.
	se startSubExecutor.
	subExecutors add: se.
]

{ #category : #accessing }
WaveEngine >> engineAnnouncer [
	^ engineAnnouncer 
]

{ #category : #accessing }
WaveEngine >> engineAnnouncer: anAnnouncer [
	engineAnnouncer := anAnnouncer 
]

{ #category : #accessing }
WaveEngine >> initialize [ 
	super initialize.
	self joinHandler: (JoinHandler context: self).
	self subExecutors: OrderedCollection new.
	self engineAnnouncer: Announcer new.
	workList := WaveWorkList new.
	activations := Dictionary new.
	scheduler := TaskScheduler new.
	scheduler start.
]

{ #category : #accessing }
WaveEngine >> joinHandler [
	^ joinHandler 
]

{ #category : #accessing }
WaveEngine >> joinHandler: aJoinHandler [
	joinHandler := aJoinHandler 
]

{ #category : #accessing }
WaveEngine >> logNewActivation: anActivation on: anExecutor forNode: aNode [
"TODO when adding a history"


]

{ #category : #accessing }
WaveEngine >> mainExecutor [
	^ mainExecutor
]

{ #category : #accessing }
WaveEngine >> mainExecutor: executors [
	mainExecutor := executors 
]

{ #category : #accessing }
WaveEngine >> scheduler [
	^ scheduler
]

{ #category : #accessing }
WaveEngine >> startEngine [
	mainExecutor tryToExecuteNext.
	mainExecutor waveAnnouncer announce: StartAnnouncer new.
]

{ #category : #accessing }
WaveEngine >> stopEngine [
	scheduler stop.
]

{ #category : #accessing }
WaveEngine >> subExecutors [
	^ subExecutors 
]

{ #category : #accessing }
WaveEngine >> subExecutors: aSubExecutor [
	subExecutors := aSubExecutor 
]

{ #category : #accessing }
WaveEngine >> workList [
	^ workList
]
