Class {
	#name : #FormProperty,
	#superclass : #Element,
	#instVars : [
		'name',
		'type',
		'variable',
		'formValues'
	],
	#category : #'NewWave-Core'
}

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
