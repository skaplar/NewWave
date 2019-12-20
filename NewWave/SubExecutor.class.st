Class {
	#name : #SubExecutor,
	#superclass : #Object,
	#instVars : [
		'executor',
		'previousNode',
		'processHandler'
	],
	#category : #'NewWave-Engine'
}

{ #category : #'as yet unclassified' }
SubExecutor class >> initialSequence: sequence processHandler: aProcessHandler [
	| we |
	we := WaveExecutor initialNode: sequence targetRef processHandler: aProcessHandler.
	we flowHandler addSequence: sequence.
	^ self new 
		executor: we;
		processHandler: aProcessHandler;
		previousNode: sequence sourceRef;
		yourself.
]

{ #category : #finalization }
SubExecutor >> executor [ 
	^ executor
]

{ #category : #finalization }
SubExecutor >> executor: anExecutor [ 
	executor := anExecutor
]

{ #category : #finalization }
SubExecutor >> previousNode [
	^ previousNode  
]

{ #category : #finalization }
SubExecutor >> previousNode: aPreviousNode [
	previousNode := aPreviousNode 
]

{ #category : #finalization }
SubExecutor >> processHandler [
	^ processHandler
]

{ #category : #finalization }
SubExecutor >> processHandler: aProcessHandler [ 
	processHandler := aProcessHandler
]

{ #category : #finalization }
SubExecutor >> startSubExecutor [
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
