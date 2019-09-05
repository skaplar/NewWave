Class {
	#name : #FieldType,
	#superclass : #Element,
	#instVars : [
		'name'
	],
	#category : #'NewWave-Core'
}

{ #category : #'instance creation' }
FieldType class >> neoJsonMapping: mapper [
	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(name) ] 
]

{ #category : #'instance creation' }
FieldType class >> with: aName [
	name := aName
]

{ #category : #accessing }
FieldType >> name [
	^ name
]

{ #category : #accessing }
FieldType >> name: anObject [
	name := anObject
]
