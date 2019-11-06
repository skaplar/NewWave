Class {
	#name : #ItemDefinition,
	#superclass : #Element,
	#instVars : [
		'itemKind',
		'structureRef',
		'isCollection'
	],
	#category : #'NewWave-Core'
}

{ #category : #accessing }
ItemDefinition >> isCollection1 [
	^ isCollection
]

{ #category : #accessing }
ItemDefinition >> isCollection: anObject [
	isCollection := anObject
]

{ #category : #accessing }
ItemDefinition >> itemKind [
	^ itemKind
]

{ #category : #accessing }
ItemDefinition >> itemKind: anObject [
	itemKind := anObject
]

{ #category : #accessing }
ItemDefinition >> structureRef [
	^ structureRef
]

{ #category : #accessing }
ItemDefinition >> structureRef: anObject [
	structureRef := anObject
]
