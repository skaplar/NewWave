Class {
	#name : #FormProperty,
	#superclass : #Element,
	#instVars : [
		'name',
		'type',
		'variable',
		'formValues',
		'label'
	],
	#category : #'NewWave-Core'
}

{ #category : #accessing }
FormProperty class >> neoJsonMapping: mapper [
	"For inheritance mapping to work, the schema/classname must be self,
	but the instance variables have to be enumerated manually per class"
	
	super neoJsonMapping: mapper.
	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(name type variable formValues label) ] 
]

{ #category : #initialization }
FormProperty >> addFormValue: aValue [
	formValues add: aValue
]

{ #category : #initialization }
FormProperty >> formValues [
	^ formValues
]

{ #category : #initialization }
FormProperty >> initialize [ 
	super initialize.
	formValues := OrderedCollection new.

]

{ #category : #accessing }
FormProperty >> label [
	^ label
]

{ #category : #accessing }
FormProperty >> label: anObject [
	label := anObject
]

{ #category : #initialization }
FormProperty >> name [
	^ name
]

{ #category : #initialization }
FormProperty >> name: aName [
	name := aName
]

{ #category : #initialization }
FormProperty >> type [ 
	^ type
]

{ #category : #initialization }
FormProperty >> type: aType [
	type := aType
]

{ #category : #initialization }
FormProperty >> variable [ 
	^ variable
]

{ #category : #initialization }
FormProperty >> variable: aVariable [ 
	variable := aVariable
]
