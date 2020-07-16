Class {
	#name : #NWPaymentMethod1234,
	#superclass : #Object,
	#instVars : [
		'id',
		'paymentMethod'
	],
	#category : #'NewWaveFieldUserTask-Entities'
}

{ #category : #'as yet unclassified' }
NWPaymentMethod1234 >> descriptionId [
  <magritteDescription>
	^ MANumberDescription new 
		accessor: #id;
		label: 'id';
		priority: 10;
		visible: false;
		yourself
]

{ #category : #'as yet unclassified' }
NWPaymentMethod1234 >> descriptionPaymentMethod [
	<magritteDescription>
	
	^ MASingleOptionDescription new
		options: #('Cash' 'Card');
		reference: MAStringDescription new;
		accessor: #paymentMethod;
		label: 'Payment method';
		priority: 40;
		yourself
]

{ #category : #'as yet unclassified' }
NWPaymentMethod1234 >> id [
		^ id
]

{ #category : #'as yet unclassified' }
NWPaymentMethod1234 >> id: anObject [
		id := anObject
]

{ #category : #'as yet unclassified' }
NWPaymentMethod1234 >> paymentMethod [
		^ paymentMethod
]

{ #category : #'as yet unclassified' }
NWPaymentMethod1234 >> paymentMethod: anObject [
		paymentMethod := anObject
]
