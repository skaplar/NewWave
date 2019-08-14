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
	].
	wave engine scheduler doOnce: [wave engine mainExecutor flowHandler node: elemToExecute outgoingFlows first targetRef. wave tryToExecuteNext: elemToExecute.]
    		at: (DateAndTime now + 10 seconds)."
		
	elemToExecute eventDefinitions do: [ :each |
		wave engine scheduler 
		do: [ 
			wave engine addSubExecutor: elemToExecute outgoingFlows first.
			" Razmisli o ovome jos malo, u sustini za sada samo otkazujem executor sa koga je stiglo."
			elemToExecute cancelActivity ifTrue: [ wave worker stop ]. 
		] 
		at: each timeDate 
		every: each every.
	].
]
