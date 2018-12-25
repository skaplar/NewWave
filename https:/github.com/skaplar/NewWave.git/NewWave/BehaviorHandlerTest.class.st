Class {
	#name : #BehaviorHandlerTest,
	#superclass : #TestCase,
	#category : #'NewWave-Tests'
}

{ #category : #initialization }
BehaviorHandlerTest >> testInitialize [
	| bh se |
	bh := BehaviorHandler new.
	se := bh behaviors at: #StartEvent.
	self assert: se className equals: 'StartEventBehavior'.
]
