"
I am a class that executes the tasks,
"
Class {
	#name : #TaskEventBehavior,
	#superclass : #ActivityEventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #'as yet unclassified' }
TaskEventBehavior >> performExecution: elemToExecute executor: waveExecutor [ 
	| aFuture tktElem |
	super performExecution: elemToExecute  executor: waveExecutor. 
	tktElem := waveExecutor returnTKT: elemToExecute.
	aFuture := waveExecutor worker future: [ tktElem value ].
	aFuture onSuccessDo: [ :v |  v logCr. waveExecutor taskResult: v. waveExecutor tryToExecuteNext: elemToExecute ].
	aFuture onFailureDo: [ :v | 'failed' logCr. v logCr. ]
]
