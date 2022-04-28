Class {
	#name : #NWActivation,
	#superclass : #Object,
	#instVars : [
		'node',
		'executor',
		'properties',
		'state',
		'activated',
		'completed'
	],
	#category : #'NewWave-Core-Engine'
}

{ #category : #'as yet unclassified' }
NWActivation class >> node: aNode executor: anExecutor [

^ self new 
	node: aNode;
	executor: anExecutor;
	activated: false;
	completed: false;
	yourself
]

{ #category : #accessing }
NWActivation >> activated [
	^ activated 
]

{ #category : #accessing }
NWActivation >> activated: aBoolean [
	activated := aBoolean
]

{ #category : #accessing }
NWActivation >> completed [
	^ completed
]

{ #category : #accessing }
NWActivation >> completed: aBoolean [
	completed := aBoolean
]

{ #category : #accessing }
NWActivation >> executor [
	^ executor
]

{ #category : #accessing }
NWActivation >> executor: anExecutor [
	executor := anExecutor
]

{ #category : #accessing }
NWActivation >> initialize [ 
	super initialize.
	properties := Dictionary new.
]

{ #category : #accessing }
NWActivation >> node [ 
	^ node
]

{ #category : #accessing }
NWActivation >> node: aNode [
	node := aNode
]

{ #category : #accessing }
NWActivation >> printOn: aStream [
	"super printOn: aStream."
	aStream
		nextPutAll: 'Act(';
		nextPutAll: self node description;
		nextPutAll: ')'.
]

{ #category : #accessing }
NWActivation >> properties [
	^ properties
]

{ #category : #accessing }
NWActivation >> state [ 
	^ state
]

{ #category : #accessing }
NWActivation >> state: aState [
	state := aState
]
