Class {
	#name : #TaskEventBehavior,
	#superclass : #EventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #'as yet unclassified' }
TaskEventBehavior >> performExecution: elemToExecute executor: wave [
	| aFuture tktElem |
	tktElem := wave returnTKT: elemToExecute.
	aFuture := [ 1 second wait. tktElem value ] future.
	aFuture onSuccessDo: [ :v | v logCr. wave taskResult: v. wave shouldExecuteNextNewHandler ].
]
