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

{ #category : #adding }
FUDOMagritteContainerCreator >> addValues: anInstanceOfEntity [ 
	do properties do: [ :el | anInstanceOfEntity instVarNamed: el varName put: el varValue ].
	^ anInstanceOfEntity.
]

{ #category : #'as yet unclassified' }
FUDOMagritteContainerCreator >> createEntity [ 
| newClass x |
	newClass := Object subclass: do className1 instanceVariableNames: self generateInstanceVariables classVariableNames: '' package: 'NewWaveFieldUserTask-Entities'.
	"x := newClass new."
	^ self addValues: newClass new.
	"^ newClass."
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
			label: each varName;
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

{ #category : #'as yet unclassified' }
FUDOMagritteContainerCreator >> generateInstanceVariables [ 
	| temp |
	temp := String new.
	do properties do: [ :el | temp := temp, el varName asString, ' ' ].
	^ temp
]

{ #category : #initialization }
FUDOMagritteContainerCreator >> initialize [ 
	super initialize.
]
