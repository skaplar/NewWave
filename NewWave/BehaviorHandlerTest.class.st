Class {
	#name : #BehaviorHandlerTest,
	#superclass : #TestCase,
	#category : #'NewWave-Tests'
}

{ #category : #initialization }
BehaviorHandlerTest >> testExclusiveGateway [
	| bh se |
	bh := NWBehaviorHandler new.
	se := bh behaviors at: #ExclusiveGateway.
	self assert: se className equals: 'ExclusiveGatewayBehavior'.
]

{ #category : #initialization }
BehaviorHandlerTest >> testInitialize [
	| bh se |
	bh := NWBehaviorHandler new.
	se := bh behaviors at: #NWStartEvent.
	self assert: se className equals: 'StartEventBehavior'.
]

{ #category : #initialization }
BehaviorHandlerTest >> testTaskEndEvent [
	| bh se |
	bh := NWBehaviorHandler new.
	se := bh behaviors at: #NWEndEvent.
	self assert: se className equals: 'EndEventBehavior'.
]

{ #category : #initialization }
BehaviorHandlerTest >> testTaskEvent [
	| bh se |
	bh := NWBehaviorHandler new.
	se := bh behaviors at: #NWBaseTask.
	self assert: se className equals: 'TaskEventBehavior'.
]
