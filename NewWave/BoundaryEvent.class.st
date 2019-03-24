Class {
	#name : #BoundaryEvent,
	#superclass : #Event,
	#instVars : [
		'attachedToRef',
		'attechedToRefId',
		'cancelActivity'
	],
	#category : #'NewWave-Core'
}

{ #category : #testing }
BoundaryEvent >> ctype [
	^ #BoundaryEvent
]

{ #category : #testing }
BoundaryEvent >> initialize [ 	
	super initialize.
	self description: 'boundary desc'
]
