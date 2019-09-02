Class {
	#name : #FUFormMagritte,
	#superclass : #Object,
	#instVars : [
		'fields'
	],
	#category : #NewWaveFieldUserTask
}

{ #category : #'instance creation' }
FUFormMagritte class >> from: aTask [
   | forma |
	forma := FUFormMagritte new fields: aTask formProperties.
   ^ forma getMagritteForm
]

{ #category : #adding }
FUFormMagritte >> addField: aField [
	fields add: aField
	
]

{ #category : #accessing }
FUFormMagritte >> fields [
	^ fields
]

{ #category : #accessing }
FUFormMagritte >> fields: aFields [
	fields := aFields 
]

{ #category : #'as yet unclassified' }
FUFormMagritte >> getMagritteForm [
	| fieldDesc |
	fieldDesc := OrderedCollection new.
	fieldDesc := self fields collect: [ :f | (FUFieldMagritte new field: f) magritteDescription ].
	^ fieldDesc
]

{ #category : #initialization }
FUFormMagritte >> initialize [
	super initialize.
	fields := OrderedCollection new
]
