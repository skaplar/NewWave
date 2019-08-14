Class {
	#name : #SubExecutor,
	#superclass : #Object,
	#instVars : [
		'executor',
		'engine',
		'previousNode'
	],
	#category : #'NewWave-Engine'
}

{ #category : #'as yet unclassified' }
SubExecutor class >> initialSequence: sequence engine: executor [
	| we |
	we := WaveExecutor initialNode: sequence targetRef engine: executor.
	we flowHandler addSequence: sequence.
	^ self new 
		executor: we;
		engine: executor;
		previousNode: sequence sourceRef;
		yourself.
]

{ #category : #finalization }
SubExecutor >> engine [
	^ engine
]

{ #category : #finalization }
SubExecutor >> engine: anExecutor [ 
	engine := anExecutor
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
SubExecutor >> startSubExecutor [
	| worker |
	worker := TKTWorker new.
	worker start.
	('Starting worker on SUB-process ', Processor activeProcess identityHash asString) logCr.
	('SUB-Worker process is ', worker process identityHash asString ) logCr.
	executor workers at: worker name put: worker.
	executor flowHandler workerid: worker name.
	executor tryToExecuteNext: previousNode.
	
]
