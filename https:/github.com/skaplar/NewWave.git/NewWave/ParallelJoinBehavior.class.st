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
	wave waveAnnouncer announce: JoinEventAnnouncer new.
	
	"| rez |
	rez := elemToExecute outgoingFlows do: [ :each | | se we | we := WaveExecutor initialNode: each targetRef. se := SubExecutor new. se executor: we. se startSubExecutor ].
	rez ifNotNil: [ wave flowHandler node: rez targetRef. wave tryToExecuteNext ]."
	
]
