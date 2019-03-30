Class {
	#name : #BehaviorsTest,
	#superclass : #TestCase,
	#instVars : [
		'waveExecutor'
	],
	#category : #'NewWave-Tests'
}

{ #category : #tests }
BehaviorsTest >> setUp [ 
	| se we seq fh engine |
	super setUp.
		
	se := StartEvent new.
	se description: 'StartEvent'.
	
	seq := Sequence source: se target: nil.
	
	se addOutgoingFlow: seq.
	
	fh := FlowHandler new.
	fh node: se.
	
	we := WaveExecutor new.
	we flowHandler: fh.
	waveExecutor := we.
	engine := WaveEngine new.
	engine addExecutor: waveExecutor.
]

{ #category : #tests }
BehaviorsTest >> tearDown [ 
	super tearDown.
	waveExecutor workers valuesDo: [ :each | each stop ].
	waveExecutor waveAnnouncer unsubscribe: StartAnnouncer.
]

{ #category : #tests }
BehaviorsTest >> testStartEvent [
	| seBehavior |
	seBehavior := StartEventBehavior new.
	seBehavior performExecution: waveExecutor flowHandler node executor: waveExecutor.
	waveExecutor waveAnnouncer announce: StartAnnouncer new.
	self assert: waveExecutor workers size equals: 1.
	
]
