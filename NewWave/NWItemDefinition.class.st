Class {
	#name : #NWItemDefinition,
	#superclass : #NWElement,
	#instVars : [
		'itemKind',
		'structureRef',
		'isCollection'
	],
	#category : #'NewWave-Core'
}

{ #category : #accessing }
NWItemDefinition >> isCollection1 [
	^ isCollection
]

{ #category : #accessing }
NWItemDefinition >> isCollection: anObject [
	isCollection := anObject
]

{ #category : #accessing }
NWItemDefinition >> itemKind [
	^ itemKind
]

{ #category : #accessing }
NWItemDefinition >> itemKind: anObject [
	itemKind := anObject
]

{ #category : #accessing }
NWItemDefinition >> structureRef [
	^ structureRef
]

{ #category : #accessing }
NWItemDefinition >> structureRef: anObject [
	structureRef := anObject
]
