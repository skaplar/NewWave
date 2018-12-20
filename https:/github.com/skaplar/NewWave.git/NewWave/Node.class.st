Class {
	#name : #Node,
	#superclass : #Element,
	#instVars : [
		'incomingFlows',
		'outgoingFlows'
	],
	#category : #NewWave
}

{ #category : #initialization }
Node >> addIncomingFlow: aFlow [
	incomingFlows add: aFlow.

]

{ #category : #initialization }
Node >> addOutgoingFlow: aFlow [
	outgoingFlows add: aFlow.

]

{ #category : #initialization }
Node >> incomingFlows [
	^ incomingFlows
]

{ #category : #initialization }
Node >> initialize [

	super initialize.
	incomingFlows := OrderedCollection new.
	outgoingFlows := OrderedCollection new.
]

{ #category : #initialization }
Node >> isEvent [
	^ false
]

{ #category : #initialization }
Node >> outgoingFlows [
	^ outgoingFlows
]
