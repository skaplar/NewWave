Class {
	#name : #ParallelJoinBehavior,
	#superclass : #EventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
ParallelJoinBehavior >> performExecution: elemToExecute executor: wave [
	wave flowHandler sequence.
	wave waveAnnouncer announce: JoinEventAnnouncer new.
	
	"| rez |
	rez := elemToExecute outgoingFlows do: [ :each | | se we | we := WaveExecutor initialNode: each targetRef. se := SubExecutor new. se executor: we. se startSubExecutor ].
	rez ifNotNil: [ wave flowHandler node: rez targetRef. wave tryToExecuteNext ]."
	
]
