"
I am a CustomTask, and can work in various of ways. You can set my value to a complex object, then you have to write a custom logic what to do when the engine valls the value. I have a result: field used to store any kind of result, and I have an announcer to announce when the execution is completed.

    Instance Variables
	announcer:		<Object>
	result:		<Object>
	value:		<Object>


    Implementation Points
"
Class {
	#name : #CustomTask,
	#superclass : #BaseActivity,
	#instVars : [
		'value',
		'announcer',
		'result'
	],
	#category : #'NewWave-Core'
}

{ #category : #initialization }
CustomTask >> announcer [
	^ announcer
]

{ #category : #initialization }
CustomTask >> complete [
	announcer announce: (WaveAnnouncer with: self result).
	
]

{ #category : #initialization }
CustomTask >> ctype [
	^ #CustomTask
]

{ #category : #initialization }
CustomTask >> initialize [
	super initialize.
	announcer := Announcer new.
	
]

{ #category : #initialization }
CustomTask >> result [
	^ result
]

{ #category : #initialization }
CustomTask >> result: aResult [
	result := aResult
]

{ #category : #initialization }
CustomTask >> value [
	^ value
]

{ #category : #initialization }
CustomTask >> value: aValue [
	value := aValue
]
