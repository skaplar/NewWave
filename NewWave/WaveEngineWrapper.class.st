Class {
	#name : #WaveEngineWrapper,
	#superclass : #Object,
	#instVars : [
		'processDict',
		'scheduler',
		'server'
	],
	#category : #'NewWave-Engine'
}

{ #category : #initialization }
WaveEngineWrapper >> initialize [

	super initialize.
	processDict := Dictionary new.	
	"server := NewWaveServer serveOn: 8081 waveEngine: self."
]

{ #category : #accessing }
WaveEngineWrapper >> processDict [
	^ processDict
]

{ #category : #accessing }
WaveEngineWrapper >> processDict: anObject [
	processDict := anObject
]

{ #category : #accessing }
WaveEngineWrapper >> server [
	^ server
]

{ #category : #accessing }
WaveEngineWrapper >> server: anObject [
	server := anObject
]

{ #category : #accessing }
WaveEngineWrapper >> startAll [
	processDict valuesDo: [ :we | we startEngine ]
]

{ #category : #accessing }
WaveEngineWrapper >> startOneProcessEngine: aKey [
	| processEngine |
	processEngine := processDict at: aKey ifAbsent: [ 'Can''t find process engine' ].
	processEngine start.
]

{ #category : #accessing }
WaveEngineWrapper >> stopAll [
	processDict valuesDo: [ :we | we stopEngine ]
]

{ #category : #accessing }
WaveEngineWrapper >> stopOneProcessEngine: aKey [
	| processEngine |
	processEngine := processDict at: aKey ifAbsent: [ 'Can''t find process engine' ].
	processEngine stop.
]
