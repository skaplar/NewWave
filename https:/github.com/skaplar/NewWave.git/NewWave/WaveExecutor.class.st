Class {
	#name : #WaveExecutor,
	#superclass : #Object,
	#instVars : [
		'elements',
		'currSeq',
		'waveAnnouncer',
		'taskResult',
		'flowHandler',
		'workers',
		'subProcList',
		'subExecutors',
		'joinHandler'
	],
	#category : #'NewWave-Engine'
}

{ #category : #'as yet unclassified' }
WaveExecutor class >> initialNode: node [
	| fh |
	fh := FlowHandler new.
	fh node: node.
	^ self new 
		flowHandler: fh;
		yourself
]

{ #category : #running }
WaveExecutor >> execute: elem [
	| elemHandler executor |
	elemHandler := BehaviorHandler new.
	executor := elemHandler behaviors at: elem ctype.
	executor performExecution: elem executor: self.
	
	
	
	
]

{ #category : #accessing }
WaveExecutor >> flowHandler [
	^ flowHandler
]

{ #category : #accessing }
WaveExecutor >> flowHandler: aFlowHandler [
	flowHandler := aFlowHandler
]

{ #category : #initialization }
WaveExecutor >> initialize [

	super initialize.
	self waveAnnouncer: Announcer new.
	self workers: Dictionary new.
	self joinHandler: JoinHandler new.
]

{ #category : #accessing }
WaveExecutor >> joinHandler [
	^ joinHandler
]

{ #category : #accessing }
WaveExecutor >> joinHandler: aJoinHandler [
	joinHandler := aJoinHandler
]

{ #category : #'as yet unclassified' }
WaveExecutor >> returnTKT: aTask [
	^ TKTTask valuable: aTask.
]

{ #category : #accessing }
WaveExecutor >> shouldExecuteNextNewHandler [
	| tmp |
	tmp := flowHandler getNextElement.
	tmp ifNil: [ ^ nil ] ifNotNil: [ ^ tmp ].
]

{ #category : #running }
WaveExecutor >> subExecutors [
	^ subExecutors
]

{ #category : #running }
WaveExecutor >> subExecutors: asubExecutors [
	subExecutors := asubExecutors
]

{ #category : #accessing }
WaveExecutor >> taskResult [
	^ taskResult
]

{ #category : #accessing }
WaveExecutor >> taskResult: anObject [
	taskResult := anObject
]

{ #category : #tests }
WaveExecutor >> testExe [
| future |
future := [ 1 second wait. 2 + 2 ] future.
future onSuccessDo: [ :v | v logCr ].
]

{ #category : #accessing }
WaveExecutor >> tryToExecuteNext [
	| tmp |
	tmp := self shouldExecuteNextNewHandler.
	tmp ifNil: ['End of executing' logCr. ] ifNotNil: [self execute:tmp]
]

{ #category : #accessing }
WaveExecutor >> waveAnnouncer [
	^ waveAnnouncer
]

{ #category : #accessing }
WaveExecutor >> waveAnnouncer: anObject [
	waveAnnouncer := anObject
]

{ #category : #accessing }
WaveExecutor >> worker [
	^ workers at: flowHandler workerid.
]

{ #category : #running }
WaveExecutor >> workers [
	^ workers
]

{ #category : #running }
WaveExecutor >> workers: aWorkers [
	workers := aWorkers
]
