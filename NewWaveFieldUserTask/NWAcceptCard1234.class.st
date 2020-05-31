Class {
	#name : #NWAcceptCard1234,
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

{ #category : #'as yet unclassified' }
NWAcceptCard1234 >> amount [
		^ amount
]

{ #category : #'as yet unclassified' }
NWAcceptCard1234 >> amount: anObject [
		amount := anObject
]

{ #category : #'as yet unclassified' }
NWAcceptCard1234 >> cardNumber [
		^ cardNumber
]

{ #category : #'as yet unclassified' }
NWAcceptCard1234 >> cardNumber: anObject [
		cardNumber := anObject
]

{ #category : #'as yet unclassified' }
NWAcceptCard1234 >> cvv [
		^ cvv
]

{ #category : #'as yet unclassified' }
NWAcceptCard1234 >> cvv: anObject [
		cvv := anObject
]

{ #category : #'as yet unclassified' }
NWAcceptCard1234 >> descriptionAmount [
  <magritteDescription>
	^ MANumberDescription new 
		accessor: #amount;
		label: 'amount';
		priority: 10;
		visible: true;
		yourself
]

{ #category : #'as yet unclassified' }
NWAcceptCard1234 >> descriptionCardNumber [
  <magritteDescription>
	^ MAStringDescription new 
		accessor: #cardNumber;
		label: 'cardNumber';
		priority: 10;
		visible: true;
		yourself
]

{ #category : #'as yet unclassified' }
NWAcceptCard1234 >> descriptionCvv [
  <magritteDescription>
	^ MAStringDescription new 
		accessor: #cvv;
		label: 'cvv';
		priority: 10;
		visible: true;
		yourself
]

{ #category : #'as yet unclassified' }
NWAcceptCard1234 >> descriptionId [
  <magritteDescription>
	^ MAStringDescription new 
		accessor: #id;
		label: 'id';
		priority: 10;
		visible: false;
		yourself
]

{ #category : #'as yet unclassified' }
NWAcceptCard1234 >> descriptionName [
  <magritteDescription>
	^ MAStringDescription new 
		accessor: #name;
		label: 'name';
		priority: 10;
		visible: true;
		yourself
]

{ #category : #'as yet unclassified' }
NWAcceptCard1234 >> id [
		^ id
]

{ #category : #'as yet unclassified' }
NWAcceptCard1234 >> id: anObject [
		id := anObject
]

{ #category : #'as yet unclassified' }
NWAcceptCard1234 >> name [
		^ name
]

{ #category : #'as yet unclassified' }
NWAcceptCard1234 >> name: anObject [
		name := anObject
]
