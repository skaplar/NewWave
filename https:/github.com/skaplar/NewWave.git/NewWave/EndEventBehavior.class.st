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
	('Ending worker name ', wave worker name) logCr.
	('Worker name ', wave worker process identityHash asString ) logCr.
	wave worker stop.
	
]
