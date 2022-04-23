Class {
	#name : #NWTaskWrapper,
	#superclass : #Object,
	#instVars : [
		'task',
		'process'
	],
	#category : #'NewWave-Core-Engine'
}

{ #category : #'as yet unclassified' }
NWTaskWrapper class >> task: aTask process: aProcess [
	^ self new
		task: aTask;
		process: aProcess;
		yourself
]

{ #category : #accessing }
NWTaskWrapper >> process [
	^ process
]

{ #category : #accessing }
NWTaskWrapper >> process: anObject [
	process := anObject
]

{ #category : #accessing }
NWTaskWrapper >> task [
	^ task
]

{ #category : #accessing }
NWTaskWrapper >> task: anObject [
	task := anObject
]
