"
I am a CustomTask, and can work in various of ways. You can set my value to a complex object, then you have to write a custom logic what to do when the engine valls the value. I have a result: field used to store any kind of result, and I have an announcer to announce when the execution is completed.

    Instance Variables
	announcer:		<Object>
	result:		<Object>
	value:		<Object>


    Implementation Points
"
Class {
	#name : #NWUserTask,
	#superclass : #NWBaseActivity,
	#instVars : [
		'value',
		'announcer',
		'result',
		'user',
		'group'
	],
	#category : #'NewWave-Core'
}

{ #category : #initialization }
NWUserTask >> announcer [
	^ announcer
]

{ #category : #initialization }
NWUserTask >> complete [
	announcer announce: (WaveAnnouncer with: self result).
	
]

{ #category : #initialization }
NWUserTask >> ctype [
	^ #NWUserTask
]

{ #category : #accessing }
NWUserTask >> group [
	^ group
]

{ #category : #accessing }
NWUserTask >> group: anObject [
	group := anObject
]

{ #category : #initialization }
NWUserTask >> initialize [
	super initialize.
	announcer := Announcer new.
	
]

{ #category : #initialization }
NWUserTask >> result [
	^ result
]

{ #category : #initialization }
NWUserTask >> result: aResult [
	result := aResult
]

{ #category : #accessing }
NWUserTask >> user [
	^ user
]

{ #category : #accessing }
NWUserTask >> user: anObject [
	user := anObject
]

{ #category : #initialization }
NWUserTask >> value [
	^ value
]

{ #category : #initialization }
NWUserTask >> value: aValue [
	value := aValue
]
