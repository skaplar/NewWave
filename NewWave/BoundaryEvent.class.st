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
BoundaryEvent >> cancelActivity [
	^ cancelActivity
]

{ #category : #testing }
BoundaryEvent >> cancelActivity: aBoolean [
	cancelActivity := aBoolean
]

{ #category : #testing }
BoundaryEvent >> ctype [
	^ #BoundaryEvent
]

{ #category : #testing }
BoundaryEvent >> initialize [ 	
	super initialize.
	self description: 'boundary desc'
]
