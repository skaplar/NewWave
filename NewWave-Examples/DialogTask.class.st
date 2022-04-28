Class {
	#name : #DialogTask,
	#superclass : #NWBaseTask,
	#instVars : [
		'dialog'
	],
	#category : #'NewWave-Examples'
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
