Class {
	#name : #UserTask,
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
UserTask >> addProperty: aProperty [
	formProperties add: aProperty
]

{ #category : #initialization }
UserTask >> announcer [
	^ announcer
]

{ #category : #initialization }
UserTask >> complete [
	announcer announce: (WaveAnnouncer with: self result).
	
]

{ #category : #initialization }
UserTask >> ctype [
	^ #UserTask
]

{ #category : #initialization }
UserTask >> formProperties [
	^ formProperties
]

{ #category : #initialization }
UserTask >> initialize [
	super initialize.
	announcer := Announcer new.
	formProperties := OrderedCollection new.
]

{ #category : #initialization }
UserTask >> result [
	^ result
]

{ #category : #initialization }
UserTask >> result: aResult [
	result := aResult
]

{ #category : #initialization }
UserTask >> value [
	^ value
]

{ #category : #initialization }
UserTask >> value: aValue [
	value := aValue
]
