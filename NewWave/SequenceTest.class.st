Class {
	#name : #SequenceTest,
	#superclass : #TestCase,
	#category : #'NewWave-Tests'
}

{ #category : #tests }
SequenceTest >> testSequenceCreation [
	| s a b |
	a := BaseTask new.
	b := BaseTask new.
	s := Sequence source: a target: b.
	self assert: s sourceRef equals: a.
	self assert: s targetRef equals: b.
]

{ #category : #tests }
SequenceTest >> testSequenceCreationWithCondition [
	| s a b |
	a := BaseTask new.
	b := BaseTask new.
	s := Sequence source: a target: b condition: true.
	self assert: s condition equals: true.
]

{ #category : #tests }
SequenceTest >> testSequenceCreationWithNumberCondition [
	| s a b |
	a := BaseTask new.
	b := BaseTask new.
	s := Sequence source: a target: b condition: 200.
	self assert: s condition equals: 200.
]

{ #category : #tests }
SequenceTest >> testSequenceInitialSourceTargetFalse [
	| s a b |
	a := BaseTask new.
	b := BaseTask new.
	s := Sequence source: a target: b condition: true.
	self assert: s srcFetched equals: false.
	self assert: s targetFetched equals: false.
]
