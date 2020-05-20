Class {
	#name : #NWJobOpening,
	#superclass : #Object,
	#instVars : [
		'id',
		'taskName',
		'openingDescription',
		'degree'
	],
	#category : #'NewWaveFieldUserTask-Entities'
}

{ #category : #examples }
NWJobOpening class >> example1 [ 

	| job |	
	job := self new.
	job id: '1'.
	job degree: 'Elementary'.
	job taskName: 'Cashier'.
	job openingDescription: 'Working at the cash register'.
	^ job.
]

{ #category : #accessing }
NWJobOpening >> degree [
	^ degree
]

{ #category : #accessing }
NWJobOpening >> degree: anObject [
	degree := anObject
]

{ #category : #'as yet unclassified' }
NWJobOpening >> descriptionDegree [
	<magritteDescription>
	
	^ MASingleOptionDescription new
		options: #('Elementary' 'High School' 'University');
		reference: MAStringDescription new;
		accessor: #degree;
		label: 'Degree';
		priority: 40;
		yourself
]

{ #category : #accessing }
NWJobOpening >> id [
	^ id
]

{ #category : #accessing }
NWJobOpening >> id: anObject [
	id := anObject
]

{ #category : #accessing }
NWJobOpening >> openingDescription [
	^ openingDescription
]

{ #category : #accessing }
NWJobOpening >> openingDescription: anObject [
	openingDescription := anObject
]

{ #category : #accessing }
NWJobOpening >> taskName [
	^ taskName
]

{ #category : #accessing }
NWJobOpening >> taskName: anObject [
	taskName := anObject
]
