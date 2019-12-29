"
I am a class that should be used for mapping classes.
I contain class description, and all properties of the class that should be mapped.

    Instance Variables
	className:		<String>Name of the class to be mapped
	properties:		<NewWaveDOPropertyDescription> description properties
"
Class {
	#name : #NewWaveDOClassDescription,
	#superclass : #Object,
	#instVars : [
		'className',
		'properties',
		'taskName',
		'taskDescription',
		'processName',
		'processId'
	],
	#category : #'NewWave-ObjectPreparator'
}

{ #category : #accessing }
NewWaveDOClassDescription class >> neoJsonMapping: mapper [
	"For inheritance mapping to work, the schema/classname must be self,
	but the instance variables have to be enumerated manually per class"
	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(className properties taskName taskDescription) ] 
]

{ #category : #accessing }
NewWaveDOClassDescription >> addAllToProps: aColl [
	properties addAll: aColl
]

{ #category : #accessing }
NewWaveDOClassDescription >> className1 [
	^ className
]

{ #category : #accessing }
NewWaveDOClassDescription >> className: anObject [
	className := anObject
]

{ #category : #initialization }
NewWaveDOClassDescription >> initialize [ 
	
	super initialize.
	properties := OrderedCollection new.
]

{ #category : #accessing }
NewWaveDOClassDescription >> processId [
	^ processId
]

{ #category : #accessing }
NewWaveDOClassDescription >> processId: anObject [
	processId := anObject
]

{ #category : #accessing }
NewWaveDOClassDescription >> processName [
	^ processName
]

{ #category : #accessing }
NewWaveDOClassDescription >> processName: anObject [
	processName := anObject
]

{ #category : #accessing }
NewWaveDOClassDescription >> properties [
	^ properties
]

{ #category : #accessing }
NewWaveDOClassDescription >> properties: anObject [
	properties := anObject
]

{ #category : #accessing }
NewWaveDOClassDescription >> taskDescription [
	^ taskDescription
]

{ #category : #accessing }
NewWaveDOClassDescription >> taskDescription: anObject [
	taskDescription := anObject
]

{ #category : #accessing }
NewWaveDOClassDescription >> taskName [
	^ taskName
]

{ #category : #accessing }
NewWaveDOClassDescription >> taskName: anObject [
	taskName := anObject
]
