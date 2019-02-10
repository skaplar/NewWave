Class {
	#name : #WaveActivation,
	#superclass : #Object,
	#instVars : [
		'node',
		'executor',
		'properties'
	],
	#category : #'NewWave-Engine'
}

{ #category : #'as yet unclassified' }
WaveActivation class >> node: aNode executor: anExecutor [

^ self new 
	node: aNode;
	executor: anExecutor;
	yourself
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
WaveActivation >> isCompleted [ 
	^ executor workList isCompleted: self.
]

{ #category : #accessing }
WaveActivation >> isStartedOrCompleted [ 
	^ executor workList isStartedOrCompleted: self.
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
WaveActivation >> properties [
	^ properties
]
