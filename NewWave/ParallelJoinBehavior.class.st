"
I am a join that comes after parallel split, my job is to join multiple executions into one.
"
Class {
	#name : #ParallelJoinBehavior,
	#superclass : #EventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
ParallelJoinBehavior >> performExecution: elemToExecute executor: wave [
	| sequence |
	sequence := wave flowHandler sequences at: (wave flowHandler sequences size -1).
	wave engine engineAnnouncer announce: (JoinEventAnnouncer with: sequence executor: wave ).
	"wave waveAnnouncer announce: JoinEventAnnouncer new."
	
	
]
