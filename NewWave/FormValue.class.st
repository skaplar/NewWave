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

{ #category : #'as yet unclassified' }
FormValue class >> neoJsonMapping: mapper [
	"For inheritance mapping to work, the schema/classname must be self,
	but the instance variables have to be enumerated manually per class"
	
	super neoJsonMapping: mapper.
	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(name) ] 
]

{ #category : #accessing }
FormValue >> name [
	^ name
]

{ #category : #accessing }
FormValue >> name: aName [
	name := aName
]
