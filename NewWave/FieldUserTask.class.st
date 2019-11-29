"
I am a FieldUser task. I am composed using fields (FormProperty-ies). I have a list of properties and can be creatied using different types of form proprties. 

    Instance Variables
	announcer:		<Object>
	formProperties:		<Object>
	name:		<Object>
	result:		<Object>
	value:		<Object>


    Implementation Points
"
Class {
	#name : #FieldUserTask,
	#superclass : #BaseActivity,
	#instVars : [
		'value',
		'announcer',
		'result',
		'formProperties',
		'name'
	],
	#category : #'NewWave-Core'
}

{ #category : #accessing }
FieldUserTask class >> neoJsonMapping: mapper [
	"For inheritance mapping to work, the schema/classname must be self,
	but the instance variables have to be enumerated manually per class"
	
	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(name formProperties) ] 
]

{ #category : #initialization }
FieldUserTask >> addProperty: aProperty [
	formProperties add: aProperty
]

{ #category : #initialization }
FieldUserTask >> announcer [
	^ announcer
]

{ #category : #initialization }
FieldUserTask >> complete [
	announcer announce: (WaveAnnouncer with: self result).
	
]

{ #category : #initialization }
FieldUserTask >> ctype [
	^ #FieldUserTask
]

{ #category : #initialization }
FieldUserTask >> formProperties [
	^ formProperties
]

{ #category : #initialization }
FieldUserTask >> initialize [
	super initialize.
	announcer := Announcer new.
	formProperties := OrderedCollection new.
]

{ #category : #accessing }
FieldUserTask >> name [
	^ name
]

{ #category : #accessing }
FieldUserTask >> name: anObject [
	name := anObject
]

{ #category : #initialization }
FieldUserTask >> result [
	^ result
]

{ #category : #initialization }
FieldUserTask >> result: aResult [
	result := aResult
]

{ #category : #initialization }
FieldUserTask >> value [
	^ value
]

{ #category : #initialization }
FieldUserTask >> value: aValue [
	value := aValue
]
