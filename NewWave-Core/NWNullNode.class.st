"
I am a NullNode used to handle specific nil possible scenarios. 
"
Class {
	#name : #NWNullNode,
	#superclass : #NWNode,
	#category : #'NewWave-Core-Core'
}

{ #category : #accessing }
NWNullNode >> behaviorClass [ 
	^ NWNullNodeBehavior 
]
