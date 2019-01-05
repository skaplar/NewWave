Class {
	#name : #JoinHandlerTest,
	#superclass : #TestCase,
	#category : #'NewWave-Tests'
}

{ #category : #tests }
JoinHandlerTest >> testAddJoinExecutor [
	| je jh |
	je := JoinExecutor new.
	jh := JoinHandler new.
	jh addJoinExecutor: je.
	self assert: jh joinExecutors size equals: 1.
]

{ #category : #tests }
JoinHandlerTest >> testAddSequenceToExecutors [
	
	| se t1 seq je jh rez |
	se := StartEvent new.
	se description: 'StartEvent'.
	
	t1 := BaseTask new.
	t1 description: 'B'.
	t1 value: 200.
	
	seq := Sequence source: se target: t1.

	jh := JoinHandler new.
	jh addSequenceToExecutors: seq.
	self assert: jh joinExecutors size equals: 1.

]

{ #category : #tests }
JoinHandlerTest >> testAddSequenceToExistingExecutor [
	
	| t1 t2 t3 seq seq2  pj  jh  |
	
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
	
	
	jh := JoinHandler new.
	jh addSequenceToExecutors: seq.
	jh addSequenceToExecutors: seq2.
	self assert: jh joinExecutors size equals: 1.

]

{ #category : #tests }
JoinHandlerTest >> testCheckIsExecutorCompleted [
	
	| t1 t2 t3 seq seq2  pj  jh  |
	
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
	
	jh := JoinHandler new.
	jh addSequenceToExecutors: seq.
	jh addSequenceToExecutors: seq2.
	self assert: (jh checkIsExecutorCompleted: jh joinExecutors first) equals: true.

]

{ #category : #tests }
JoinHandlerTest >> testJoinExecutorsInitializes [
	| jh |
	jh := JoinHandler new.
	self assert: jh joinExecutors size equals: 0.
]
