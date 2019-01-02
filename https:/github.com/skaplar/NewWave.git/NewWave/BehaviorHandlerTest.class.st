Class {
	#name : #BehaviorHandlerTest,
	#superclass : #TestCase,
	#category : #'NewWave-Tests'
}

{ #category : #initialization }
BehaviorHandlerTest >> testExclusiveGateway [
	| bh se |
	bh := BehaviorHandler new.
	se := bh behaviors at: #ExclusiveGateway.
	self assert: se className equals: 'ExclusiveGatewayBehavior'.
]

{ #category : #initialization }
BehaviorHandlerTest >> testInitialize [
	| bh se |
	bh := BehaviorHandler new.
	se := bh behaviors at: #StartEvent.
	self assert: se className equals: 'StartEventBehavior'.
]

{ #category : #initialization }
BehaviorHandlerTest >> testTaskEndEvent [
	| bh se |
	bh := BehaviorHandler new.
	se := bh behaviors at: #EndEvent.
	self assert: se className equals: 'EndEventBehavior'.
]

{ #category : #initialization }
BehaviorHandlerTest >> testTaskEvent [
	| bh se |
	bh := BehaviorHandler new.
	se := bh behaviors at: #BaseTask.
	self assert: se className equals: 'TaskEventBehavior'.
]
