Class {
	#name : #FlowHandlerTest,
	#superclass : #TestCase,
	#instVars : [
		'flowHandler'
	],
	#category : #'NewWave-Tests'
}

{ #category : #'as yet unclassified' }
FlowHandlerTest >> setUp [
	| se ee t1 seq seq2 | 
	super setUp.
	
		
	se := StartEvent new.
	se description: 'StartEvent'.
	
	t1 := BaseTask new.
	t1 description: 'B'.
	t1 value: 200.
	
	ee := EndEvent new.
	ee description: 'EndEvent'.
	
	seq := Sequence source: se target: t1.
	seq2 := Sequence source: t1 target: ee.
	
	se addOutgoingFlow: seq.
	t1 addIncoming: seq addOutgoing: seq2.
	ee addIncomingFlow: seq2.
	
	flowHandler := FlowHandler new.
	flowHandler node: se.

]

{ #category : #'as yet unclassified' }
FlowHandlerTest >> testGetNextElement [
	| n |
	n := flowHandler getNextElement.
	self assert: n class == StartEvent.
	n := flowHandler getNextElement.
	self assert: n class == BaseTask.
	n := flowHandler getNextElement.
	self assert: n class == EndEvent.
	n := flowHandler getNextElement.
	self assert: n isNil.
]
