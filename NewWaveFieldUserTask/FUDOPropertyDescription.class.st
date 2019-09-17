Class {
	#name : #FUDOPropertyDescription,
	#superclass : #Object,
	#instVars : [
		'varName',
		'varType',
		'varValue',
		'maDescription'
	],
	#category : #'NewWaveFieldUserTask-ObjectPreparator'
}

{ #category : #accessing }
FUDOPropertyDescription class >> neoJsonMapping: mapper [ 
	"For inheritance mapping to work, the schema/classname must be self,
	but the instance variables have to be enumerated manually per class"
	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(varName varType varValue maDescription) ] 
]

{ #category : #accessing }
FUDOPropertyDescription >> maDescription [
	^ maDescription
]

{ #category : #accessing }
FUDOPropertyDescription >> maDescription: anObject [
	maDescription := anObject
]

{ #category : #accessing }
FUDOPropertyDescription >> varName [
	^ varName
]

{ #category : #accessing }
FUDOPropertyDescription >> varName: anObject [
	varName := anObject
]

{ #category : #accessing }
FUDOPropertyDescription >> varType [
	^ varType
]

{ #category : #accessing }
FUDOPropertyDescription >> varType: anObject [
	varType := anObject
]

{ #category : #accessing }
FUDOPropertyDescription >> varValue [
	^ varValue
]

{ #category : #accessing }
FUDOPropertyDescription >> varValue: anObject [
	varValue := anObject
]
