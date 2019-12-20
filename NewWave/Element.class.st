Class {
	#name : #Element,
	#superclass : #Object,
	#instVars : [
		'description',
		'ctype',
		'id'
	],
	#category : #'NewWave-Core'
}

{ #category : #accessing }
Element class >> description: aDesc id: anId [
	^ self new
		description: aDesc;
		id: anId;
		yourself
]

{ #category : #accessing }
Element class >> neoJsonMapping: mapper [
	"For inheritance mapping to work, the schema/classname must be self,
	but the instance variables have to be enumerated manually per class"
	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(description ctype id) ] 
]

{ #category : #accessing }
Element >> ctype [
	^ ShouldBeImplemented
]

{ #category : #accessing }
Element >> description [
	^ description 
]

{ #category : #accessing }
Element >> description: anObject [
	description := anObject 
]

{ #category : #accessing }
Element >> id [ 
	^ id
]

{ #category : #accessing }
Element >> id: anId [
	id := anId
]
