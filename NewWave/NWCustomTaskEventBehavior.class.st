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
	"If no group or user assigned we should stop the execution.
	return false clearly should not stand here and I should decide what to do with it"
	(self taskHasUserOrGroup: elemToExecute) ifFalse: [ ^ false. ].
	taskWrapper := waveExecutor processHandler addTaskToServer: elemToExecute.
	waveExecutor processHandler engineAnnouncer
		when: WaveAnnouncer
		do: [ :a |
			a parameter traceCr.
			waveExecutor taskResult: a parameter.
			waveExecutor processHandler addDataObjectFromServer: a parameter.
			waveExecutor processHandler engine server removeTask: taskWrapper user: (elemToExecute user username).
			waveExecutor tryToExecuteNext: elemToExecute ].
	elemToExecute value
]
