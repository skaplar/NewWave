Class {
	#name : #NWBoundaryEvent,
	#superclass : #NWEvent,
	#instVars : [
		'attachedToRef',
		'attechedToRefId',
		'cancelActivity'
	],
	#category : #'NewWave-Core'
}

{ #category : #testing }
NWBoundaryEvent >> cancelActivity [
	^ cancelActivity
]

{ #category : #testing }
NWBoundaryEvent >> cancelActivity: aBoolean [
	cancelActivity := aBoolean
]

{ #category : #testing }
NWBoundaryEvent >> ctype [
	^ #NWBoundaryEvent
]

{ #category : #testing }
NWBoundaryEvent >> initialize [ 	
	super initialize.
	self description: 'boundary desc'
]
