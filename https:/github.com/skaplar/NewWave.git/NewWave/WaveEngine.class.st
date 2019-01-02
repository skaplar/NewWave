Class {
	#name : #WaveEngine,
	#superclass : #Object,
	#instVars : [
		'waveExecutors'
	],
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
WaveEngine >> waveExecutors [
	^ waveExecutors
]

{ #category : #accessing }
WaveEngine >> waveExecutors: executors [
	waveExecutors := executors 
]
