"
I indicate an end event in the workflow.

"
Class {
	#name : #NWEndEvent,
	#superclass : #NWEvent,
	#category : #'NewWave-Core-Core'
}

{ #category : #accessing }
NWEndEvent >> behaviorClass [ 
	^ NWEndEventBehavior 
]
