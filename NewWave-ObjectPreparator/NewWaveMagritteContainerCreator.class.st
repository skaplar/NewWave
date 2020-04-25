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
	"This method is used to populate instance variables of newly created objects.
	Every object can have properties, simple properties, and magritte descriptions."

	dataObject properties
		do: [ :nwPropertyDescription | 
			anInstanceOfEntity
				instVarNamed: nwPropertyDescription varName
				put: nwPropertyDescription varValue.
			self
				createAccessors: anInstanceOfEntity
				var: nwPropertyDescription varName.
			self
				addMagritteMethods: anInstanceOfEntity
				var: nwPropertyDescription ].
			
	dataObject complexProperties
		do: [ :nwClassDescription |
			self
				createAccessors: anInstanceOfEntity
				var: nwClassDescription className1 asString asLowercase.
				
			self 
				createComplexMagritteMapping: anInstanceOfEntity 
				classDescription: nwClassDescription.
				 
			anInstanceOfEntity
				instVarNamed: nwClassDescription className1 asString asLowercase
				put:
					(NewWaveMagritteContainerCreator dataObject: nwClassDescription)
						createEntity ].
	
	"If user wrote custom magritte description, we will add it anyway."				
	dataObject magritteDescriptions
		do: [ :nwMagritteDescriptionWrapper | 
			anInstanceOfEntity class compile: nwMagritteDescriptionWrapper descriptionValue. 
		].
			
	^ anInstanceOfEntity
]

{ #category : #initialization }
NewWaveMagritteContainerCreator >> createAccessors: anInstanceOfEntity var: varName [
	"Creating accessors for instance variables, in order for magritte to function. "
	
	| getter setter getterTemplate setterTemplate |
	getterTemplate := '{1}
		^ {1}'.
	setterTemplate := '{1}: anObject
		{1} := anObject'.
	
	getter := getterTemplate format: { varName }.
	setter := setterTemplate format: { varName }.
	anInstanceOfEntity class compile: getter.
	anInstanceOfEntity class compile: setter
]

{ #category : #'as yet unclassified' }
NewWaveMagritteContainerCreator >> createComplexMagritteMapping: anInstanceOfEntity classDescription: nwClassDescription [
	"This method is used when attribute of the class is another class, and we want to generate magritte description based on that. It should be improved."
	
  | methodTemplate methodSource |
  methodTemplate := 'description{1}
  <magritteDescription>
	^ MAToOneRelationDescription new 
		accessor: #{2};
		classes: (Array with: {3}1234);
		label: ''{4}'';
		priority: 40;
		yourself'.
  methodSource := methodTemplate format: {nwClassDescription className1 asString}, 
		{nwClassDescription className1 asString asLowercase}, 
		{nwClassDescription className1 asString},
		{nwClassDescription className1 asString}.
 anInstanceOfEntity class compile: methodSource.
]

{ #category : #initialization }
NewWaveMagritteContainerCreator >> createEntity [
| newClass x |
	newClass := Object subclass: dataObject className1,'1234' instanceVariableNames: self generateInstanceVariables classVariableNames: '' package: 'NewWaveFieldUserTask-Entities'.
	"x := newClass new."
	^ self addValues: newClass new.
	"^ newClass."
]

{ #category : #initialization }
NewWaveMagritteContainerCreator >> createMaContainer [
	| maContainer |
	self deprecated: 'Ovo se vise ne poziva'.
	maContainer := MAPriorityContainer new.
	maContainer propertyAt: #label put: dataObject className1. 
	maContainer addAll: self createMaDescriptions.
	^ maContainer
]

{ #category : #initialization }
NewWaveMagritteContainerCreator >> createMaDescriptions [
	| madesc |
	self deprecated: 'Ovo se vise ne poziva'.
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
	dataObject properties
		do: [ :el | temp := temp , el varName asString , ' ' ].
	dataObject complexProperties
		do:
			[ :el | temp := temp , el className1 asString asLowercase , ' ' ].
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
	dict at: 'False' put: 'MABooleanDescription'.	
	dict at: 'True' put: 'MABooleanDescription'.	
	^dict
]

{ #category : #initialization }
NewWaveMagritteContainerCreator >> initialize [ 
	super initialize.
	
]
