Class {
	#name : #FUFormMagritte,
	#superclass : #Object,
	#instVars : [
		'fields'
	],
	#category : #NewWaveFieldUserTask
}

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
	^ self fields collect: [ :f | FUFieldMagritte new field: f; getDescription ]
]

{ #category : #initialization }
FUFormMagritte >> initialize [
	super initialize.
	fields := OrderedCollection new
]
