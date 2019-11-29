"
I am a ScriptTask. You can set my script: with square brackets [  ], and engine will execute it.

    Instance Variables
	script:		<Object>


    Implementation Points
"
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
