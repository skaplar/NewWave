Class {
	#name : #SubExecutor,
	#superclass : #Object,
	#instVars : [
		'executor',
		'engine'
	],
	#category : #'NewWave-Engine'
}

{ #category : #'as yet unclassified' }
SubExecutor class >> initialNode: node parentExecutor: executor [
	^ self new 
		executor: (WaveExecutor initialNode: node engine: executor);
		parentExecutor: executor;
		yourself.
]

{ #category : #'as yet unclassified' }
SubExecutor class >> initialSequence: sequence engine: executor [
	| we |
	we := WaveExecutor initialNode: sequence targetRef engine: executor.
	we flowHandler addSequence: sequence.
	^ self new 
		executor: we;
		engine: executor;
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
SubExecutor >> startSubExecutor [
	| worker |
	worker := TKTWorker new.
	worker start.
	('Starting worker on SUB-process ', Processor activeProcess identityHash asString) logCr.
	('SUB-Worker process is ', worker process identityHash asString ) logCr.
	executor workers at: worker name put: worker.
	executor flowHandler workerid: worker name.
	executor tryToExecuteNext.
	
]
