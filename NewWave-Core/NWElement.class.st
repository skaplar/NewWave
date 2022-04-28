"
I am the core element of the NewWave elements. All others derive from me. 
Every element has an id, description and a type.

Instance Variables
	ctype:		Symbol - Type of an element
	description:		String - Element description
	id:		String - Element id.
"
Class {
	#name : #NWElement,
	#superclass : #Object,
	#instVars : [
		'description',
		'id'
	],
	#category : #'NewWave-Core-Core'
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
		mapping mapInstVars: #(description id) ] 
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
