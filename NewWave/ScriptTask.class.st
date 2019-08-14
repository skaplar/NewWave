Class {
	#name : #ScriptTask,
	#superclass : #BaseTask,
	#instVars : [
		'script'
	],
	#category : #'NewWave-Core'
}

{ #category : #accessing }
ScriptTask >> script [ 
	^ script
]

{ #category : #accessing }
ScriptTask >> script: aBlock [
	script := aBlock
]

{ #category : #accessing }
ScriptTask >> value [
	^ script value
]
