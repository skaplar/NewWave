Class {
	#name : #FieldUserTask,
	#superclass : #BaseActivity,
	#instVars : [
		'value',
		'announcer',
		'result',
		'formProperties'
	],
	#category : #'NewWave-Core'
}

{ #category : #initialization }
FieldUserTask >> addProperty: aProperty [
	formProperties add: aProperty
]

{ #category : #initialization }
FieldUserTask >> announcer [
	^ announcer
]

{ #category : #initialization }
FieldUserTask >> complete [
	announcer announce: (WaveAnnouncer with: self result).
	
]

{ #category : #initialization }
FieldUserTask >> ctype [
	^ #CustomTask
]

{ #category : #initialization }
FieldUserTask >> formProperties [
	^ formProperties
]

{ #category : #initialization }
FieldUserTask >> initialize [
	super initialize.
	announcer := Announcer new.
	formProperties := OrderedCollection new.
]

{ #category : #initialization }
FieldUserTask >> result [
	^ result
]

{ #category : #initialization }
FieldUserTask >> result: aResult [
	result := aResult
]

{ #category : #initialization }
FieldUserTask >> value [
	^ value
]

{ #category : #initialization }
FieldUserTask >> value: aValue [
	value := aValue
]
