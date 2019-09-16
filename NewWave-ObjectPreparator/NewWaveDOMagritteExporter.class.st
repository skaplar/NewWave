"
I am a class for creating magritte containers from enitity itself. Data object can be supplied directly, or previously obtained from JSON importer. 
My dataObject is a class that is used as an entity.
I am different from NewWaveMagritteContainerCreator.

    Instance Variables
	do:		<Class>dataObject


    Implementation Points

    Instance Variables
	do:		<Object>


    Implementation Points
"
Class {
	#name : #NewWaveDOMagritteExporter,
	#superclass : #Object,
	#instVars : [
		'do'
	],
	#category : #'NewWave-ObjectPreparator'
}

{ #category : #'as yet unclassified' }
NewWaveDOMagritteExporter class >> dataObject: do [
	^ self new
	do: do;
	yourself
]

{ #category : #accessing }
NewWaveDOMagritteExporter >> collectInstVars [
	^ do class instanceVariables
]

{ #category : #initialization }
NewWaveDOMagritteExporter >> createMaContainer [
	| maContainer |
	maContainer := MAPriorityContainer new.
	maContainer propertyAt: #label put: do class name. 
	maContainer addAll: self createMaDescriptions.
	^ maContainer
]

{ #category : #initialization }
NewWaveDOMagritteExporter >> createMaDescriptions [
	| madesc |
	^ self eximplify collect: [ :each |
		| el |
		madesc := NewWaveDODescriptionSelector new.
		el := madesc descriptionDictionary at: each varType.
		el
			accessor: each varName;
			label: each varValue;
			priority: 10.
	].
]

{ #category : #accessing }
NewWaveDOMagritteExporter >> do [
	^ do
]

{ #category : #accessing }
NewWaveDOMagritteExporter >> do: anObject [
	do := anObject
]

{ #category : #initialization }
NewWaveDOMagritteExporter >> eximplify [
	^ self collectInstVars collect: [ :each | 
		| desc |
		desc := NewWaveDOPropertyDescription new.
		desc varName: each.
		desc varValue: (do instVarNamed: each).
		desc varType: (do instVarNamed: each) class name.  
		desc
	].
]

{ #category : #initialization }
NewWaveDOMagritteExporter >> initialize [ 
	super initialize.
	
]
