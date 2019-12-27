"
I am a ScriptTask. You can set my script: with square brackets [  ], and engine will execute it.

    Instance Variables
	script:		<Object>


    Implementation Points
"
Class {
	#name : #NWScriptTask,
	#superclass : #NWBaseTask,
	#instVars : [
		'script'
	],
	#category : #'NewWave-Core'
}

{ #category : #accessing }
NWScriptTask >> script [ 
	^ script
]

{ #category : #accessing }
NWScriptTask >> script: aBlock [
	script := aBlock
]

{ #category : #accessing }
NWScriptTask >> value [
	^ script value
]
