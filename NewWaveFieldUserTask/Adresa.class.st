Class {
	#name : #Adresa,
	#superclass : #Object,
	#instVars : [
		'ulica',
		'broj'
	],
	#category : #'NewWaveFieldUserTask-Entities'
}

{ #category : #'as yet unclassified' }
Adresa >> addMethod [
Transcript show: 'Hi, Nina!'
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
	super initialize.
]

{ #category : #accessing }
Adresa >> ulica [
	^ ulica
]

{ #category : #accessing }
Adresa >> ulica: anObject [
	ulica := anObject
]
