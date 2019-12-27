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
	#name : #NWSequence,
	#superclass : #NWElement,
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
NWSequence class >> source: aSource target: aTarget [
	^ self new 
		sourceRef: aSource;
		targetRef: aTarget;
		yourself
]

{ #category : #'as yet unclassified' }
NWSequence class >> source: aSource target: aTarget condition: aCondition [
	^  (self source: aSource target: aTarget)
		condition: aCondition;
		yourself
]

{ #category : #adding }
NWSequence >> addIncoming: anActivity [
	incoming add: anActivity.
]

{ #category : #adding }
NWSequence >> addOutgoing: anActivity [
	outgoing add: anActivity.
]

{ #category : #adding }
NWSequence >> condition [
	^ condition
]

{ #category : #adding }
NWSequence >> condition: aCondition [
	condition := aCondition
]

{ #category : #adding }
NWSequence >> ctype [
	^ #NWSequence
]

{ #category : #initialization }
NWSequence >> initialize [

	super initialize.
	self srcFetched: false.
	self targetFetched: false.
	outgoing := OrderedCollection new.
	incoming := OrderedCollection new.
]

{ #category : #adding }
NWSequence >> sourceRef [
	^ sourceRef
]

{ #category : #adding }
NWSequence >> sourceRef: anObject [
	sourceRef := anObject 
]

{ #category : #adding }
NWSequence >> srcFetched [
	^ srcFetched
]

{ #category : #adding }
NWSequence >> srcFetched: anObject [
	srcFetched := anObject
]

{ #category : #adding }
NWSequence >> targetFetched [
	^ targetFetched
]

{ #category : #adding }
NWSequence >> targetFetched: anObject [
	targetFetched := anObject
]

{ #category : #adding }
NWSequence >> targetRef [
	^ targetRef
]

{ #category : #adding }
NWSequence >> targetRef: anObject [
	targetRef := anObject 
]
