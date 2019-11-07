Class {
	#name : #FUDOJSONExporter,
	#superclass : #Object,
	#instVars : [
		'do'
	],
	#category : #'NewWaveFieldUserTask-ObjectPreparator'
}

{ #category : #'as yet unclassified' }
FUDOJSONExporter class >> dataObject: do [ 
	^ self new
	do: do;
	yourself
]

{ #category : #'as yet unclassified' }
FUDOJSONExporter >> collectInstVars [
	^ do class instVarNames
]

{ #category : #'as yet unclassified' }
FUDOJSONExporter >> createClassContainer [ 
	| container |
	container := FUDOClassDescription new.
	container className: do class name. 
	container addAllToProps: self eximplify.
	^ container
]

{ #category : #accessing }
FUDOJSONExporter >> do [
	^ do
]

{ #category : #accessing }
FUDOJSONExporter >> do: anObject [
	do := anObject
]

{ #category : #'as yet unclassified' }
FUDOJSONExporter >> eximplify [ 
	^ self collectInstVars collect: [ :each | 
		| desc |
		desc := FUDOPropertyDescription new.
		desc varName: each.
		desc varValue: (do instVarNamed: each).
		desc varType: (do instVarNamed: each) class asString.  
		desc
	].
]

{ #category : #'as yet unclassified' }
FUDOJSONExporter >> exportDOToJSON [ 
	| t |
	t := String
		streamContents: [ :out | 
			(NeoJSONWriter on: out)
				prettyPrint: true;
				asciiOnly: true;
				mapInstVarsFor: FUDOClassDescription;
				nextPut: self createClassContainer].
	Transcript show: t.
	^ t.
]

{ #category : #initialization }
FUDOJSONExporter >> initialize [ 
	super initialize.
]
