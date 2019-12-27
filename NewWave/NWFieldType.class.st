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
