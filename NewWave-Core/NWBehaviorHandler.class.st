"
I am a class tha returns behavior for the executing of certain elements.

    Instance Variables
	behaviors:		<Dictionary>


    Implementation Points
"
Class {
	#name : #NWBehaviorHandler,
	#superclass : #Object,
	#instVars : [
		'behaviors'
	],
	#category : #'NewWave-Core-Engine'
}

{ #category : #initialization }
NWBehaviorHandler >> behaviors [
	^ behaviors
]

{ #category : #initialization }
NWBehaviorHandler >> behaviors: anObject [
	behaviors := anObject
]
