Class {
	#name : #WaveExecutor,
	#superclass : #Object,
	#instVars : [
		'elements',
		'currSeq',
		'index',
		'seqHandler',
		'waveAnnouncer',
		'taskResult',
		'flowHandler'
	],
	#category : #'NewWave-Engine'
}

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
]

{ #category : #'as yet unclassified' }
WaveExecutor >> returnTKT: aTask [
	^ TKTTask valuable: aTask.
]

{ #category : #accessing }
WaveExecutor >> seqHandler [
	^ seqHandler 
	
]

{ #category : #accessing }
WaveExecutor >> seqHandler: anObject [
	seqHandler := anObject 
	
]

{ #category : #accessing }
WaveExecutor >> shouldExecuteNext [
	| tmp |
	tmp := seqHandler getElementToExecute2.
	"tmp ifNil: ['End of executing' logCr. ] ifNotNil: [self executeT:(self returnTKT: tmp)]"
	tmp ifNil: ['End of executing' logCr. ] ifNotNil: [self execute:tmp]
]

{ #category : #accessing }
WaveExecutor >> shouldExecuteNextNewHandler [
	| tmp |
	tmp := flowHandler getNextElement.
	tmp ifNil: ['End of executing' logCr. ] ifNotNil: [self execute:tmp]
]

{ #category : #accessing }
WaveExecutor >> startExecuting [
	| elem|
	'Starting execution ' logCr.
	elem := seqHandler getElementToExecute2.
	self execute: elem.

]

{ #category : #accessing }
WaveExecutor >> startExecutingNewHandler [
	| elem|
	'Starting execution ' logCr.
	elem := flowHandler getNextElement.
	self execute: elem.

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
WaveExecutor >> waveAnnouncer [
	^ waveAnnouncer
]

{ #category : #accessing }
WaveExecutor >> waveAnnouncer: anObject [
	waveAnnouncer := anObject
]
