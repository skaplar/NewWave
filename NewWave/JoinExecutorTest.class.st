Class {
	#name : #JoinExecutorTest,
	#superclass : #TestCase,
	#category : #'NewWave-Tests'
}

{ #category : #tests }
JoinExecutorTest >> testAddIncSequence [
	
	| t1 t2 t3 seq seq2  pj  je |
	
	t1 := BaseTask new.
	t1 description: 'B'.
	t1 value: 200.
	
	t2 := BaseTask new.
	t2 description: 'C'.
	t2 value: 300.
	
	t3 := BaseTask new.
	t3 description: 'D'.
	t3 value: 400.
	
	pj := ParallelJoin new.
	pj description: 'ParallelJoin'.
	
	seq := Sequence source: t1 target: pj.
	seq2 := Sequence source: t2 target: pj.
	
	pj addIncomingFlow: seq.
	pj addIncomingFlow: seq2.
	
	je := JoinExecutor new.
	je joinNode: pj.
	
	je addIncSequence: seq.
	self assert: je incSequences size equals: 1.
	je addIncSequence: seq2.
	self assert: je incSequences size equals: 2.

]

{ #category : #tests }
JoinExecutorTest >> testCheckIsFinished [
	
	| t1 t2 t3 seq seq2  pj  je |
	
	t1 := BaseTask new.
	t1 description: 'B'.
	t1 value: 200.
	
	t2 := BaseTask new.
	t2 description: 'C'.
	t2 value: 300.
	
	t3 := BaseTask new.
	t3 description: 'D'.
	t3 value: 400.
	
	pj := ParallelJoin new.
	pj description: 'ParallelJoin'.
	
	seq := Sequence source: t1 target: pj.
	seq2 := Sequence source: t2 target: pj.
	
	pj addIncomingFlow: seq.
	pj addIncomingFlow: seq2.
	
	je := JoinExecutor new.
	je joinNode: pj.
	
	je addIncSequence: seq.
	je addIncSequence: seq2.
	self assert: je checkIsFinished equals: true.

]

{ #category : #tests }
JoinExecutorTest >> testreturnNodeAfterJoin [
	
	| t1 t2 t3 seq seq2  pj  je  seq3|
	
	t1 := BaseTask new.
	t1 description: 'B'.
	t1 value: 200.
	
	t2 := BaseTask new.
	t2 description: 'C'.
	t2 value: 300.
	
	t3 := BaseTask new.
	t3 description: 'D'.
	t3 value: 400.
	
	pj := ParallelJoin new.
	pj description: 'ParallelJoin'.
	
	seq := Sequence source: t1 target: pj.
	seq2 := Sequence source: t2 target: pj.
	seq3 := Sequence source: pj target: t3.
	
	pj addIncomingFlow: seq.
	pj addIncomingFlow: seq2.
	pj addOutgoingFlow: seq3.
	
	je := JoinExecutor new.
	je joinNode: pj.
	
	je addIncSequence: seq.
	je addIncSequence: seq2.
	
	self assert: je returnNodeAfterJoin equals: t3.

]
