Class {
	#name : #SubExecutor,
	#superclass : #Object,
	#instVars : [
		'executor',
		'parentExecutor',
		'joinAnnouncer'
	],
	#category : #'NewWave-Engine'
}

{ #category : #finalization }
SubExecutor >> executor [ 
	^ executor
]

{ #category : #finalization }
SubExecutor >> executor: anExecutor [ 
	executor := anExecutor
]

{ #category : #finalization }
SubExecutor >> joinAnnouncer [
	^ joinAnnouncer
]

{ #category : #finalization }
SubExecutor >> joinAnnouncer: anAnnouncer [ 
	joinAnnouncer := anAnnouncer
]

{ #category : #finalization }
SubExecutor >> parentExecutor [
	^ parentExecutor
]

{ #category : #finalization }
SubExecutor >> parentExecutor: anExecutor [ 
	parentExecutor := anExecutor
]

{ #category : #finalization }
SubExecutor >> startSubExecutor [
	| worker |
	worker := TKTWorker new.
	worker start.
	('Starting worker on SUB-process ', Processor activeProcess identityHash asString) logCr.
	('SUB-Worker name ', worker name) logCr.
	('SUB-Worker name ', worker process identityHash asString ) logCr.
	executor workers at: worker name put: worker.
	executor flowHandler workerid: worker name.
	executor waveAnnouncer subscribe: JoinEventAnnouncer 
		do: [ 		
			parentExecutor joinHandler addSequenceToExecutors: executor flowHandler currSeq.
			executor worker stop.
		].
	executor tryToExecuteNext.
]
