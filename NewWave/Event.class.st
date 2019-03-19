Class {
	#name : #Event,
	#superclass : #Node,
	#instVars : [
		'eventDefinitions'
	],
	#category : #'NewWave-Core'
}

{ #category : #testing }
Event >> addEventDefinition: anEventDefinition [
	eventDefinitions add: anEventDefinition
]

{ #category : #testing }
Event >> ctype [
	^ #Event
]

{ #category : #testing }
Event >> eventDefinitions [
	^ eventDefinitions
]

{ #category : #testing }
Event >> initialize [ 
	super initialize.
	eventDefinitions := OrderedCollection new.
]
