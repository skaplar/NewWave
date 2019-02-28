Class {
	#name : #WaveWorkList,
	#superclass : #Object,
	#instVars : [
		'running'
	],
	#category : #'NewWave-Engine'
}

{ #category : #adding }
WaveWorkList >> addToCompleted: activation [
	activation completed: true.
	"Proveriti da li je vec aktivacija pocela, ako je pocela podigni error
	running remove: activation.
	completed add: activation."
	
	"Treba zabaleziti za istoriju.... noteRunOf: anActivation in: self"
]

{ #category : #adding }
WaveWorkList >> addToRunning: activation [
	"Proveriti da li je vec aktivacija pocela, ako je pocela podigni error"
	"running add: activation"
	activation activated: true.
	running indexOf: activation ifAbsent: [ running add: activation ].
	"Treba zabaleziti za istoriju.... noteRunOf: anActivation in: self"
	
]

{ #category : #adding }
WaveWorkList >> completed [
	^ running select: [ :each | each completed ]
]

{ #category : #adding }
WaveWorkList >> initialize [ 
	super initialize.
	running := OrderedCollection new.
]

{ #category : #adding }
WaveWorkList >> running [
	^ running select: [ :each | each activated ].
]
