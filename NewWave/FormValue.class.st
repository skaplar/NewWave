Class {
	#name : #FormValue,
	#superclass : #Element,
	#instVars : [
		'name'
	],
	#category : #'NewWave-Core'
}

{ #category : #'as yet unclassified' }
FormValue class >> id: anId name: aName [
	^ self new 
	id: anId;
	name: aName;
	yourself
]

{ #category : #accessing }
FormValue >> name [
	^ name
]

{ #category : #accessing }
FormValue >> name: aName [
	name := aName
]
