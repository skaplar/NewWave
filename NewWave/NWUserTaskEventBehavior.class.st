Class {
	#name : #NWUserTaskEventBehavior,
	#superclass : #NWActivityEventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
NWUserTaskEventBehavior >> performExecution: elemToExecute executor: waveExecutor [
	super performExecution: elemToExecute  executor: waveExecutor.
	'ovaj' logCr.
	elemToExecute announcer 
		when: WaveAnnouncer
		do: [ :a |
			a parameter logCr. 
			waveExecutor taskResult: a parameter. 
			waveExecutor tryToExecuteNext: elemToExecute.].
	elemToExecute value.
]
