Class {
	#name : #NWArea1234,
	#superclass : #Object,
	#instVars : [
		'name',
		'zip'
	],
	#category : #'NewWaveFieldUserTask-Entities'
}

{ #category : #'as yet unclassified' }
NWArea1234 >> descriptionName [
  <magritteDescription>
	^ MAStringDescription new 
		accessor: #name;
		label: 'name';
		priority: 10;
		visible: true;
		yourself
]

{ #category : #'as yet unclassified' }
NWArea1234 >> descriptionZip [
  <magritteDescription>
	^ MAStringDescription new 
		accessor: #zip;
		label: 'zip';
		priority: 10;
		visible: true;
		yourself
]

{ #category : #'as yet unclassified' }
NWArea1234 >> name [
		^ name
]

{ #category : #'as yet unclassified' }
NWArea1234 >> name: anObject [
		name := anObject
]

{ #category : #'as yet unclassified' }
NWArea1234 >> zip [
		^ zip
]

{ #category : #'as yet unclassified' }
NWArea1234 >> zip: anObject [
		zip := anObject
]
