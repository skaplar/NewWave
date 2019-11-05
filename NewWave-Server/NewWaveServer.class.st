Class {
	#name : #NewWaveServer,
	#superclass : #Object,
	#instVars : [
		'port',
		'teapot',
		'engine',
		'element',
		'pendingTasks'
	],
	#category : #'NewWave-Server'
}

{ #category : #initialization }
NewWaveServer >> readEvents: aRequest [
	| n prvi |
	n := pendingTasks at: 'default'.
	n ifNil: [ ^ 'Non-existing user' ].
	n ifEmpty: [ ^ 'Empty' ].
	prvi := n first. 
	^ prvi value.
]
