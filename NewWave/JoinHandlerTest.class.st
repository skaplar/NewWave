Class {
	#name : #JoinHandlerTest,
	#superclass : #TestCase,
	#category : #'NewWave-Tests'
}

{ #category : #tests }
JoinHandlerTest >> testAddJoinExecutor [
	| je jh |
	je := NWJoinExecutor new.
	jh := NWJoinHandler new.
	jh addJoinExecutor: je.
	self assert: jh joinExecutors size equals: 1.
]

{ #category : #tests }
JoinHandlerTest >> testAddSequenceToExecutors [
	
	| se t1 seq je jh rez |
	se := NWStartEvent new.
	se description: #NWStartEvent.
	
	t1 := NWBaseTask new.
	t1 description: 'B'.
	t1 value: 200.
	
	seq := NWSequence source: se target: t1.

	jh := NWJoinHandler new.
	jh addSequenceToExecutors: seq.
	self assert: jh joinExecutors size equals: 1.

]

{ #category : #tests }
JoinHandlerTest >> testAddSequenceToExistingExecutor [
	
	| t1 t2 t3 seq seq2  pj  jh  |
	
	t1 := NWBaseTask new.
	t1 description: 'B'.
	t1 value: 200.
	
	t2 := NWBaseTask new.
	t2 description: 'C'.
	t2 value: 300.
	
	t3 := NWBaseTask new.
	t3 description: 'D'.
	t3 value: 400.
	
	pj := NWParallelJoin new.
	pj description: #NWParallelJoin.
	
	seq := NWSequence source: t1 target: pj.
	seq2 := NWSequence source: t2 target: pj.
	
	
	jh := NWJoinHandler new.
	jh addSequenceToExecutors: seq.
	jh addSequenceToExecutors: seq2.
	self assert: jh joinExecutors size equals: 1.

]

{ #category : #tests }
JoinHandlerTest >> testCheckIsExecutorCompleted [
	
	| t1 t2 t3 seq seq2  pj  jh  |
	
	t1 := NWBaseTask new.
	t1 description: 'B'.
	t1 value: 200.
	
	t2 := NWBaseTask new.
	t2 description: 'C'.
	t2 value: 300.
	
	t3 := NWBaseTask new.
	t3 description: 'D'.
	t3 value: 400.
	
	pj := NWParallelJoin new.
	pj description: #NWParallelJoin.
	
	seq := NWSequence source: t1 target: pj.
	seq2 := NWSequence source: t2 target: pj.
	
	pj addIncomingFlow: seq.
	pj addIncomingFlow: seq2.
	
	jh := NWJoinHandler new.
	jh addSequenceToExecutors: seq.
	jh addSequenceToExecutors: seq2.
	self assert: (jh checkIsExecutorCompleted: jh joinExecutors first) equals: true.

]

{ #category : #tests }
JoinHandlerTest >> testExecutorAddingElements [
| t1 t2 t3 seq seq2 seq3 pj ee jh jexecutor jtmp |
	
	t1 := NWBaseTask new.
	t1 description: 'B'.
	t1 value: 200.
	
	t2 := NWBaseTask new.
	t2 description: 'C'.
	t2 value: 300.
	
	t3 := NWBaseTask new.
	t3 description: 'D'.
	t3 value: 400.
	
	pj := NWParallelJoin new.
	pj description: #NWParallelJoin.
	
	ee := NWEndEvent new.
	ee description: #NWEndEvent.
	
	seq := NWSequence source: t1 target: pj.
	seq2 := NWSequence source: t2 target: pj.
	seq3 := NWSequence source: pj target: ee. 
	
	pj addIncomingFlow: seq.
	pj addIncomingFlow: seq2.
	pj addOutgoingFlow: seq3.
	
	jh := NWJoinHandler new.
	jtmp := jh addSequenceToExecutors: seq.
	jexecutor := jh addSequenceToExecutors: seq2.
	self assert: jtmp equals: jexecutor
]

{ #category : #tests }
JoinHandlerTest >> testExecutorElements [
| t1 t2 t3 seq seq2 seq3 pj ee jh jexecutor |
	
	t1 := NWBaseTask new.
	t1 description: 'B'.
	t1 value: 200.
	
	t2 := NWBaseTask new.
	t2 description: 'C'.
	t2 value: 300.
	
	t3 := NWBaseTask new.
	t3 description: 'D'.
	t3 value: 400.
	
	pj := NWParallelJoin new.
	pj description: #NWParallelJoin.
	
	ee := NWEndEvent new.
	ee description: #NWEndEvent.
	
	seq := NWSequence source: t1 target: pj.
	seq2 := NWSequence source: t2 target: pj.
	seq3 := NWSequence source: pj target: ee. 
	
	pj addIncomingFlow: seq.
	pj addIncomingFlow: seq2.
	pj addOutgoingFlow: seq3.
	
	jh := NWJoinHandler new.
	jh addSequenceToExecutors: seq.
	jexecutor := jh addSequenceToExecutors: seq2.
	self assert: jexecutor incSequences size equals: 2
]

{ #category : #tests }
JoinHandlerTest >> testJoinExecutorsInitializes [
	| jh |
	jh := NWJoinHandler new.
	self assert: jh joinExecutors size equals: 0.
]

{ #category : #tests }
JoinHandlerTest >> testJoinNodeRemainsUnchanged [
| t1 t2 t3 seq seq2 seq3 pj ee jh jexecutor |
	
	t1 := NWBaseTask new.
	t1 description: 'B'.
	t1 value: 200.
	
	t2 := NWBaseTask new.
	t2 description: 'C'.
	t2 value: 300.
	
	t3 := NWBaseTask new.
	t3 description: 'D'.
	t3 value: 400.
	
	pj := NWParallelJoin new.
	pj description: #NWParallelJoin.
	
	ee := NWEndEvent new.
	ee description: #NWEndEvent.
	
	seq := NWSequence source: t1 target: pj.
	seq2 := NWSequence source: t2 target: pj.
	seq3 := NWSequence source: pj target: ee. 
	
	pj addIncomingFlow: seq.
	pj addIncomingFlow: seq2.
	pj addOutgoingFlow: seq3.
	
	jh := NWJoinHandler new.
	jh addSequenceToExecutors: seq.
	jexecutor := jh addSequenceToExecutors: seq2.
	self assert: pj equals: jexecutor joinNode.
]

{ #category : #tests }
JoinHandlerTest >> testReturnNodeAfterJoin [
| t1 t2 t3 seq seq2 seq3 pj ee jh jexecutor |
	
	t1 := NWBaseTask new.
	t1 description: 'B'.
	t1 value: 200.
	
	t2 := NWBaseTask new.
	t2 description: 'C'.
	t2 value: 300.
	
	t3 := NWBaseTask new.
	t3 description: 'D'.
	t3 value: 400.
	
	pj := NWParallelJoin new.
	pj description: #NWParallelJoin.
	
	ee := NWEndEvent new.
	ee description: #NWEndEvent.
	
	seq := NWSequence source: t1 target: pj.
	seq2 := NWSequence source: t2 target: pj.
	seq3 := NWSequence source: pj target: ee. 
	
	pj addIncomingFlow: seq.
	pj addIncomingFlow: seq2.
	pj addOutgoingFlow: seq3.
	
	jh := NWJoinHandler new.
	jh addSequenceToExecutors: seq.
	jexecutor := jh addSequenceToExecutors: seq2.
	self assert: ee equals: jexecutor returnNodeAfterJoin.
]
