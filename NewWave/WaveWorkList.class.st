Class {
	#name : #WaveWorkList,
	#superclass : #Object,
	#instVars : [
		'completed',
		'running'
	],
	#category : #'NewWave-Engine'
}

{ #category : #adding }
WaveWorkList >> addToRunning: activation [
	"Proveriti da li je vec aktivacija pocela, ako je pocela podigni error"
	running add: activation
	"Treba zabaleziti za istoriju.... noteRunOf: anActivation in: self"
]

{ #category : #adding }
WaveWorkList >> initialize [ 
	super initialize.
	
	running := OrderedCollection new.
	completed := OrderedCollection new.
]
