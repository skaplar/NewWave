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
	#name : #NWExecutor,
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
NWExecutor class >> initialNode: node [
	| fh |
	fh := NWFlowHandler new.
	fh node: node.
	^ self new 
		flowHandler: fh;
		yourself
]

{ #category : #'as yet unclassified' }
NWExecutor class >> initialNode: node processHandler: aProcessHandler [
	| fh |
	fh := NWFlowHandler new.
	fh node: node.
	^ self new 
		flowHandler: fh;
		processHandler: aProcessHandler;
		yourself
]

{ #category : #running }
NWExecutor >> activationForNode: aNode [
	| activation |
	activation := self activations at: aNode ifAbsent: [ self newActivationForNode: aNode ].
	" Treba dodati proveru o workListi i o tome sta se izvrsava, odnosno ako je vec dodata jednom aktivacija ne bi je trebalo dodavati drugi put."
	"self workList addToRunning: activation."
	^ activation.
	
]

{ #category : #running }
NWExecutor >> activations [
	^ processHandler activations
]

{ #category : #running }
NWExecutor >> execute: elem [
	| elemHandler executor |
	elemHandler := NWBehaviorHandler new.
	executor := elemHandler behaviors at: elem ctype.
	" Ideja je da bi execute mogao da se pozove i naknadno, odnosno ukoliko je aktivacija vec napravljena ili treba da se nastavi nakon prekida."
	self workList addToRunning: (self activationForNode: elem).
	executor performExecution: elem executor: self.
	
	
	
	
]

{ #category : #accessing }
NWExecutor >> flowHandler [
	^ flowHandler
]

{ #category : #accessing }
NWExecutor >> flowHandler: aFlowHandler [
	flowHandler := aFlowHandler
]

{ #category : #initialization }
NWExecutor >> initialize [

	super initialize.
	waveAnnouncer := Announcer new.
	workers := Dictionary new.
]

{ #category : #running }
NWExecutor >> newActivationForNode: aNode [
	| activation |
	(self activations includesKey: aNode) ifTrue: [ self error: 'Activation already exists!'].
	activation := self activations at: aNode put: (NWActivation node: aNode executor: self).
	"engine logNewActivation: activation on: self forNode: aNode."
	^ activation.
]

{ #category : #accessing }
NWExecutor >> processHandler [
	^ processHandler
]

{ #category : #accessing }
NWExecutor >> processHandler: anEngine [
	processHandler := anEngine
]

{ #category : #'as yet unclassified' }
NWExecutor >> returnTKT: aTask [
	^ TKTTask valuable: aTask.
]

{ #category : #accessing }
NWExecutor >> shouldExecuteNextNewHandler [
	^ flowHandler getNextElement.
]

{ #category : #accessing }
NWExecutor >> taskResult [
	^ taskResult
]

{ #category : #accessing }
NWExecutor >> taskResult: anObject [
	taskResult := anObject
]

{ #category : #tests }
NWExecutor >> testExe [
| future |
future := [ 1 second wait. 2 + 2 ] future.
future onSuccessDo: [ :v | v logCr ].
]

{ #category : #accessing }
NWExecutor >> tryToExecuteNext [
	| tmp |
	tmp := self shouldExecuteNextNewHandler.
	"So this should happen once, when the element should be activated and executed"
	"self newActivationForNode: tmp."
	self execute: tmp.
]

{ #category : #accessing }
NWExecutor >> tryToExecuteNext: aCompletedNode [
	| tmp |
	self workList addToCompleted: (self activationForNode: aCompletedNode).
	tmp := self shouldExecuteNextNewHandler.	
	processHandler stopNotRunningBoundaryEvents.
	"So this should happen once, when the element should be activated and executed"
	"self newActivationForNode: tmp."
	self execute: tmp.
]

{ #category : #accessing }
NWExecutor >> waveAnnouncer [
	^ waveAnnouncer
]

{ #category : #accessing }
NWExecutor >> waveAnnouncer: anObject [
	waveAnnouncer := anObject
]

{ #category : #running }
NWExecutor >> workList [
	^ processHandler workList
]

{ #category : #accessing }
NWExecutor >> worker [
	^ workers at: flowHandler workerid.
]

{ #category : #running }
NWExecutor >> workers [
	^ workers
]

{ #category : #running }
NWExecutor >> workers: aWorkers [
	workers := aWorkers
]
