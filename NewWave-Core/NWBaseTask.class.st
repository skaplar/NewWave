"
I am the most simple task in the workflow. You can set my value to anything, and engine while executing it will try to get it.

    Instance Variables
	value:		<Object>


    Implementation Points
"
Class {
	#name : #NWBaseTask,
	#superclass : #NWBaseActivity,
	#instVars : [
		'value'
	],
	#category : #'NewWave-Core-Core'
}

{ #category : #accessing }
NWBaseTask >> behaviorClass [ 
	^ NWTaskEventBehavior 
]

{ #category : #accessing }
NWBaseTask >> value [
	^ value
]

{ #category : #accessing }
NWBaseTask >> value: anObject [
	value := anObject
]
