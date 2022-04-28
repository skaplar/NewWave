"
I am value that corresponds to FormProperty.
"
Class {
	#name : #NWFormValue,
	#superclass : #NWElement,
	#instVars : [
		'name'
	],
	#category : #NewWaveFieldUserTask
}

{ #category : #'as yet unclassified' }
NWFormValue class >> id: anId name: aName [
	^ self new 
	id: anId;
	name: aName;
	yourself
]

{ #category : #'as yet unclassified' }
NWFormValue class >> neoJsonMapping: mapper [
	"For inheritance mapping to work, the schema/classname must be self,
	but the instance variables have to be enumerated manually per class"
	
	super neoJsonMapping: mapper.
	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(name) ] 
]

{ #category : #accessing }
NWFormValue >> name [
	^ name
]

{ #category : #accessing }
NWFormValue >> name: aName [
	name := aName
]
