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
	"elemToExecute mi je gateway/exclusive 
	treba da proverim uslov u seqvenci u kojoj je src gateway i da dobavim neki od sledecih sekvenci"
	rez := elemToExecute outgoingFlows detect: [ :each | wave taskResult = each condition].
	rez ifNotNil: [ wave flowHandler node: rez targetRef. wave tryToExecuteNext ].
	
]
