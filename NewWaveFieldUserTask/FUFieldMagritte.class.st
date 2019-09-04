Class {
	#name : #FUFieldMagritte,
	#superclass : #Object,
	#instVars : [
		'field',
		'counter'
	],
	#category : #NewWaveFieldUserTask
}

{ #category : #accessing }
FUFieldMagritte >> counter [
	^ counter
]

{ #category : #accessing }
FUFieldMagritte >> counter: aCounter [
	counter := aCounter 
]

{ #category : #accessing }
FUFieldMagritte >> field [
	^ field
]

{ #category : #accessing }
FUFieldMagritte >> field: aField [
	field := aField
]

{ #category : #'as yet unclassified' }
FUFieldMagritte >> fieldDescription [
	"<magritteDescription>
	^ self giveDescription "
]

{ #category : #initialization }
FUFieldMagritte >> initialize [
	super initialize.
]
