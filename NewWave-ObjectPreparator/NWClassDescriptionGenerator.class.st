"
I am a copy of class NWClassJSONExporter. This comment is copied from there, and might not be entirely accurate

I am a copy of class NewWaveDOJSONExporter. This comment is copied from there, and might not be entirely accurate

I am a class which simply export one DataObject into JSON.
"
Class {
	#name : #NWClassDescriptionGenerator,
	#superclass : #Object,
	#instVars : [
		'anObject'
	],
	#category : #'NewWave-ObjectPreparator'
}

{ #category : #'as yet unclassified' }
NWClassDescriptionGenerator class >> dataObject: anObject [
	^ self new
	anObject: anObject;
	yourself
]

{ #category : #initialization }
NWClassDescriptionGenerator >> addDescriptions: container [
	"Here all the magritteDescription pragmas are collected, which can be used on the server to be recompiled.
	Magritte descriptions which already exist on the object instance (manually written)."

	| descriptionPragmas |
	descriptionPragmas := Pragma
		allNamed: MAPragmaBuilder magritteDescriptionPragma
		from: anObject class
		to: Object.

	container
		addAllToMagritteDescriptions:
			(descriptionPragmas
				collect: [ :pragma | 
					| magritteDescriptionWrapper |
					magritteDescriptionWrapper := NWMagritteDescriptionWrapper new.
					magritteDescriptionWrapper
						descriptionName: pragma method selector asString.
					magritteDescriptionWrapper
						descriptionValue: pragma method asString.
					magritteDescriptionWrapper ])
]

{ #category : #accessing }
NWClassDescriptionGenerator >> anObject [
	^ anObject
]

{ #category : #accessing }
NWClassDescriptionGenerator >> anObject: tmpObject [
	anObject := tmpObject
]

{ #category : #'as yet unclassified' }
NWClassDescriptionGenerator >> checkIdField: nwClassDecsription [ 
	nwClassDecsription properties detect: [ :each | each varName = 'id' ]
		ifNone: [ self error: 'id field is missing for Entity', nwClassDecsription className1 ].
	
]

{ #category : #accessing }
NWClassDescriptionGenerator >> collectInstVars [
	^ anObject class instVarNames
]

{ #category : #initialization }
NWClassDescriptionGenerator >> createClassDescription [
	| container |
	container := NewWaveDOClassDescription new.
	container className: anObject class name. 
	self dodajUContainer: container.
	self checkIdField: container.
	self addDescriptions: container.
	^ container
]

{ #category : #initialization }
NWClassDescriptionGenerator >> dodajUContainer: container [
	"NWClassDescription can have simple and complex properties. Complex properties are again NWClassDescriptions.
	If the property has possibleDateType then it's simple, it's complex otherwise."
	
	^ self collectInstVars collect: [ :each | 
		| desc postojiMoguciTip |	
		postojiMoguciTip := self possibleDataTypes hasLiteral: ((anObject instVarNamed: each) class asString).
		postojiMoguciTip ifFalse: [
			| obj |
			obj := anObject instVarNamed: each.
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
	   ifTrue: [
			desc := NewWaveDOPropertyDescription new.
			desc varName: each.
			desc varValue: (anObject instVarNamed: each).
			desc varType: (anObject instVarNamed: each) class asString.  
			container properties add: desc.
		]		
	].
]

{ #category : #initialization }
NWClassDescriptionGenerator >> initialize [ 
	super initialize.
]

{ #category : #accessing }
NWClassDescriptionGenerator >> possibleDataTypes [
	^ { 'ByteString'. 'SmallInteger'. 'Date'. 'Boolean'. 'Array'. 'False'. 'True' } asArray
	"^ OrderedCollection with: 'ByteString' with: 'SmallInteger' with: 'Date.' "
]
