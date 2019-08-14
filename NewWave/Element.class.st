Class {
	#name : #Element,
	#superclass : #Object,
	#instVars : [
		'description',
		'ctype',
		'id'
	],
	#category : #'NewWave-Core'
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

{ #category : #accessing }
Element >> id [ 
	^ id
]

{ #category : #accessing }
Element >> id: anId [
	id := anId
]
