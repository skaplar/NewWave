"
I am a node in the workflow. I can be a Task, a Gate, Event, etc.. and I am the one that should be executed. 
I contain the list of incoming flows, and outcoming flows of other nodes.

    Instance Variables
	incomingFlows:		<Object>
	outgoingFlows:		<Object>


    Implementation Points
"
Class {
	#name : #NWNode,
	#superclass : #NWElement,
	#instVars : [
		'incomingFlows',
		'outgoingFlows'
	],
	#category : #'NewWave-Core'
}

{ #category : #initialization }
NWNode >> addIncoming: anIncoming addOutgoing: anOutgoing [
	^ self addIncomingFlow: anIncoming; addOutgoingFlow: anOutgoing;
	yourself
]

{ #category : #initialization }
NWNode >> addIncomingFlow: aFlow [
	incomingFlows add: aFlow.

]

{ #category : #initialization }
NWNode >> addOutgoingEdge: anElement [
	| sequence |
	sequence := NWSequence source: self target: anElement.
	self addOutgoingFlow: sequence.
	anElement addIncomingFlow: sequence.
	
]

{ #category : #initialization }
NWNode >> addOutgoingEdge: anElement withCondition: aCondition [
	| sequence |
	sequence := NWSequence source: self target: anElement condition: aCondition.
	self addOutgoingFlow: sequence.
	anElement addIncomingFlow: sequence.
	
]

{ #category : #initialization }
NWNode >> addOutgoingFlow: aFlow [
	outgoingFlows add: aFlow.

]

{ #category : #initialization }
NWNode >> hasNext [
	outgoingFlows isEmptyOrNil ifTrue: [ ^ false ] ifFalse: [ ^ true ].
]

{ #category : #initialization }
NWNode >> incomingFlows [
	^ incomingFlows
]

{ #category : #initialization }
NWNode >> initialize [

	super initialize.
	incomingFlows := OrderedCollection new.
	outgoingFlows := OrderedCollection new.
]

{ #category : #initialization }
NWNode >> outgoingFlows [
	^ outgoingFlows
]
