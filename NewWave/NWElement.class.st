Class {
	#name : #NWElement,
	#superclass : #Object,
	#instVars : [
		'description',
		'ctype',
		'id'
	],
	#category : #'NewWave-Core'
}

{ #category : #accessing }
NWElement class >> description: aDesc id: anId [
	^ self new
		description: aDesc;
		id: anId;
		yourself
]

{ #category : #accessing }
NWElement class >> neoJsonMapping: mapper [
	"For inheritance mapping to work, the schema/classname must be self,
	but the instance variables have to be enumerated manually per class"
	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(description ctype id) ] 
]

{ #category : #accessing }
NWElement >> ctype [
	^ ShouldBeImplemented
]

{ #category : #accessing }
NWElement >> description [
	^ description 
]

{ #category : #accessing }
NWElement >> description: anObject [
	description := anObject 
]

{ #category : #accessing }
NWElement >> id [ 
	^ id
]

{ #category : #accessing }
NWElement >> id: anId [
	id := anId
]
