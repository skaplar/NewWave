"
I am super class for all other behaviors.
"
Class {
	#name : #NWEventBehavior,
	#superclass : #Object,
	#category : #'NewWave-Core-Engine'
}

{ #category : #accessing }
NWEventBehavior >> performExecution: arg1 executor: arg2 [ 
	^ self subclassResponsibility
]
