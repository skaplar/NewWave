Class {
	#name : #FUDOMagritteContainerCreator,
	#superclass : #Object,
	#instVars : [
		'do'
	],
	#category : #'NewWaveFieldUserTask-ObjectPreparator'
}

{ #category : #'as yet unclassified' }
FUDOMagritteContainerCreator class >> dataObject: do [ 
	^ self new
	do: do;
	yourself
]

{ #category : #'as yet unclassified' }
FUDOMagritteContainerCreator >> createMaContainer [ 
	| maContainer |
	maContainer := MAPriorityContainer new.
	maContainer propertyAt: #label put: do className1. 
	maContainer addAll: self createMaDescriptions.
	^ maContainer
]

{ #category : #'as yet unclassified' }
FUDOMagritteContainerCreator >> createMaDescriptions [ 
	| madesc |
	^ do properties collect: [ :each |
		| el |
		madesc := FUDODescriptionSelector new.
		el := madesc descriptionDictionary at: each varType.
		el
			accessor: (each varName) asSymbol;
			label: each varValue;
			priority: 10.
	].
]

{ #category : #accessing }
FUDOMagritteContainerCreator >> do [
	^ do
]

{ #category : #accessing }
FUDOMagritteContainerCreator >> do: anObject [
	do := anObject
]

{ #category : #initialization }
FUDOMagritteContainerCreator >> initialize [ 
	super initialize.
]
