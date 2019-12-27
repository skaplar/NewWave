"
I am the class that is used to handle flow of the elements. I work with nodes and sequences.

    Instance Variables
	currSeq:		<Object>
	node:		<Object>
	sequences:		<Object>
	workerid:		<Object>


    Implementation Points
"
Class {
	#name : #NWFlowHandler,
	#superclass : #Object,
	#instVars : [
		'node',
		'workerid',
		'currSeq',
		'sequences'
	],
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
NWFlowHandler >> addSequence: aSeq [
	sequences add: aSeq
]

{ #category : #accessing }
NWFlowHandler >> currSeq [
	^ currSeq
]

{ #category : #accessing }
NWFlowHandler >> currSeq: aSequence [
	currSeq := aSequence
]

{ #category : #accessing }
NWFlowHandler >> getNextElement [
	" The idea here is to go through the sequences of the nodes. Every  node knows what is his outgoing flow. So I set the target node to be executed, and return source node. When there are no more outgoing flows I return the node itself.
	As the matter of precaution I added the NullNode, which is actually here to avoid ifNil checks."
	| seq tmp |
	tmp := node.
	node outgoingFlows 
	ifNotEmpty: [ 
		seq := node outgoingFlows first.
		sequences add: seq.
		seq ifNil: [ self error: 'Outgoing seq in flow handler is Nil. This should not happend.'  ] 
			ifNotNil: [ self node: seq targetRef. self currSeq: seq. ^ seq sourceRef. ]. 
	] 
	ifEmpty: [ 
		self node: NWNullNode new.
		^ tmp.
	].
	
	
]

{ #category : #accessing }
NWFlowHandler >> initialize [ 
	super initialize.
	sequences := OrderedCollection new.
]

{ #category : #accessing }
NWFlowHandler >> node [
	^ node
]

{ #category : #accessing }
NWFlowHandler >> node: aNode [
	node := aNode
]

{ #category : #accessing }
NWFlowHandler >> sequences [
	^ sequences
]

{ #category : #accessing }
NWFlowHandler >> workerid [
	^ workerid
]

{ #category : #accessing }
NWFlowHandler >> workerid: anId [
	workerid := anId
]
