"
I am a CustomTask, and can work in various of ways. You can set my value to a complex object, then you have to write a custom logic what to do when the engine valls the value. I have a result: field used to store any kind of result, and I have an announcer to announce when the execution is completed.

    Instance Variables
	announcer:		<Object>
	result:		<Object>
	value:		<Object>


    Implementation Points
"
Class {
	#name : #NWCustomTask,
	#superclass : #NWBaseActivity,
	#instVars : [
		'value',
		'announcer',
		'result'
	],
	#category : #'NewWave-Core'
}

{ #category : #initialization }
NWCustomTask >> announcer [
	^ announcer
]

{ #category : #initialization }
NWCustomTask >> complete [
	announcer announce: (WaveAnnouncer with: self result).
	
]

{ #category : #initialization }
NWCustomTask >> ctype [
	^ #NWCustomTask
]

{ #category : #initialization }
NWCustomTask >> initialize [
	super initialize.
	announcer := Announcer new.
	
]

{ #category : #initialization }
NWCustomTask >> result [
	^ result
]

{ #category : #initialization }
NWCustomTask >> result: aResult [
	result := aResult
]

{ #category : #initialization }
NWCustomTask >> value [
	^ value
]

{ #category : #initialization }
NWCustomTask >> value: aValue [
	value := aValue
]
