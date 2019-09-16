Class {
	#name : #Address,
	#superclass : #Object,
	#instVars : [
		'street',
		'place'
	],
	#category : #'NewWave-Example'
}

{ #category : #examples }
Address class >> example1 [ 
| addr |
addr := self new.
addr street: 'Test Street'.
addr place: 'Test Place'.
^ addr.
]

{ #category : #accessing }
Address >> place [
	^ place
]

{ #category : #accessing }
Address >> place: anObject [
	place := anObject
]

{ #category : #accessing }
Address >> street [
	^ street
]

{ #category : #accessing }
Address >> street: anObject [
	street := anObject
]
