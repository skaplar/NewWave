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
	| se we seq fh engine process|
	super setUp.
		
	se := StartEvent new.
	se description: 'StartEvent'.
	
	seq := Sequence source: se target: nil.
	
	se addOutgoingFlow: seq.
	
	process := NewWaveProcess name: 'process1' initialFlowElement: se.
	engine := WaveEngine new.
	engine addProcess: process name: 'process1' .
	waveExecutor := (engine processHandler: 'process1') mainExecutor.

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
