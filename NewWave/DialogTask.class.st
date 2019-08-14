Class {
	#name : #DialogTask,
	#superclass : #BaseTask,
	#instVars : [
		'dialog'
	],
	#category : #'NewWave-Model'
}

{ #category : #accessing }
DialogTask >> dialog [
	^ UIManager default question: 'foo' title: 'bar'.
]

{ #category : #accessing }
DialogTask >> dialog: anObject [
	dialog := anObject
]

{ #category : #initialization }
DialogTask >> initialize [ 
	super initialize.
]

{ #category : #accessing }
DialogTask >> value [ 
	^ self dialog.
]
