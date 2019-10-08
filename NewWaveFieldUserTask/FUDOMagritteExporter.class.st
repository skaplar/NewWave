Class {
	#name : #FUDOMagritteExporter,
	#superclass : #Object,
	#instVars : [
		'do'
	],
	#category : #'NewWaveFieldUserTask-ObjectPreparator'
}

{ #category : #'as yet unclassified' }
FUDOMagritteExporter class >> dataObject: do [ 
	^ self new
	do: do;
	yourself 
]

{ #category : #'as yet unclassified' }
FUDOMagritteExporter >> collectInstVars [ 
	^ do class instanceVariables
]

{ #category : #'as yet unclassified' }
FUDOMagritteExporter >> createMaContainer [ 
	| maContainer |
	maContainer := MAPriorityContainer new.
	maContainer propertyAt: #label put: do className1. 
	self halt.
	maContainer addAll: self createMaDescriptions.
	^ maContainer
]

{ #category : #'as yet unclassified' }
FUDOMagritteExporter >> createMaDescriptions [ 
	| madesc |
	madesc := FUDODescriptionSelector new.
	^ self do properties collect: [ :each |
		| el |
		el := madesc descriptionDictionary at: each varType.
		el
			accessor: (each varName) asSymbol;
			label: each varName;
			priority: 10.
	].
]

{ #category : #accessing }
FUDOMagritteExporter >> do [
	^ do
]

{ #category : #accessing }
FUDOMagritteExporter >> do: anObject [
	do := anObject
]

{ #category : #'as yet unclassified' }
FUDOMagritteExporter >> eximplify [
	^ self collectInstVars collect: [ :each | 
		| desc |
		desc := FUDOPropertyDescription new.
		desc varName: each.
		desc varValue: (do instVarNamed: each).
		desc varType: (do instVarNamed: each) class name.  
		desc
	].
]

{ #category : #initialization }
FUDOMagritteExporter >> initialize [ 
	super initialize.
]
