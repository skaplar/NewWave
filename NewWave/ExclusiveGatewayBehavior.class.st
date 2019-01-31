"
I am a class that chooses one route of execution.
"
Class {
	#name : #ExclusiveGatewayBehavior,
	#superclass : #EventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #'as yet unclassified' }
ExclusiveGatewayBehavior >> performExecution: elemToExecute executor: wave [
	| rez |
	"elemToExecute is gateway/exclusive 
	I should check the condition in sequence, which is in src gateway and get the next seq to execute"
	"rez := elemToExecute outgoingFlows detect: [ :each | wave taskResult = each condition].
	I expect for condition to be a block, and the block is passed the result of some execution, if block returns true then that seq is selected
	I should think about default gateway, if nothing is true
	And also think about multiple params to block"
	rez := elemToExecute outgoingFlows detect: [ :each | each condition value: wave taskResult].
	rez ifNotNil: [ wave flowHandler node: rez targetRef. wave tryToExecuteNext ].
	
]
