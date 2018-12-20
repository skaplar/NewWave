Class {
	#name : #ExclusiveGatewayBehavior,
	#superclass : #EventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #'as yet unclassified' }
ExclusiveGatewayBehavior >> performExecution: elemToExecute executor: wave [
	| rez tktElem seqTrenutna condition sledeca|
	"elemToExecute mi je gateway/exclusive 
	treba da proverim uslov u seqvenci u kojoj je src gateway i da dobavim neki od sledecih sekvenci"
	
	seqTrenutna := wave flowHandler node incomingFlows first.
	seqTrenutna sourceRef logCr.
	'ovo gore ' logCr.
	
	rez := seqTrenutna sourceRef outgoingFlows detect: [ :each | wave taskResult = each condition].
	rez ifNotNil: [ wave flowHandler node: rez targetRef. wave shouldExecuteNextNewHandler ].
	
]
