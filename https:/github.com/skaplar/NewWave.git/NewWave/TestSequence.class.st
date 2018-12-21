Class {
	#name : #TestSequence,
	#superclass : #TestCase,
	#category : #'NewWave-Test'
}

{ #category : #tests }
TestSequence >> testSequenceCreation [
	| s a b |
	a := BaseTask new.
	b := BaseTask new.
	s := Sequence source: a target: b.
	self assert: s sourceRef equals: a.
	self assert: s targetRef equals: b.
]

{ #category : #tests }
TestSequence >> testSequenceCreationWithCondition [
	| s a b |
	a := BaseTask new.
	b := BaseTask new.
	s := Sequence source: a target: b condition: true.
	self assert: s condition equals: true.
]

{ #category : #tests }
TestSequence >> testSequenceInitialSourceTargetFalse [
	| s a b |
	a := BaseTask new.
	b := BaseTask new.
	s := Sequence source: a target: b condition: true.
	self assert: s srcFetched equals: false.
	self assert: s targetFetched equals: false.
]
