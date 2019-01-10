Class {
	#name : #WaveEngine,
	#superclass : #Object,
	#instVars : [
		'mainExecutor',
		'joinHandler',
		'subExecutors'
	],
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
WaveEngine >> addExecutor: anExecutor [
	self mainExecutor: anExecutor.
	self mainExecutor engine: self.
]

{ #category : #accessing }
WaveEngine >> addSubExecutor: anInitialNode [
	| se |
	se := SubExecutor initialNode: anInitialNode parentExecutor: self.
	se startSubExecutor.
	subExecutors add: se.
]

{ #category : #accessing }
WaveEngine >> initialize [ 
	super initialize.
	self joinHandler: (JoinHandler context: self).
	self subExecutors: OrderedCollection new.
]

{ #category : #accessing }
WaveEngine >> joinHandler [
	^ joinHandler 
]

{ #category : #accessing }
WaveEngine >> joinHandler: aJoinHandler [
	joinHandler := aJoinHandler 
]

{ #category : #accessing }
WaveEngine >> mainExecutor [
	^ mainExecutor
]

{ #category : #accessing }
WaveEngine >> mainExecutor: executors [
	mainExecutor := executors 
]

{ #category : #accessing }
WaveEngine >> startEngine [
	mainExecutor tryToExecuteNext.
	mainExecutor waveAnnouncer announce: StartAnnouncer new.
]

{ #category : #accessing }
WaveEngine >> subExecutors [
	^ subExecutors 
]

{ #category : #accessing }
WaveEngine >> subExecutors: aSubExecutor [
	subExecutors := aSubExecutor 
]
