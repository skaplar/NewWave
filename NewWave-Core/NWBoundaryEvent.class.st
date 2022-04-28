"
I am a boundary event. I can be attached to certain object. I can cancel execution of the activites.

    Instance Variables
	attachedToRef:		<Object>
	attechedToRefId:		<Object>
	cancelActivity:		<Object>


    Implementation Points
"
Class {
	#name : #NWBoundaryEvent,
	#superclass : #NWEvent,
	#instVars : [
		'attachedToRef',
		'attechedToRefId',
		'cancelActivity'
	],
	#category : #'NewWave-Core-Core'
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
