Class {
	#name : #SubExecutor,
	#superclass : #Object,
	#instVars : [
		'executor',
		'parentExecutor'
	],
	#category : #'NewWave-Engine'
}

{ #category : #'as yet unclassified' }
SubExecutor class >> initialNode: node parentExecutor: executor [
	^ self new 
		executor: (WaveExecutor initialNode: node);
		parentExecutor: executor;
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
	('SUB-Worker process is ', worker process identityHash asString ) logCr.
	executor workers at: worker name put: worker.
	executor flowHandler workerid: worker name.
	executor waveAnnouncer subscribe: JoinEventAnnouncer 
		do: [ 	
			| tmpExecutor rez |
			"tmpExecutor := parentExecutor joinHandler addSequenceToExecutors: executor flowHandler currSeq. Razmisli o ovome jos"
			tmpExecutor := parentExecutor joinHandler addSequenceToExecutors: (executor flowHandler sequences at: (executor flowHandler sequences size -1)).
			rez := parentExecutor joinHandler checkIsExecutorCompleted: tmpExecutor.
			rez ifTrue: [ parentExecutor flowHandler node: tmpExecutor returnNodeAfterJoin. parentExecutor tryToExecuteNextOnWorker.].
			"rez ifTrue: [parentExecutor flowHandler node: tmpExecutor continueAfterJoin. parentExecutor  waveAnnouncer announce: JoinCompletedEventAnnouncer new.]."
			('Ending-SUB-Worker process is ', worker process identityHash asString) logCr.
			executor worker stop.
		].
	executor tryToExecuteNext.
	
]
