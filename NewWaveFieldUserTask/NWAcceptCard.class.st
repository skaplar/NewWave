Class {
	#name : #NWAcceptCard,
	#superclass : #Object,
	#instVars : [
		'id',
		'cvv',
		'name',
		'amount',
		'cardNumber'
	],
	#category : #'NewWaveFieldUserTask-Entities'
}

{ #category : #examples }
NWAcceptCard class >> example1 [ 
	| tmp |
	tmp := self new.
	tmp id: '1'.
	tmp cardNumber: ''.
	tmp cvv: ''.
	tmp name: ''.
	tmp amount: 0.
	^ tmp.
]

{ #category : #accessing }
NWAcceptCard >> amount [
	^ amount
]

{ #category : #accessing }
NWAcceptCard >> amount: anObject [
	amount := anObject
]

{ #category : #accessing }
NWAcceptCard >> cardNumber [
	^ cardNumber
]

{ #category : #accessing }
NWAcceptCard >> cardNumber: anObject [
	cardNumber := anObject
]

{ #category : #accessing }
NWAcceptCard >> cvv [
	^ cvv
]

{ #category : #accessing }
NWAcceptCard >> cvv: anObject [
	cvv := anObject
]

{ #category : #accessing }
NWAcceptCard >> id [
	^ id
]

{ #category : #accessing }
NWAcceptCard >> id: anObject [
	id := anObject
]

{ #category : #accessing }
NWAcceptCard >> name [
	^ name
]

{ #category : #accessing }
NWAcceptCard >> name: anObject [
	name := anObject
]
