"
I am a class for creating magritte containers from dataObject. Data object can be supplied directly, or previously obtained from JSON importer. 
My dataObject is NewWaveDOClassDescription

    Instance Variables
	do:		<NewWaveDOClassDescription>dataObject


    Implementation Points
"
Class {
	#name : #NewWaveMagritteContainerCreator,
	#superclass : #Object,
	#instVars : [
		'do'
	],
	#category : #'NewWave-ObjectPreparator'
}

{ #category : #'as yet unclassified' }
NewWaveMagritteContainerCreator class >> dataObject: do [
	^ self new
	do: do;
	yourself
]

{ #category : #initialization }
NewWaveMagritteContainerCreator >> addValues: anInstanceOfEntity [
	do properties do: [ :el | anInstanceOfEntity instVarNamed: el varName put: el varValue ].
	^ anInstanceOfEntity.
]

{ #category : #initialization }
NewWaveMagritteContainerCreator >> createEntity [
| newClass x |
	newClass := Object subclass: do className1 instanceVariableNames: self generateInstanceVariables classVariableNames: '' package: 'NewWaveWebApp'.
	"x := newClass new."
	^ self addValues: newClass new.
	"^ newClass."
]

{ #category : #initialization }
NewWaveMagritteContainerCreator >> createMaContainer [
	| maContainer |
	maContainer := MAPriorityContainer new.
	maContainer propertyAt: #label put: do className1. 
	maContainer addAll: self createMaDescriptions.
	^ maContainer
]

{ #category : #initialization }
NewWaveMagritteContainerCreator >> createMaDescriptions [
	| madesc |
	^ do properties collect: [ :each |
		| el |
		madesc := NewWaveDODescriptionSelector new.
		el := madesc descriptionDictionary at: each varType.
		el
			accessor: (each varName) asSymbol;
			label: each varValue;
			priority: 10.
	].
]

{ #category : #accessing }
NewWaveMagritteContainerCreator >> do [
	^ do
]

{ #category : #accessing }
NewWaveMagritteContainerCreator >> do: anObject [
	do := anObject
]

{ #category : #initialization }
NewWaveMagritteContainerCreator >> generateInstanceVariables [
	| temp |
	temp := String new.
	do properties do: [ :el | temp := temp, el varName asString, ' ' ].
	^ temp
]

{ #category : #initialization }
NewWaveMagritteContainerCreator >> initialize [ 
	super initialize.
	
]
