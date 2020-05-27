Class {
	#name : #NWPaymentMethod,
	#superclass : #Object,
	#instVars : [
		'id',
		'paymentMethod'
	],
	#category : #'NewWaveFieldUserTask-Entities'
}

{ #category : #examples }
NWPaymentMethod class >> example1 [ 
	| tmp |
	tmp := self new.
	tmp id: 1.
	tmp paymentMethod: 'Cash'.
	^ tmp 
]

{ #category : #'as yet unclassified' }
NWPaymentMethod >> descriptionPaymentMethod [
	<magritteDescription>
	
	^ MASingleOptionDescription new
		options: #('Cash' 'Card');
		reference: MAStringDescription new;
		accessor: #paymentMethod;
		label: 'Payment method';
		priority: 40;
		yourself
]

{ #category : #accessing }
NWPaymentMethod >> id [
	^ id
]

{ #category : #accessing }
NWPaymentMethod >> id: anObject [
	id := anObject
]

{ #category : #accessing }
NWPaymentMethod >> paymentMethod [
	^ paymentMethod
]

{ #category : #accessing }
NWPaymentMethod >> paymentMethod: anObject [
	paymentMethod := anObject
]
