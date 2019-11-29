"
I am the most simple task in the workflow. You can set my value to anything, and engine while executing it will try to get it.

    Instance Variables
	value:		<Object>


    Implementation Points
"
Class {
	#name : #BaseTask,
	#superclass : #BaseActivity,
	#instVars : [
		'value'
	],
	#category : #'NewWave-Core'
}

{ #category : #accessing }
BaseTask >> ctype [
	^ #BaseTask
]

{ #category : #accessing }
BaseTask >> value [
	^ value
]

{ #category : #accessing }
BaseTask >> value: anObject [
	value := anObject
]
