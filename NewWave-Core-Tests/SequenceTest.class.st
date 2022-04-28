Class {
	#name : #SequenceTest,
	#superclass : #TestCase,
	#category : #'NewWave-Core-Tests'
}

{ #category : #tests }
SequenceTest >> testSequenceCreation [
	| s a b |
	a := NWBaseTask new.
	b := NWBaseTask new.
	s := NWSequence source: a target: b.
	self assert: s sourceRef equals: a.
	self assert: s targetRef equals: b.
]

{ #category : #tests }
SequenceTest >> testSequenceCreationWithCondition [
	| s a b |
	a := NWBaseTask new.
	b := NWBaseTask new.
	s := NWSequence source: a target: b condition: [:x | x = true]. 
	self assert: (s condition value: true) equals: true. 
]

{ #category : #tests }
SequenceTest >> testSequenceCreationWithNumberCondition [
	| s a b |
	a := NWBaseTask new.
	b := NWBaseTask new.
	s := NWSequence source: a target: b condition: [:x | x = 200].
	self assert: (s condition value: 200) equals: true.

]

{ #category : #tests }
SequenceTest >> testSequenceInitialSourceTargetFalse [
	| s a b |
	a := NWBaseTask new.
	b := NWBaseTask new.
	s := NWSequence source: a target: b condition: true.
	self assert: s srcFetched equals: false.
	self assert: s targetFetched equals: false.
]
