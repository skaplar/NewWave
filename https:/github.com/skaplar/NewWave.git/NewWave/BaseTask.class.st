Class {
	#name : #BaseTask,
	#superclass : #BaseActivity,
	#instVars : [
		'value'
	],
	#category : #NewWave
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
