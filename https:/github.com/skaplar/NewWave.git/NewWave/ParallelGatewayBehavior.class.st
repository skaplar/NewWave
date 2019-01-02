Class {
	#name : #ParallelGatewayBehavior,
	#superclass : #EventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
ParallelGatewayBehavior >> performExecution: elemToExecute executor: wave [
	| rez |
	rez := elemToExecute outgoingFlows do: [ :each | | se we | we := WaveExecutor initialNode: each targetRef. se := SubExecutor new. se executor: we. se startSubExecutor ].
	"rez ifNotNil: [ wave flowHandler node: rez targetRef. wave tryToExecuteNext ]."
	
]
