"
I represent a class that handles joins in a subprocess. 
This class is created by the WaveExecutor.

Internal Representation and Key Implementation Points.

    Instance Variables
	joinExecutors:		<OrderedCollection JoinExecutor>
	context: <WaveExecutor]

    Implementation Points
"
Class {
	#name : #JoinHandler,
	#superclass : #Object,
	#instVars : [
		'joinExecutors',
		'context'
	],
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
JoinHandler class >> context: aContext [
	^ self new 
	context: aContext;
	yourself.
]

{ #category : #accessing }
JoinHandler >> addJoinExecutor: aJoinExecutor [
	joinExecutors add: aJoinExecutor 
]

{ #category : #accessing }
JoinHandler >> addSequenceToExecutors: aSequence [
	| jExecutor |
	jExecutor := joinExecutors select: [ :each | each joinNode = aSequence targetRef  ].
	jExecutor ifNotEmpty: [  
		| ex |
		ex := jExecutor first.
		ex addIncSequence: aSequence.
		^ ex.
	]  
	ifEmpty: [  
		| je |
		je := JoinExecutor new.
		je joinNode: aSequence targetRef.
		je addIncSequence: aSequence.
		self addJoinExecutor: je.
		^ je.
	]. 
]

{ #category : #accessing }
JoinHandler >> checkIsExecutorCompleted: jExecutor [
	"This is where I check if the executor has finished its part. All sequences have come together."
	jExecutor checkIsFinished 
		ifTrue: [ 'Executor Completed' logCr. ^ true ] 
		ifFalse: [ 'Executor Not completed' logCr. ^ false ].
]

{ #category : #accessing }
JoinHandler >> context [ 
	^ context
]

{ #category : #accessing }
JoinHandler >> context: aContext [
	context := aContext
]

{ #category : #accessing }
JoinHandler >> initialize [ 
	super initialize.
	joinExecutors := OrderedCollection new.
]

{ #category : #accessing }
JoinHandler >> joinExecutors [
	^ joinExecutors
]
