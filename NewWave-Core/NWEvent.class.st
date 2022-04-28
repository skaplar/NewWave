"
I am an Event, that should signalize something happened in the engine. The most common ones are Start and End events. 

    Instance Variables
	eventDefinitions:		<Object>


    Implementation Points
"
Class {
	#name : #NWEvent,
	#superclass : #NWNode,
	#instVars : [
		'eventDefinitions'
	],
	#category : #'NewWave-Core-Core'
}

{ #category : #testing }
NWEvent >> addEventDefinition: anEventDefinition [
	eventDefinitions add: anEventDefinition
]

{ #category : #testing }
NWEvent >> basetype [
	^ #Event
]

{ #category : #testing }
NWEvent >> eventDefinitions [
	^ eventDefinitions
]

{ #category : #testing }
NWEvent >> initialize [ 
	super initialize.
	eventDefinitions := OrderedCollection new.
]
