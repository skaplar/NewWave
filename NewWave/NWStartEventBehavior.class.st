"
I am a class that starts the execution. When the new announcment is sent execution will be started.
"
Class {
	#name : #NWStartEventBehavior,
	#superclass : #NWEventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #'as yet unclassified' }
NWStartEventBehavior >> performExecution: elemToExecute executor: waveExecutor [
	waveExecutor waveAnnouncer
		when: StartAnnouncer
		do: [ | worker aRunner |
			"aRunner := TKTNewProcessTaskRunner new.
			aRunner schedule: [ 
				I want to examine this more thoroughly"
			worker := TKTWorker new.
			worker start.
			('Starting worker on process '
				, Processor activeProcess identityHash asString) traceCr.
			('Worker process is ' , worker process identityHash asString)
				traceCr.
			waveExecutor workers at: worker name put: worker.
			waveExecutor flowHandler workerid: worker name.
			waveExecutor tryToExecuteNext: elemToExecute ]
		" ]. "
]
