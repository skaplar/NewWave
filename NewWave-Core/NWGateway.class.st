"
I am a Gateway, and I'm here to support different types of Gateways. As a gateway I can contain multiple inputs and/or outputs.

    Instance Variables
	element:		<Object>


    Implementation Points
"
Class {
	#name : #NWGateway,
	#superclass : #NWNode,
	#instVars : [
		'element'
	],
	#category : #'NewWave-Core-Core'
}

{ #category : #adding }
NWGateway >> addIncoming: anIncoming addOutgoingList: anOutgoingList [
	self addIncomingFlow: anIncoming.
	self outgoingFlows addAll: anOutgoingList;
	yourself
]

{ #category : #adding }
NWGateway >> addIncomingList: anIncomingList addOutgoing: anOutgoing [
	self incomingFlows addAll: anIncomingList.
	self addOutgoingFlow: anOutgoing;
	yourself
]

{ #category : #adding }
NWGateway >> basetype [
	^ #Gateway
]
