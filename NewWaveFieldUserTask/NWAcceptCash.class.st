Class {
	#name : #NWAcceptCash,
	#superclass : #Object,
	#instVars : [
		'id',
		'amount',
		'tip'
	],
	#category : #'NewWaveFieldUserTask-Entities'
}

{ #category : #examples }
NWAcceptCash class >> example1 [ 
	| tmp |
	tmp := self new.
	tmp id: '1'.
	tmp amount: 0.
	tmp tip: 0.
	^ tmp
]

{ #category : #accessing }
NWAcceptCash >> amount [
	^ amount
]

{ #category : #accessing }
NWAcceptCash >> amount: anObject [
	amount := anObject
]

{ #category : #accessing }
NWAcceptCash >> id [
	^ id
]

{ #category : #accessing }
NWAcceptCash >> id: anObject [
	id := anObject
]

{ #category : #accessing }
NWAcceptCash >> tip [
	^ tip
]

{ #category : #accessing }
NWAcceptCash >> tip: anObject [
	tip := anObject
]
