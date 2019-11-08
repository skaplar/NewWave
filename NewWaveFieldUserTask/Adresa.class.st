Class {
	#name : #Adresa,
	#superclass : #Object,
	#instVars : [
		'ulica',
		'broj'
	],
	#category : #'NewWaveFieldUserTask-Entities'
}

{ #category : #examples }
Adresa class >> example1 [ 
| addr |
addr := self new.
addr broj: 'Test Street'.
addr ulica: 'Test Place'.
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
	^ MAStringDescription new 
		accessor: #broj;
		label: 'broj';
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
