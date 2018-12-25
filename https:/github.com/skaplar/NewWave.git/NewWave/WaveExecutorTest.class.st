Class {
	#name : #WaveExecutorTest,
	#superclass : #TestCase,
	#instVars : [
		'waveExecutor'
	],
	#category : #'NewWave-Tests'
}

{ #category : #running }
WaveExecutorTest >> setUp [ 
	| se ee t1 we seq seq2 fh |
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
]

{ #category : #tests }
WaveExecutorTest >> testFirstNodeIsStartEvent [
	| node |
	node := waveExecutor flowHandler node.
	self assert: (node isMemberOf: StartEvent) equals: true.
	
]

{ #category : #tests }
WaveExecutorTest >> testFirstNodeIsStartEventByEquality [
	| node |
	node := waveExecutor flowHandler node.
	self assert: node class == StartEvent.
	
]

{ #category : #tests }
WaveExecutorTest >> testFirstNodeIsStartEventByName [
	| node |
	node := waveExecutor flowHandler node.
	self assert: node class name equals: 'StartEvent'.
	
]

{ #category : #tests }
WaveExecutorTest >> testShouldExecuteNextNewHandler [
	| node |
	node := waveExecutor shouldExecuteNextNewHandler.
	self assert: node isNotNil.
	
	
]

{ #category : #tests }
WaveExecutorTest >> testShouldNotExecuteLastNewHandler [
	| node |
	node := waveExecutor shouldExecuteNextNewHandler.
	self assert: node isNotNil.
	node := waveExecutor shouldExecuteNextNewHandler.
	self assert: node isNotNil.
	node := waveExecutor shouldExecuteNextNewHandler.
	self assert: node isNotNil.
	node := waveExecutor shouldExecuteNextNewHandler.
	self assert: node isNil.
	
	
]

{ #category : #tests }
WaveExecutorTest >> testTaskItObject [
	| t1 task |
	t1 := BaseTask new.
	t1 description: 'B'.
	t1 value: 200.
	task := waveExecutor returnTKT: t1.
	self assert: task class == TKTGenericTask.
	
	
]

{ #category : #tests }
WaveExecutorTest >> testTaskItObjectValuable [
	| t1 task |
	t1 := BaseTask new.
	t1 description: 'B'.
	t1 value: 200.
	task := waveExecutor returnTKT: t1.
	self assert: task valuable equals: t1.
	
	
]

{ #category : #tests }
WaveExecutorTest >> testTaskItObjectValue [
	| t1 task |
	t1 := BaseTask new.
	t1 description: 'B'.
	t1 value: 200.
	task := waveExecutor returnTKT: t1.
	self assert: task value equals: 200.
	
	
]

{ #category : #tests }
WaveExecutorTest >> testreturnTKT [
	| t1 task |
	t1 := BaseTask new.
	t1 description: 'B'.
	t1 value: 200.
	task := waveExecutor returnTKT: t1.
	self assert: task value equals: 200.
	self assert: (task valuable isMemberOf: BaseTask ) equals: true.
	
	
]
