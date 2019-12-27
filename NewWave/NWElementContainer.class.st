Class {
	#name : #NWElementContainer,
	#superclass : #NWElement,
	#instVars : [
		'elements',
		'sequenceFlows'
	],
	#category : #'NewWave-Core'
}

{ #category : #initialization }
NWElementContainer >> addSequenceFlow: anElement [
	sequenceFlows add: anElement.
]

{ #category : #initialization }
NWElementContainer >> initialize [
	super initialize.
	elements := OrderedCollection new.
	sequenceFlows := OrderedCollection new.
]
