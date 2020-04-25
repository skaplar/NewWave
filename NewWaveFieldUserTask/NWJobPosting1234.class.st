Class {
	#name : #NWJobPosting1234,
	#superclass : #Object,
	#instVars : [
		'id',
		'description',
		'qualifications',
		'reviewed'
	],
	#category : #'NewWaveFieldUserTask-Entities'
}

{ #category : #'as yet unclassified' }
NWJobPosting1234 >> description [
		^ description
]

{ #category : #'as yet unclassified' }
NWJobPosting1234 >> description: anObject [
		description := anObject
]

{ #category : #'as yet unclassified' }
NWJobPosting1234 >> descriptionDescription [
  <magritteDescription>
	^ MAStringDescription new 
		accessor: #description;
		label: 'description';
		priority: 10;
		visible: true;
		yourself
]

{ #category : #'as yet unclassified' }
NWJobPosting1234 >> descriptionId [
  <magritteDescription>
	^ MAStringDescription new 
		accessor: #id;
		label: 'id';
		priority: 10;
		visible: false;
		yourself
]

{ #category : #'as yet unclassified' }
NWJobPosting1234 >> descriptionQualifications [
  <magritteDescription>
	^ MAStringDescription new 
		accessor: #qualifications;
		label: 'qualifications';
		priority: 10;
		visible: true;
		yourself
]

{ #category : #'as yet unclassified' }
NWJobPosting1234 >> descriptionReviewed [
  <magritteDescription>
	^ MABooleanDescription new 
		accessor: #reviewed;
		label: 'reviewed';
		priority: 10;
		visible: true;
		yourself
]

{ #category : #'as yet unclassified' }
NWJobPosting1234 >> id [
		^ id
]

{ #category : #'as yet unclassified' }
NWJobPosting1234 >> id: anObject [
		id := anObject
]

{ #category : #'as yet unclassified' }
NWJobPosting1234 >> qualifications [
		^ qualifications
]

{ #category : #'as yet unclassified' }
NWJobPosting1234 >> qualifications: anObject [
		qualifications := anObject
]

{ #category : #'as yet unclassified' }
NWJobPosting1234 >> reviewed [
		^ reviewed
]

{ #category : #'as yet unclassified' }
NWJobPosting1234 >> reviewed: anObject [
		reviewed := anObject
]
