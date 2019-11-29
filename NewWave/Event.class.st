"
I am an Event, that should signalize something happened in the engine. The most common ones are Start and End events. 

    Instance Variables
	eventDefinitions:		<Object>


    Implementation Points
"
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
Event >> basetype [
	^ #Event
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
