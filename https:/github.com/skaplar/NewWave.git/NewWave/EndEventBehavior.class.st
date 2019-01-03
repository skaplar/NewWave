"
I am a class that ends one event. My job is to stop the worker on which the tasks were executed.
"
Class {
	#name : #EndEventBehavior,
	#superclass : #EventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #'as yet unclassified' }
EndEventBehavior >> performExecution: elemToExecute executor: wave [
	"Here I should clean up everything related to this execution."
	"wave flowHandler node: nil."
	('Ending worker on process ', Processor activeProcess identityHash asString) logCr.
	('Worker process is ', wave worker process identityHash asString ) logCr.
	wave worker stop.
	
]
