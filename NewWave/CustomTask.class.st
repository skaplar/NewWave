Class {
	#name : #CustomTask,
	#superclass : #BaseActivity,
	#instVars : [
		'value',
		'announcer',
		'result'
	],
	#category : #'NewWave-Core'
}

{ #category : #initialization }
CustomTask >> announcer [
	^ announcer
]

{ #category : #initialization }
CustomTask >> complete [
	announcer announce: (WaveAnnouncer with: self result).
	
]

{ #category : #initialization }
CustomTask >> ctype [
	^ #CustomTask
]

{ #category : #initialization }
CustomTask >> initialize [
	super initialize.
	announcer := Announcer new.
	
]

{ #category : #initialization }
CustomTask >> result [
	^ result
]

{ #category : #initialization }
CustomTask >> result: aResult [
	result := aResult
]

{ #category : #initialization }
CustomTask >> value [
	^ value
]

{ #category : #initialization }
CustomTask >> value: aValue [
	value := aValue
]
