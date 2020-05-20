Class {
	#name : #Adresa1234,
	#superclass : #Object,
	#instVars : [
		'ulica',
		'broj',
		'id',
		'grad',
		'nwarea'
	],
	#category : #'NewWaveFieldUserTask-Entities'
}

{ #category : #'as yet unclassified' }
Adresa1234 >> broj [
		^ broj
]

{ #category : #'as yet unclassified' }
Adresa1234 >> broj: anObject [
		broj := anObject
]

{ #category : #'as yet unclassified' }
Adresa1234 >> descriptionBroj [
  <magritteDescription>
	^ MAStringDescription new 
		accessor: #broj;
		label: 'broj';
		priority: 10;
		visible: true;
		yourself
]

{ #category : #'as yet unclassified' }
Adresa1234 >> descriptionGrad [
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
Adresa1234 >> descriptionId [
  <magritteDescription>
	^ MAStringDescription new 
		accessor: #id;
		label: 'id';
		priority: 10;
		visible: false;
		yourself
]

{ #category : #'as yet unclassified' }
Adresa1234 >> descriptionNWArea [
  <magritteDescription>
	^ MAToOneRelationDescription new 
		accessor: #nwarea;
		classes: (Array with: NWArea1234);
		label: 'NWArea';
		priority: 40;
		yourself
]

{ #category : #'as yet unclassified' }
Adresa1234 >> descriptionUlica [
  <magritteDescription>
	^ MAStringDescription new 
		accessor: #ulica;
		label: 'ulica';
		priority: 10;
		visible: true;
		yourself
]

{ #category : #'as yet unclassified' }
Adresa1234 >> grad [
		^ grad
]

{ #category : #'as yet unclassified' }
Adresa1234 >> grad: anObject [
		grad := anObject
]

{ #category : #'as yet unclassified' }
Adresa1234 >> id [
		^ id
]

{ #category : #'as yet unclassified' }
Adresa1234 >> id: anObject [
		id := anObject
]

{ #category : #'as yet unclassified' }
Adresa1234 >> nwarea [
		^ nwarea
]

{ #category : #'as yet unclassified' }
Adresa1234 >> nwarea: anObject [
		nwarea := anObject
]

{ #category : #'as yet unclassified' }
Adresa1234 >> ulica [
		^ ulica
]

{ #category : #'as yet unclassified' }
Adresa1234 >> ulica: anObject [
		ulica := anObject
]
