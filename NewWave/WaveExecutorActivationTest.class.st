Class {
	#name : #WaveExecutorActivationTest,
	#superclass : #TestCase,
	#instVars : [
		'waveExecutor'
	],
	#category : #'NewWave-Tests'
}

{ #category : #tests }
WaveExecutorActivationTest >> setUp [
	| se ee t1 we seq seq2 fh engine |
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
	
	fh := FlowHandler new.
	fh node: se.
	
	we := WaveExecutor new.
	we flowHandler: fh.
	waveExecutor := we.
	
	engine := WaveEngine new.
	engine addExecutor: we.
	
]

{ #category : #tests }
WaveExecutorActivationTest >> testActivationCreation [
	| se we|
	se := StartEvent new.
	se description: 'StartEvent'.
	we := WaveExecutor initialNode: se.
	self shouldnt: [ WaveActivation node: se executor: we] raise: Error.
	

]

{ #category : #tests }
WaveExecutorActivationTest >> testActivationForNode [
	| se act1 |
	se := waveExecutor shouldExecuteNextNewHandler.
	act1 := waveExecutor activationForNode: se.
	self assert: act1 equals: (waveExecutor activationForNode: se).
	

]

{ #category : #tests }
WaveExecutorActivationTest >> testExistingActivationForNode [
	| se |
	se := waveExecutor shouldExecuteNextNewHandler.
	waveExecutor newActivationForNode: se.
	self should: [ waveExecutor newActivationForNode: se. ] raise: Error.
	

]

{ #category : #tests }
WaveExecutorActivationTest >> testNewActivationForNode [
	| activation se |
	se := waveExecutor shouldExecuteNextNewHandler.
	activation := waveExecutor newActivationForNode: se.
	self assert: activation isNotNil.

	

]
