Class {
	#name : #NWBoundaryEventBehavior,
	#superclass : #NWEventBehavior,
	#category : #'NewWave-Core-Engine'
}

{ #category : #accessing }
NWBoundaryEventBehavior >> performExecution: elemToExecute executor: waveExecutor [
	'Executuje se boundary' traceCr.
	"elemToExecute eventDefinitions do: [ :each |
		wave engine scheduler doOnce: ['Uradi nesto ' logCr. wave tryToExecuteNext: elemToExecute.]
    		at: (DateAndTime now + 10 seconds).
	].
	wave engine scheduler doOnce: [wave engine mainExecutor flowHandler node: elemToExecute outgoingFlows first targetRef. wave tryToExecuteNext: elemToExecute.]
    		at: (DateAndTime now + 10 seconds)."
	"waveExecutor scheduledTasks at: elemToExecute put: OrderedCollection new."
	elemToExecute eventDefinitions
		do: [ :each |
			waveExecutor processHandler processScheduler 
				do: [ waveExecutor processHandler
					addSubExecutor: elemToExecute outgoingFlows first.
					" Razmisli o ovome jos malo, u sustini za sada samo otkazujem executor sa koga je stiglo."
					elemToExecute cancelActivity
						ifTrue: [ waveExecutor worker stop ] ]
				at: each timeDate
				every: each every.
				]
]
