"
I am a class that is used to execute CustomTask.
"
Class {
	#name : #NWCustomTaskEventBehavior,
	#superclass : #NWActivityEventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
NWCustomTaskEventBehavior >> performExecution: elemToExecute executor: waveExecutor [
	| taskWrapper |
	super performExecution: elemToExecute executor: waveExecutor.
	taskWrapper := waveExecutor processHandler addTaskToServer: elemToExecute user: 'default'.
	waveExecutor processHandler engineAnnouncer
		when: WaveAnnouncer
		do: [ :a |
			a parameter traceCr.
			waveExecutor taskResult: a parameter.
			waveExecutor processHandler addDataObjectFromServer: a parameter.
			waveExecutor processHandler engine server removeTask: taskWrapper user: 'default'.
			waveExecutor tryToExecuteNext: elemToExecute ].
	elemToExecute value
]
