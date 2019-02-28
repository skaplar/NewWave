Class {
	#name : #ManualTaskEventBehavior,
	#superclass : #EventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
ManualTaskEventBehavior >> performExecution: elemToExecute executor: wave [
	elemToExecute announcer subscribe: WaveAnnouncer
		do: [ :a | a parameter logCr. wave taskResult: a parameter. wave tryToExecuteNext: elemToExecute.].
	elemToExecute value.
]
