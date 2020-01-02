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
		'dataObject'
	],
	#category : #'NewWave-ObjectPreparator'
}

{ #category : #'as yet unclassified' }
NewWaveMagritteContainerCreator class >> dataObject: do [
	^ self new
	dataObject: do;
	yourself
]

{ #category : #initialization }
NewWaveMagritteContainerCreator >> addMagritteMethods: newClass var: el [
  | methodTemplate methodSource madesc visible |
	madesc := self getMADictionary.
  methodTemplate := 'description{1}
  <magritteDescription>
	^ {2} new 
		accessor: #{3};
		label: ''{4}'';
		priority: 10;
		visible: {5};
		yourself'.
		visible := (el varName = 'id') ifTrue: [ false ] ifFalse: [ true ]. 
  methodSource := methodTemplate format:  {el varName capitalized}, 
		{madesc at: el varType}, 
		{el varName},
		{el varName},
		{visible}.
  newClass class compile: methodSource.
]

{ #category : #initialization }
NewWaveMagritteContainerCreator >> addValues: anInstanceOfEntity [ 
	dataObject properties do: [ :el | 
		anInstanceOfEntity instVarNamed: el varName put: el varValue. 
		self addMagritteMethods: anInstanceOfEntity var: el.
		].
	^ anInstanceOfEntity.
]

{ #category : #initialization }
NewWaveMagritteContainerCreator >> createEntity [
| newClass x |
	newClass := Object subclass: dataObject className1 instanceVariableNames: self generateInstanceVariables classVariableNames: '' package: 'NewWaveFieldUserTask-Entities'.
	"x := newClass new."
	^ self addValues: newClass new.
	"^ newClass."
]

{ #category : #initialization }
NewWaveMagritteContainerCreator >> createMaContainer [
	| maContainer |
	maContainer := MAPriorityContainer new.
	maContainer propertyAt: #label put: dataObject className1. 
	maContainer addAll: self createMaDescriptions.
	^ maContainer
]

{ #category : #initialization }
NewWaveMagritteContainerCreator >> createMaDescriptions [
	| madesc |
	^ dataObject properties collect: [ :each |
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
NewWaveMagritteContainerCreator >> dataObject: anObject [
	dataObject := anObject
]

{ #category : #accessing }
NewWaveMagritteContainerCreator >> do [
	^ dataObject
]

{ #category : #initialization }
NewWaveMagritteContainerCreator >> generateInstanceVariables [
	| temp |
	temp := String new.
	dataObject properties do: [ :el | temp := temp, el varName asString, ' ' ].
	^ temp
]

{ #category : #initialization }
NewWaveMagritteContainerCreator >> getMADictionary [
	| dict |
	dict := Dictionary new.
	dict at: 'ByteString' put: 'MAStringDescription'.
	dict at: 'SmallInteger' put: 'MANumberDescription'.
	dict at: 'Date' put: 'MADateDescription'.
	dict at: 'Boolean' put: 'MABooleanDescription'.	
	^dict
]

{ #category : #initialization }
NewWaveMagritteContainerCreator >> initialize [ 
	super initialize.
	
]
