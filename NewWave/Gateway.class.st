"
I am a Gateway, and I'm here to support different types of Gateways. As a gateway I can contain multiple inputs and/or outputs.

    Instance Variables
	element:		<Object>


    Implementation Points
"
Class {
	#name : #Gateway,
	#superclass : #Node,
	#instVars : [
		'element'
	],
	#category : #'NewWave-Core'
}

{ #category : #adding }
Gateway >> addIncoming: anIncoming addOutgoingList: anOutgoingList [
	self addIncomingFlow: anIncoming.
	self outgoingFlows addAll: anOutgoingList;
	yourself
]

{ #category : #adding }
Gateway >> addIncomingList: anIncomingList addOutgoing: anOutgoing [
	self incomingFlows addAll: anIncomingList.
	self addOutgoingFlow: anOutgoing;
	yourself
]

{ #category : #adding }
Gateway >> basetype [
	^ #Gateway
]
