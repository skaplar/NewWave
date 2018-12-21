Class {
	#name : #TestBehaviorHandler,
	#superclass : #TestCase,
	#category : #'NewWave-Test'
}

{ #category : #initialization }
TestBehaviorHandler >> testInitialize [
	| bh se |
	bh := BehaviorHandler new.
	se := bh behaviors at: #StartEvent.
	self assert: se className equals: 'StartEventBehavior'.
]
