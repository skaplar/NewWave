Class {
	#name : #NewWaveDOJSONExporter,
	#superclass : #Object,
	#instVars : [
		'do'
	],
	#category : #'NewWave-ObjectPreparator'
}

{ #category : #'as yet unclassified' }
NewWaveDOJSONExporter class >> dataObject: do [
	^ self new
	do: do;
	yourself
]

{ #category : #accessing }
NewWaveDOJSONExporter >> collectInstVars [
	^ do class instanceVariables
]

{ #category : #initialization }
NewWaveDOJSONExporter >> createClassContainer [
	| container |
	container := NewWaveDOClassDescription new.
	container className: do class name. 
	container addAllToProps: self eximplify.
	^ container
]

{ #category : #accessing }
NewWaveDOJSONExporter >> do [
	^ do
]

{ #category : #accessing }
NewWaveDOJSONExporter >> do: anObject [
	do := anObject
]

{ #category : #initialization }
NewWaveDOJSONExporter >> eximplify [
	^ self collectInstVars collect: [ :each | 
		| desc |
		desc := NewWaveDOPropertyDescription new.
		desc varName: each.
		desc varValue: (do instVarNamed: each).
		desc varType: (do instVarNamed: each) class asString.  
		desc
	].
]

{ #category : #initialization }
NewWaveDOJSONExporter >> exportDOToJSON [
	| t |
	t := String
		streamContents: [ :out | 
			(NeoJSONWriter on: out)
				prettyPrint: true;
				asciiOnly: true;
				mapInstVarsFor: NewWaveDOClassDescription;
				nextPut: self createClassContainer].
	Transcript show: t.
	^ t.
]

{ #category : #initialization }
NewWaveDOJSONExporter >> initialize [ 
	super initialize.
	
]
