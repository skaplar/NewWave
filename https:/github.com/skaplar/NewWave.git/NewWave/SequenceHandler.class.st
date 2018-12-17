Class {
	#name : #SequenceHandler,
	#superclass : #Object,
	#instVars : [
		'sequence',
		'sequences',
		'index'
	],
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
SequenceHandler >> getElementToExecute [
	| seq |
	seq := self getNextSequence.
	seq srcFetched 
	ifFalse: [ seq srcFetched: true. ^ seq sourceRef ] 
	ifTrue: [ seq targetFetched: true. self index: index + 1. ^ seq targetRef ]. 
]

{ #category : #accessing }
SequenceHandler >> getElementToExecute2 [
	| seq |
	seq := self getNextSequence.
	seq ifNil: [
		self sequence targetFetched ifFalse: [ self sequence targetFetched: true. ^ self sequence targetRef] ifTrue: [ ^ nil ]. 
	] 
	ifNotNil: [
		self sequence: seq.  
		seq srcFetched 
		ifFalse: [ seq srcFetched: true. self index: index + 1. ^ seq sourceRef ] 
		ifTrue: [ 'This should not happend' logCr ]. 
	]
]

{ #category : #accessing }
SequenceHandler >> getNextSequence [
	^ sequences at: index ifAbsent: [ ^ nil ].
]

{ #category : #accessing }
SequenceHandler >> index [
	^ index
]

{ #category : #accessing }
SequenceHandler >> index: anObject [
	index:= anObject
]

{ #category : #initialization }
SequenceHandler >> initialize [
	super initialize.
	self index: 1.
]

{ #category : #accessing }
SequenceHandler >> sequence [
	^ sequence
]

{ #category : #accessing }
SequenceHandler >> sequence: anObject [
	sequence:= anObject
]

{ #category : #accessing }
SequenceHandler >> sequences [
	^ sequences
]

{ #category : #accessing }
SequenceHandler >> sequences: anObject [
	sequences:= anObject
]
