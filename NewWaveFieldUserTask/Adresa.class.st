Class {
	#name : #Adresa,
	#superclass : #Object,
	#instVars : [
		'ulica',
		'broj',
		'id'
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
^ addr.
]

{ #category : #examples }
Adresa class >> example2 [
| addr |
addr := self new.
addr id: '2'.
addr broj: 'Osamdeset'.
addr ulica: 'Galac'.
^ addr.
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
	^ MANumberDescription new 
		accessor: #broj;
		label: 'broj';
		priority: 10;
		yourself
]

{ #category : #'as yet unclassified' }
Adresa >> descriptionId [
  <magritteDescription>
	^ MAStringDescription new 
		accessor: #id;
		label: 'id';
		priority: 10;
		yourself
]

{ #category : #'as yet unclassified' }
Adresa >> descriptionUlica [
  <magritteDescription>
	^ MAStringDescription new 
		accessor: #ulica;
		label: 'ulica';
		priority: 10;
		yourself
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
