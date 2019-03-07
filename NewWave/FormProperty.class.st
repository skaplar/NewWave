Class {
	#name : #FormProperty,
	#superclass : #Node,
	#instVars : [
		'name',
		'type',
		'variable'
	],
	#category : #'NewWave-Core'
}

{ #category : #initialization }
FormProperty >> initialize [ 
	super initialize.

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
