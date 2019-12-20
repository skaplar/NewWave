"
I am an executor in the workflow engine. To work i need context (WaveEngine) and flowHandler for handling the flow and determining the paths of execution.

In order to initialize, I need a node an initial which contains the information needed for execution.
The most basic execution would be from start to end node.

start := StartEvent new.
start description: 'StartEvent'.

end := EndEvent new.
end description: 'End Event ee'.

seq1 := Sequence source: start target: end.
start addOutgoingFlow: seq1.
end addIncomingFlow: seq1. 

we := WaveExecutor initialNode: start.

Internal Representation and Key Implementation Points.

    Instance Variables
	engine:		<Object>
	flowHandler:		<Object>
	taskResult:		<Object>
	waveAnnouncer:		<Object>
	workers:		<Object>


    Implementation Points
"
Class {
	#name : #WaveExecutor,
	#superclass : #Object,
	#instVars : [
		'waveAnnouncer',
		'taskResult',
		'flowHandler',
		'workers',
		'processHandler'
	],
	#category : #'NewWave-Engine'
}

{ #category : #'as yet unclassified' }
WaveExecutor class >> initialNode: node [
	| fh |
	fh := FlowHandler new.
	fh node: node.
	^ self new 
		flowHandler: fh;
		yourself
]

{ #category : #'as yet unclassified' }
WaveExecutor class >> initialNode: node engine: aEngine [
	| fh |
	fh := FlowHandler new.
	fh node: node.
	^ self new 
		flowHandler: fh;
		engine: aEngine;
		yourself
]

{ #category : #running }
WaveExecutor >> activationForNode: aNode [
	| activation |
	activation := self activations at: aNode ifAbsent: [ self newActivationForNode: aNode ].
	" Treba dodati proveru o workListi i o tome sta se izvrsava, odnosno ako je vec dodata jednom aktivacija ne bi je trebalo dodavati drugi put."
	"self workList addToRunning: activation."
	^ activation.
	
]

{ #category : #running }
WaveExecutor >> activations [
	^ processHandler activations
]

{ #category : #running }
WaveExecutor >> execute: elem [
	| elemHandler executor |
	elemHandler := BehaviorHandler new.
	executor := elemHandler behaviors at: elem ctype.
	" Ideja je da bi execute mogao da se pozove i naknadno, odnosno ukoliko je aktivacija vec napravljena ili treba da se nastavi nakon prekida."
	self workList addToRunning: (self activationForNode: elem).
	executor performExecution: elem executor: self.
	
	
	
	
]

{ #category : #accessing }
WaveExecutor >> flowHandler [
	^ flowHandler
]

{ #category : #accessing }
WaveExecutor >> flowHandler: aFlowHandler [
	flowHandler := aFlowHandler
]

{ #category : #initialization }
WaveExecutor >> initialize [

	super initialize.
	waveAnnouncer := Announcer new.
	workers := Dictionary new.
]

{ #category : #running }
WaveExecutor >> newActivationForNode: aNode [
	| activation |
	(self activations includesKey: aNode) ifTrue: [ self error: 'Activation already exists!'].
	activation := self activations at: aNode put: (WaveActivation node: aNode executor: self).
	"engine logNewActivation: activation on: self forNode: aNode."
	^ activation.
]

{ #category : #accessing }
WaveExecutor >> processHandler [
	^ processHandler
]

{ #category : #accessing }
WaveExecutor >> processHandler: anEngine [
	processHandler := anEngine
]

{ #category : #'as yet unclassified' }
WaveExecutor >> returnTKT: aTask [
	^ TKTTask valuable: aTask.
]

{ #category : #accessing }
WaveExecutor >> shouldExecuteNextNewHandler [
	^ flowHandler getNextElement.
]

{ #category : #accessing }
WaveExecutor >> taskResult [
	^ taskResult
]

{ #category : #accessing }
WaveExecutor >> taskResult: anObject [
	taskResult := anObject
]

{ #category : #tests }
WaveExecutor >> testExe [
| future |
future := [ 1 second wait. 2 + 2 ] future.
future onSuccessDo: [ :v | v logCr ].
]

{ #category : #accessing }
WaveExecutor >> tryToExecuteNext [
	| tmp |
	tmp := self shouldExecuteNextNewHandler.
	"So this should happen once, when the element should be activated and executed"
	"self newActivationForNode: tmp."
	self execute: tmp.
]

{ #category : #accessing }
WaveExecutor >> tryToExecuteNext: aCompletedNode [
	| tmp |
	self workList addToCompleted: (self activationForNode: aCompletedNode).
	tmp := self shouldExecuteNextNewHandler.
	"So this should happen once, when the element should be activated and executed"
	"self newActivationForNode: tmp."
	self execute: tmp.
]

{ #category : #accessing }
WaveExecutor >> waveAnnouncer [
	^ waveAnnouncer
]

{ #category : #accessing }
WaveExecutor >> waveAnnouncer: anObject [
	waveAnnouncer := anObject
]

{ #category : #running }
WaveExecutor >> workList [
	^ processHandler workList
]

{ #category : #accessing }
WaveExecutor >> worker [
	^ workers at: flowHandler workerid.
]

{ #category : #running }
WaveExecutor >> workers [
	^ workers
]

{ #category : #running }
WaveExecutor >> workers: aWorkers [
	workers := aWorkers
]
