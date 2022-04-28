Class {
	#name : #FlowHandlerTest,
	#superclass : #TestCase,
	#instVars : [
		'flowHandler'
	],
	#category : #'NewWave-Core-Tests'
}

{ #category : #tests }
FlowHandlerTest >> setUp [
	| se ee t1 seq seq2 | 
	super setUp.
	se := NWStartEvent new.
	se description: #NWStartEvent.
	
	t1 := NWBaseTask new.
	t1 description: 'B'.
	t1 value: 200.
	
	ee := NWEndEvent new.
	ee description: #NWEndEvent.
	
	seq := NWSequence source: se target: t1.
	seq2 := NWSequence source: t1 target: ee.
	
	se addOutgoingFlow: seq.
	t1 addIncoming: seq addOutgoing: seq2.
	ee addIncomingFlow: seq2.
	
	flowHandler := NWFlowHandler new.
	flowHandler node: se.

]

{ #category : #tests }
FlowHandlerTest >> testGetNextElement [
	| n |
	n := flowHandler getNextElement.
	self assert: n class == NWStartEvent.
	n := flowHandler getNextElement.
	self assert: n class == NWBaseTask.
	n := flowHandler getNextElement.
	self assert: n class == NWEndEvent.
	n := flowHandler getNextElement.
	self assert: n class == NWNullNode.
]
