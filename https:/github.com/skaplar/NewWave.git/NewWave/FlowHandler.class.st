Class {
	#name : #FlowHandler,
	#superclass : #Object,
	#instVars : [
		'node',
		'index'
	],
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
FlowHandler >> getNextElement [
	| seq |
	node outgoingFlows ifNotEmpty: [  
		seq := node outgoingFlows first.
		seq ifNil: [ 'Doso do kraja valjda ' logCr ] 
			ifNotNil: [ self node: seq targetRef. ^ seq sourceRef. ]. 
	] ifEmpty: [ ^ nil ].
	
	
]

{ #category : #accessing }
FlowHandler >> index [
	^ index
]

{ #category : #accessing }
FlowHandler >> index: anIndex [
	index := anIndex
]

{ #category : #accessing }
FlowHandler >> initialize [ 
	super initialize.
	self index: 0.
]

{ #category : #accessing }
FlowHandler >> node [
	^ node
]

{ #category : #accessing }
FlowHandler >> node: aNode [
	node := aNode
]
