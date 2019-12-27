"
I am a join that comes after parallel split, my job is to join multiple executions into one.
"
Class {
	#name : #NWParallelJoinBehavior,
	#superclass : #NWEventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
NWParallelJoinBehavior >> performExecution: elemToExecute executor: waveExecutor [
	| sequence |
	sequence := waveExecutor flowHandler sequences at: (waveExecutor flowHandler sequences size -1).
	waveExecutor processHandler engineAnnouncer announce: (JoinEventAnnouncer with: sequence executor: waveExecutor).
	"wave waveAnnouncer announce: JoinEventAnnouncer new."
	
	
]
