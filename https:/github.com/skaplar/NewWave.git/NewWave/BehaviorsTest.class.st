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
	| se we seq fh |
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
]

{ #category : #tests }
BehaviorsTest >> tearDown [ 
	super tearDown.
	waveExecutor workers valuesDo: [ :each | each stop ].
	waveExecutor waveAnnouncer unsubscribe: ExampleAnnouncer.
]

{ #category : #tests }
BehaviorsTest >> testStartEvent [
	| seBehavior |
	seBehavior := StartEventBehavior new.
	seBehavior performExecution: waveExecutor flowHandler node executor: waveExecutor.
	waveExecutor waveAnnouncer announce: ExampleAnnouncer new.
	self assert: waveExecutor workers size equals: 1.
	
]
