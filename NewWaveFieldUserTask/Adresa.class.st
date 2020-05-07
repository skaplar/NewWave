Class {
	#name : #Adresa,
	#superclass : #Object,
	#instVars : [
		'ulica',
		'broj',
		'id',
		'area',
		'grad'
	],
	#category : #'NewWaveFieldUserTask-Entities'
}

{ #category : #examples }
Adresa class >> example1 [ 
| addr |
addr := self new.
addr id: '1'.
addr broj: 0.
addr ulica: ''.
addr area: (NWArea name: 'Novi Sad' zip: '21000'). 
^ addr.
]

{ #category : #examples }
Adresa class >> example2 [
| addr |
addr := self new.
addr id: '2'.
addr broj: 'Osamdeset'.
addr ulica: 'Galac'.
addr area: (NWArea name: 'Novi Sad' zip: '21000'). 
^ addr.
]

{ #category : #examples }
Adresa class >> example3 [
	| addr |
	addr := self new.
	addr id: '2'.
	addr broj: 80.
	addr ulica: 'Bul. Cara Lazara'.
	addr area: (NWArea name: 'Novi Sad' zip: '21000'). 
	addr grad: 'Novi Sad'.
	^ addr.
]

{ #category : #accessing }
Adresa >> area [
	^ area
]

{ #category : #accessing }
Adresa >> area: anObject [
	area := anObject
]

{ #category : #accessing }
Adresa >> broj [
	^ broj
]

{ #category : #accessing }
Adresa >> broj: anObject [
	broj := anObject
]

{ #category : #'as yet unclassified' }
Adresa >> descriptionBroj [
  <magritteDescription>
	^ MAStringDescription new 
		accessor: #broj;
		label: 'broj';
		priority: 10;
		visible: true;
		yourself
]

{ #category : #'as yet unclassified' }
Adresa >> descriptionGrad [
	<magritteDescription>
	
	^ MASingleOptionDescription new
		options: #('Novi Sad' 'Beograd' 'Sombor');
		reference: MAStringDescription new;
		accessor: #grad;
		label: 'Grad';
		priority: 40;
		yourself
]

{ #category : #'as yet unclassified' }
Adresa >> descriptionId [
  <magritteDescription>
	^ MAStringDescription new 
		accessor: #id;
		label: 'id';
		priority: 10;
		visible: false;
		yourself
]

{ #category : #'as yet unclassified' }
Adresa >> descriptionUlica [
  <magritteDescription>
	^ MAStringDescription new 
		accessor: #ulica;
		label: 'ulica';
		priority: 10;
		visible: true;
		yourself
]

{ #category : #accessing }
Adresa >> grad [
	^ grad
]

{ #category : #accessing }
Adresa >> grad: anObject [
	grad := anObject
]

{ #category : #accessing }
Adresa >> id [
	^ id
]

{ #category : #accessing }
Adresa >> id: anObject [
	id := anObject
]

{ #category : #initialization }
Adresa >> initialize [
	super initialize 
]

{ #category : #accessing }
Adresa >> ulica [
	^ ulica
]

{ #category : #accessing }
Adresa >> ulica: anObject [
	ulica := anObject
]
