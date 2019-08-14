"
I am super class for all other behaviors.
"
Class {
	#name : #EventBehavior,
	#superclass : #Object,
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
EventBehavior >> performExecution: arg1 executor: arg2 [ 
	^ self subclassResponsibility
]
