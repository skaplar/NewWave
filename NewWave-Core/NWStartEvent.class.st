"
I am a start event in the workflow.
"
Class {
	#name : #NWStartEvent,
	#superclass : #NWEvent,
	#category : #'NewWave-Core-Core'
}

{ #category : #tests }
NWStartEvent >> behaviorClass [ 
	^ NWStartEventBehavior 
]
