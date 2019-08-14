Class {
	#name : #WaveActivation,
	#superclass : #Object,
	#instVars : [
		'node',
		'executor',
		'properties',
		'state',
		'activated',
		'completed'
	],
	#category : #'NewWave-Engine'
}

{ #category : #'as yet unclassified' }
WaveActivation class >> node: aNode executor: anExecutor [

^ self new 
	node: aNode;
	executor: anExecutor;
	activated: false;
	completed: false;
	yourself
]

{ #category : #accessing }
WaveActivation >> activated [
	^ activated 
]

{ #category : #accessing }
WaveActivation >> activated: aBoolean [
	activated := aBoolean
]

{ #category : #accessing }
WaveActivation >> completed [
	^ completed
]

{ #category : #accessing }
WaveActivation >> completed: aBoolean [
	completed := aBoolean
]

{ #category : #accessing }
WaveActivation >> executor [
	^ executor
]

{ #category : #accessing }
WaveActivation >> executor: anExecutor [
	executor := anExecutor
]

{ #category : #accessing }
WaveActivation >> initialize [ 
	super initialize.
	properties := Dictionary new.
]

{ #category : #accessing }
WaveActivation >> node [ 
	^ node
]

{ #category : #accessing }
WaveActivation >> node: aNode [
	node := aNode
]

{ #category : #accessing }
WaveActivation >> printOn: aStream [
	"super printOn: aStream."
	aStream
		nextPutAll: 'Act(';
		nextPutAll: self node description;
		nextPutAll: ')'.
]

{ #category : #accessing }
WaveActivation >> properties [
	^ properties
]

{ #category : #accessing }
WaveActivation >> state [ 
	^ state
]

{ #category : #accessing }
WaveActivation >> state: aState [
	state := aState
]
