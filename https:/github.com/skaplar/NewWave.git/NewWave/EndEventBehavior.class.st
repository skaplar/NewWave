Class {
	#name : #EndEventBehavior,
	#superclass : #EventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #'as yet unclassified' }
EndEventBehavior >> performExecution: elemToExecute executor: wave [
	| aFuture |
	aFuture := [ 1 second wait. elemToExecute value ] future.
	aFuture onSuccessDo: [ :v | v logCr. wave shouldExecuteNextNewHandler ].
]
