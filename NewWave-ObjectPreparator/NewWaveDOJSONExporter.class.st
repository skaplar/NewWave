"
I am a class which simply export one DataObject into JSON.
"
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
	^ do class instVarNames
]

{ #category : #initialization }
NewWaveDOJSONExporter >> createClassContainer [
	| container |
	container := NewWaveDOClassDescription new.
	container className: do class name. 
	"container addAllToProps: self eximplify."
	self dodajUContainer: container.
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
NewWaveDOJSONExporter >> dodajUContainer: container [
	^ self collectInstVars collect: [ :each | 
		| desc postojiMoguciTip |	
		postojiMoguciTip := self possibleDataTypes hasLiteral: ((do instVarNamed: each) class asString).
		postojiMoguciTip ifFalse:[
			| obj |
			obj := do instVarNamed: each.
			desc := NewWaveDOClassDescription new.
			desc className: obj class name. 
			desc addAllToProps: (
				obj class instVarNames collect: [:every |
					| tmp |
					tmp := NewWaveDOPropertyDescription new.
					tmp varName: every.
					tmp varValue: (obj instVarNamed: every).
					tmp varType: (obj instVarNamed: every) class asString.
					tmp  				
				]).
			container complexProperties add: desc.
			]
		ifTrue:[
			| dict |
			desc := NewWaveDOPropertyDescription new.
		desc varName: each.
		desc varValue: (do instVarNamed: each).
		desc varType: (do instVarNamed: each) class asString.  
		desc.
			container properties add: desc.
			]		
	].
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

{ #category : #accessing }
NewWaveDOJSONExporter >> possibleDataTypes [
	^ { 'ByteString'. 'SmallInteger'. 'Date'. 'Boolean' } asArray
	"^ OrderedCollection with: 'ByteString' with: 'SmallInteger' with: 'Date.' "
]
