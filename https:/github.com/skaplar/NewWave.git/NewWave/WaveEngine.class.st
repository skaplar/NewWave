Class {
	#name : #WaveEngine,
	#superclass : #Object,
	#instVars : [
		'mainExecutor',
		'joinHandler',
		'subExecutors',
		'engineAnnouncer'
	],
	#category : #'NewWave-Engine'
}

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
			rez ifTrue: [ mainExecutor flowHandler node: tmpExecutor returnNodeAfterJoin. mainExecutor tryToExecuteNextOnWorker.].
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
WaveEngine >> mainExecutor [
	^ mainExecutor
]

{ #category : #accessing }
WaveEngine >> mainExecutor: executors [
	mainExecutor := executors 
]

{ #category : #accessing }
WaveEngine >> startEngine [
	mainExecutor tryToExecuteNext.
	mainExecutor waveAnnouncer announce: StartAnnouncer new.
]

{ #category : #accessing }
WaveEngine >> subExecutors [
	^ subExecutors 
]

{ #category : #accessing }
WaveEngine >> subExecutors: aSubExecutor [
	subExecutors := aSubExecutor 
]
