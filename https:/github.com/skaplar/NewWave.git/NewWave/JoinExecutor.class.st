Class {
	#name : #JoinExecutor,
	#superclass : #Object,
	#instVars : [
		'joinNode',
		'incSequences'
	],
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
JoinExecutor >> addIncSequence: aSequence [
	incSequences add: aSequence
]

{ #category : #accessing }
JoinExecutor >> checkIsFinished [
	"Za sad samo proveravam velicinu, treba proveriti da li su to te sekvence"
	^ joinNode incomingFlows size equals: incSequences size.
]

{ #category : #accessing }
JoinExecutor >> incSequences [
	^ incSequences
]

{ #category : #accessing }
JoinExecutor >> initialize [ 
	super initialize.
	incSequences := OrderedCollection new.
]

{ #category : #accessing }
JoinExecutor >> joinNode [
	^ joinNode
]

{ #category : #accessing }
JoinExecutor >> joinNode: aJoinNode [
	joinNode := aJoinNode 
]
