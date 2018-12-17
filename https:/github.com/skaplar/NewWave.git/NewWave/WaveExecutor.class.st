Class {
	#name : #WaveExecutor,
	#superclass : #Object,
	#instVars : [
		'elements',
		'currSeq',
		'index',
		'seqHandler',
		'waveAnnouncer'
	],
	#category : #'NewWave-Engine'
}

{ #category : #running }
WaveExecutor >> execute: elem [
	| elemHandler executor |
	elemHandler := BehaviorHandler new.
	executor := elemHandler behaviors at: elem ctype.
	executor sayHello.
	
	
	
	
]

{ #category : #accessing }
WaveExecutor >> executeT: elem [
	| aFuture |
	aFuture := [ 1 second wait. elem value ] future.
	aFuture onSuccessDo: [ :v | v logCr. self shouldExecuteNext ].
]

{ #category : #accessing }
WaveExecutor >> getNextElement [ 
	^ elements at: index ifAbsent: [ ^ nil ].
]

{ #category : #accessing }
WaveExecutor >> index [
	^ index
]

{ #category : #accessing }
WaveExecutor >> index: anInteger [
	index := anInteger 
]

{ #category : #initialization }
WaveExecutor >> initialize [

	super initialize.
	self index: 1.
	self waveAnnouncer: Announcer new.
]

{ #category : #'as yet unclassified' }
WaveExecutor >> returnTKT: aTask [
	^ TKTTask valuable: aTask.
]

{ #category : #accessing }
WaveExecutor >> sayHello [
	'Hello ' logCr.
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
	tmp ifNil: ['End of executing' logCr. ] ifNotNil: [self executeT:(self returnTKT: tmp)]
]

{ #category : #accessing }
WaveExecutor >> startExecuting [
	| elem|
	'Starting execution ' logCr.
	elem := seqHandler getElementToExecute2.
	"elem isEvent 
	ifTrue: [ 
		waveAnnouncer subscribe: ExampleAnnouncer do: [ self executeT: self seqHandler 									getElementToExecute2  ] ] 
	ifFalse: [  
		self executeT:(self returnTKT: elem). 
	]."
	self execute: elem.
	"self executeT:(self returnTKT: elem)."

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
