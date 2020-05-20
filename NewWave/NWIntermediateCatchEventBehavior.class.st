Class {
	#name : #NWIntermediateCatchEventBehavior,
	#superclass : #NWEventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
NWIntermediateCatchEventBehavior >> performExecution: elemToExecute executor: waveExecutor [
	elemToExecute eventDefinitions do: [ :each |
		waveExecutor processHandler processScheduler 
		do: [ 
			waveExecutor tryToExecuteNext: elemToExecute. 
		] 
		at: each timeDate 
		every: each every.
		"wave engine scheduler doOnce: ['Uradi nesto ' logCr. wave tryToExecuteNext: elemToExecute.]
    		at: (DateAndTime now + 10 seconds)."
	].
]
