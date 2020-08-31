"
I am a FieldType class used for composing forms when not using objects and reflection.
I am a base element. 

    Instance Variables
	name:		<Object>


    Implementation Points
"
Class {
	#name : #NWFieldType,
	#superclass : #NWElement,
	#instVars : [
		'name'
	],
	#category : #'NewWave-Core'
}

{ #category : #'instance creation' }
NWFieldType class >> neoJsonMapping: mapper [
	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(name) ] 
]

{ #category : #'instance creation' }
NWFieldType class >> with: aName [
	name := aName
]

{ #category : #accessing }
NWFieldType >> name [
	^ name
]

{ #category : #accessing }
NWFieldType >> name: anObject [
	name := anObject
]
