Class {
	#name : #DataAssociation,
	#superclass : #Element,
	#instVars : [
		'sourceRef',
		'targetRef'
	],
	#category : #'NewWave-Core'
}

{ #category : #'as yet unclassified' }
DataAssociation class >> sourceRef: src targetRef: target [
	^ self new 
		sourceRef: src;
		targetRef: target;
		yourself
]

{ #category : #accessing }
DataAssociation >> sourceRef [
	^ sourceRef
]

{ #category : #accessing }
DataAssociation >> sourceRef: anObject [
	sourceRef := anObject
]

{ #category : #accessing }
DataAssociation >> targetRef [
	^ targetRef
]

{ #category : #accessing }
DataAssociation >> targetRef: anObject [
	targetRef := anObject
]
