Class {
	#name : #NWSubExecutor,
	#superclass : #Object,
	#instVars : [
		'executor',
		'previousNode',
		'processHandler'
	],
	#category : #'NewWave-Core-Engine'
}

{ #category : #'as yet unclassified' }
NWSubExecutor class >> initialSequence: sequence processHandler: aProcessHandler [
	| we |
	we := NWExecutor initialNode: sequence targetRef processHandler: aProcessHandler.
	we flowHandler addSequence: sequence.
	^ self new 
		executor: we;
		processHandler: aProcessHandler;
		previousNode: sequence sourceRef;
		yourself.
]

{ #category : #finalization }
NWSubExecutor >> executor [ 
	^ executor
]

{ #category : #finalization }
NWSubExecutor >> executor: anExecutor [ 
	executor := anExecutor
]

{ #category : #finalization }
NWSubExecutor >> previousNode [
	^ previousNode  
]

{ #category : #finalization }
NWSubExecutor >> previousNode: aPreviousNode [
	previousNode := aPreviousNode 
]

{ #category : #finalization }
NWSubExecutor >> processHandler [
	^ processHandler
]

{ #category : #finalization }
NWSubExecutor >> processHandler: aProcessHandler [ 
	processHandler := aProcessHandler
]

{ #category : #finalization }
NWSubExecutor >> startSubExecutor [
	| worker |
	worker := TKTWorker new.
	worker start.
	('Starting worker on SUB-process '
		, Processor activeProcess identityHash asString) traceCr.
	('SUB-Worker process is ' , worker process identityHash asString)
		traceCr.
	executor workers at: worker name put: worker.
	executor flowHandler workerid: worker name.
	executor tryToExecuteNext: previousNode
]
