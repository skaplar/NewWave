"
I am an element container. I can contain elements and sequences. 

    Instance Variables
	elements:		<Object>
	sequenceFlows:		<Object>


    Implementation Points
"
Class {
	#name : #NWElementContainer,
	#superclass : #NWElement,
	#instVars : [
		'elements',
		'sequenceFlows'
	],
	#category : #'NewWave-Core-Core'
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
