Class {
	#name : #ElementContainer,
	#superclass : #Element,
	#instVars : [
		'elements',
		'sequenceFlows'
	],
	#category : #'NewWave-Core'
}

{ #category : #initialization }
ElementContainer >> addSequenceFlow: anElement [
	sequenceFlows add: anElement.
]

{ #category : #initialization }
ElementContainer >> initialize [
	super initialize.
	elements := OrderedCollection new.
	sequenceFlows := OrderedCollection new.
]
