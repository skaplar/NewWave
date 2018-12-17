Class {
	#name : #Sequence,
	#superclass : #Element,
	#instVars : [
		'incoming',
		'outgoing',
		'sourceRef',
		'targetRef',
		'srcFetched',
		'targetFetched'
	],
	#category : #NewWave
}

{ #category : #adding }
Sequence >> addIncoming: anActivity [
	incoming add: anActivity.
]

{ #category : #adding }
Sequence >> addOutgoing: anActivity [
	outgoing add: anActivity.
]

{ #category : #adding }
Sequence >> ctype [
	^ #Sequence
]

{ #category : #initialization }
Sequence >> initialize [

	super initialize.
	self srcFetched: false.
	self targetFetched: false.
	outgoing := OrderedCollection new.
	incoming := OrderedCollection new.
]

{ #category : #adding }
Sequence >> sourceRef [
	^ sourceRef
]

{ #category : #adding }
Sequence >> sourceRef: anObject [
	sourceRef := anObject 
]

{ #category : #adding }
Sequence >> srcFetched [
	^ srcFetched
]

{ #category : #adding }
Sequence >> srcFetched: anObject [
	srcFetched := anObject
]

{ #category : #adding }
Sequence >> targetFetched [
	^ targetFetched
]

{ #category : #adding }
Sequence >> targetFetched: anObject [
	targetFetched := anObject
]

{ #category : #adding }
Sequence >> targetRef [
	^ targetRef
]

{ #category : #adding }
Sequence >> targetRef: anObject [
	targetRef := anObject 
]
