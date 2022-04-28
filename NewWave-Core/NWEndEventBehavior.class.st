"
I am a class that ends one event. My job is to stop the worker on which the tasks were executed.
"
Class {
	#name : #NWEndEventBehavior,
	#superclass : #NWEventBehavior,
	#category : #'NewWave-Core-Engine'
}

{ #category : #'as yet unclassified' }
NWEndEventBehavior >> performExecution: elemToExecute executor: waveExecutor [
	"Here I should clean up everything related to this execution."

	"wave flowHandler node: nil."

	('Ending worker on process '
		, Processor activeProcess identityHash asString) traceCr.
	('Worker process is ' , waveExecutor worker process identityHash asString)
		traceCr.
	"wave workList addToCompleted: (wave activationForNode: elemToExecute)."
	"wave engine workList completed asString logCr.
	wave engine workList running asString logCr."

	" Kad se zaustavi glavni executor zaustavi i task scheduler"
	waveExecutor processHandler mainExecutor = waveExecutor
		ifTrue: [ "wave engine scheduler stop."  ].
	waveExecutor processHandler processScheduler stop.
	waveExecutor worker stop
]
