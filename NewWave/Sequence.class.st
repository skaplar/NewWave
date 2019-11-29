"
I am a sequence in the Workflow. I contain two nodes (source and target), and I am used in forming the workflow.

    Instance Variables
	condition:		<Object>
	incoming:		<Object>
	outgoing:		<Object>
	sourceRef:		<Object>
	srcFetched:		<Object>
	targetFetched:		<Object>
	targetRef:		<Object>


    Implementation Points
"
Class {
	#name : #Sequence,
	#superclass : #Element,
	#instVars : [
		'incoming',
		'outgoing',
		'sourceRef',
		'targetRef',
		'srcFetched',
		'targetFetched',
		'condition'
	],
	#category : #'NewWave-Core'
}

{ #category : #'as yet unclassified' }
Sequence class >> source: aSource target: aTarget [
	^ self new 
		sourceRef: aSource;
		targetRef: aTarget;
		yourself
]

{ #category : #'as yet unclassified' }
Sequence class >> source: aSource target: aTarget condition: aCondition [
	^  (self source: aSource target: aTarget)
		condition: aCondition;
		yourself
]

{ #category : #adding }
Sequence >> addIncoming: anActivity [
	incoming add: anActivity.
]

{ #category : #adding }
Sequence >> addOutgoing: anActivity [
	outgoing add: anActivity.
]

{ #category : #adding }
Sequence >> condition [
	^ condition
]

{ #category : #adding }
Sequence >> condition: aCondition [
	condition := aCondition
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
