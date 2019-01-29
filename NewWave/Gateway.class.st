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
