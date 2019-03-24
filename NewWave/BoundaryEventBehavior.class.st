Class {
	#name : #BoundaryEventBehavior,
	#superclass : #EventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
BoundaryEventBehavior >> performExecution: elemToExecute executor: wave [
	'Executuje se boundary' logCr.
	"elemToExecute eventDefinitions do: [ :each |
		wave engine scheduler doOnce: ['Uradi nesto ' logCr. wave tryToExecuteNext: elemToExecute.]
    		at: (DateAndTime now + 10 seconds).
	]."
]
