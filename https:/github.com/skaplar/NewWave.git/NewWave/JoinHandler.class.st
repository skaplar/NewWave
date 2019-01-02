Class {
	#name : #JoinHandler,
	#superclass : #Object,
	#instVars : [
		'joinExecutors'
	],
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
JoinHandler >> addIncomingSequence: aSequence [
	| jExecutor |
	jExecutor := joinExecutors select: [ :each | each joinNode equals: aSequence sourceRef ].
	jExecutor ifNil: [ 
		| je |
		je := JoinExecutor new.
		je joinNode: aSequence sourceRef.
		je addIncSequence: aSequence.
		self addJoinExecutor: je.	
	] ifNotNil: [ 
		jExecutor addIncSequence: aSequence.
		self checkIsExecutorCompleted: jExecutor.
	].
	
]

{ #category : #accessing }
JoinHandler >> addJoinExecutor: aJoinExecutor [
	joinExecutors add: aJoinExecutor 
]

{ #category : #accessing }
JoinHandler >> checkIsExecutorCompleted: jExecutor [
	jExecutor checkIsFinished ifTrue: [ 'Executor Completed' ] ifFalse: [ 'Executor Not completed' ] 
]

{ #category : #accessing }
JoinHandler >> initialize [ 
	super initialize.
	joinExecutors := OrderedCollection new.
]

{ #category : #accessing }
JoinHandler >> joinExecutors [
	^ joinExecutors
]
