Class {
	#name : #ManualTask,
	#superclass : #BaseActivity,
	#instVars : [
		'value',
		'announcer',
		'result'
	],
	#category : #'NewWave-Core'
}

{ #category : #initialization }
ManualTask >> announcer [
	^ announcer
]

{ #category : #initialization }
ManualTask >> complete [
	announcer announce: (WaveAnnouncer with: self result).
	
]

{ #category : #initialization }
ManualTask >> ctype [
	^ #ManualTask
]

{ #category : #initialization }
ManualTask >> initialize [
	super initialize.
	announcer := Announcer new.
]

{ #category : #initialization }
ManualTask >> result [
	^ result
]

{ #category : #initialization }
ManualTask >> result: aResult [
	result := aResult
]

{ #category : #initialization }
ManualTask >> value [
	^ value
]

{ #category : #initialization }
ManualTask >> value: aValue [
	value := aValue
]
