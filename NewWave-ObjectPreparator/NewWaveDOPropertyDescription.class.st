"
I am a class that is used for mapping properties. I represent one property.

    Instance Variables
	maDescription:		<Object>
	varName:		<Object>
	varType:		<Object>
	varValue:		<Object>


    Implementation Points
"
Class {
	#name : #NewWaveDOPropertyDescription,
	#superclass : #Object,
	#instVars : [
		'varName',
		'varType',
		'varValue',
		'maDescription'
	],
	#category : #'NewWave-ObjectPreparator'
}

{ #category : #accessing }
NewWaveDOPropertyDescription class >> neoJsonMapping: mapper [
	"For inheritance mapping to work, the schema/classname must be self,
	but the instance variables have to be enumerated manually per class"
	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(varName varType varValue maDescription) ] 
]

{ #category : #accessing }
NewWaveDOPropertyDescription >> maDescription [
	^ maDescription
]

{ #category : #accessing }
NewWaveDOPropertyDescription >> maDescription: anObject [
	maDescription := anObject
]

{ #category : #accessing }
NewWaveDOPropertyDescription >> varName [
	^ varName
]

{ #category : #accessing }
NewWaveDOPropertyDescription >> varName: anObject [
	varName := anObject
]

{ #category : #accessing }
NewWaveDOPropertyDescription >> varType [
	^ varType
]

{ #category : #accessing }
NewWaveDOPropertyDescription >> varType: anObject [
	varType := anObject
]

{ #category : #accessing }
NewWaveDOPropertyDescription >> varValue [
	^ varValue
]

{ #category : #accessing }
NewWaveDOPropertyDescription >> varValue: anObject [
	varValue := anObject
]
