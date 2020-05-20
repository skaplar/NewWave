Class {
	#name : #NWJobOpening1234,
	#superclass : #Object,
	#instVars : [
		'id',
		'taskName',
		'openingDescription',
		'degree'
	],
	#category : #'NewWaveFieldUserTask-Entities'
}

{ #category : #'as yet unclassified' }
NWJobOpening1234 >> degree [
		^ degree
]

{ #category : #'as yet unclassified' }
NWJobOpening1234 >> degree: anObject [
		degree := anObject
]

{ #category : #'as yet unclassified' }
NWJobOpening1234 >> descriptionDegree [
	<magritteDescription>
	
	^ MASingleOptionDescription new
		options: #('Elementary' 'High School' 'University');
		reference: MAStringDescription new;
		accessor: #degree;
		label: 'Degree';
		priority: 40;
		yourself
]

{ #category : #'as yet unclassified' }
NWJobOpening1234 >> descriptionId [
  <magritteDescription>
	^ MAStringDescription new 
		accessor: #id;
		label: 'id';
		priority: 10;
		visible: false;
		yourself
]

{ #category : #'as yet unclassified' }
NWJobOpening1234 >> descriptionOpeningDescription [
  <magritteDescription>
	^ MAStringDescription new 
		accessor: #openingDescription;
		label: 'openingDescription';
		priority: 10;
		visible: true;
		yourself
]

{ #category : #'as yet unclassified' }
NWJobOpening1234 >> descriptionTaskName [
  <magritteDescription>
	^ MAStringDescription new 
		accessor: #taskName;
		label: 'taskName';
		priority: 10;
		visible: true;
		yourself
]

{ #category : #'as yet unclassified' }
NWJobOpening1234 >> id [
		^ id
]

{ #category : #'as yet unclassified' }
NWJobOpening1234 >> id: anObject [
		id := anObject
]

{ #category : #'as yet unclassified' }
NWJobOpening1234 >> openingDescription [
		^ openingDescription
]

{ #category : #'as yet unclassified' }
NWJobOpening1234 >> openingDescription: anObject [
		openingDescription := anObject
]

{ #category : #'as yet unclassified' }
NWJobOpening1234 >> taskName [
		^ taskName
]

{ #category : #'as yet unclassified' }
NWJobOpening1234 >> taskName: anObject [
		taskName := anObject
]
