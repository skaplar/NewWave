Class {
	#name : #UserTaskEventBehavior,
	#superclass : #ActivityEventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
UserTaskEventBehavior >> performExecution: elemToExecute executor: waveExecutor [
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
