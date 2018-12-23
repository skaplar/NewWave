Class {
	#name : #StartEventBehavior,
	#superclass : #EventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #'as yet unclassified' }
StartEventBehavior >> performExecution: elemToExecute executor: wave [
	"wave waveAnnouncer subscribe: ExampleAnnouncer 
		do: [ wave execute: (wave flowHandler getNextElement) ]"
	wave waveAnnouncer subscribe: ExampleAnnouncer 
		do: [ 
			| worker |
			worker := TKTWorker new.
			worker start.
			('Starting worker on process ', Processor activeProcess identityHash asString) logCr.
			('Worker name ', worker name) logCr.
			('Worker name ', worker process identityHash asString ) logCr.
			wave workers at: worker name put: worker.
			wave flowHandler workerid: worker name.
			wave execute: (wave flowHandler getNextElement) 
		]
]
