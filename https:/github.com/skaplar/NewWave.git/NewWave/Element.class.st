Class {
	#name : #Element,
	#superclass : #Object,
	#instVars : [
		'description',
		'ctype'
	],
	#category : #NewWave
}

{ #category : #accessing }
Element >> ctype [
	^ ShouldBeImplemented
]

{ #category : #accessing }
Element >> description [
	^ description 
]

{ #category : #accessing }
Element >> description: anObject [
	description := anObject 
]
