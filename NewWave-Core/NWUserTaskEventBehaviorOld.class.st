Class {
	#name : #NWUserTaskEventBehaviorOld,
	#superclass : #NWActivityEventBehavior,
	#category : #'NewWave-Core-Engine'
}

{ #category : #accessing }
NWUserTaskEventBehaviorOld >> performExecution: elemToExecute executor: waveExecutor [
	super performExecution: elemToExecute  executor: waveExecutor.
	elemToExecute announcer 
		when: WaveAnnouncer
		do: [ :a |
			waveExecutor taskResult: a parameter. 
			waveExecutor tryToExecuteNext: elemToExecute.].
	elemToExecute value.
]
