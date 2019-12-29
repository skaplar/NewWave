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
		
	se := NWStartEvent new.
	se description: #NWStartEvent.
	
	seq := NWSequence source: se target: nil.
	
	se addOutgoingFlow: seq.
	
	process := NWProcess id: '1' name: 'process1' initialFlowElement: se.
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
	seBehavior := NWStartEventBehavior new.
	seBehavior performExecution: waveExecutor flowHandler node executor: waveExecutor.
	waveExecutor waveAnnouncer announce: StartAnnouncer new.
	self assert: waveExecutor workers size equals: 1.
	
]
