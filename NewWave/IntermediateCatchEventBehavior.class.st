Class {
	#name : #IntermediateCatchEventBehavior,
	#superclass : #EventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
IntermediateCatchEventBehavior >> performExecution: elemToExecute executor: wave [
	elemToExecute eventDefinitions do: [ :each |
		wave engine scheduler doOnce: ['Uradi nesto ' logCr. wave tryToExecuteNext: elemToExecute.]
    		at: (DateAndTime now + 10 seconds).
	].
]
