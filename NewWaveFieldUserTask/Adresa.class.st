Class {
	#name : #Adresa,
	#superclass : #Object,
	#instVars : [
		'ulica',
		'broj'
	],
	#category : #'NewWaveFieldUserTask-Entities'
}

{ #category : #accessing }
Adresa >> broj [
	^ broj
]

{ #category : #accessing }
Adresa >> broj: anObject [
	broj := anObject
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
