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
	#name : #NWFieldUserTask,
	#superclass : #NWBaseActivity,
	#instVars : [
		'value',
		'announcer',
		'result',
		'formProperties'
	],
	#category : #'NewWave-Core-Core'
}

{ #category : #accessing }
NWFieldUserTask class >> neoJsonMapping: mapper [
	"For inheritance mapping to work, the schema/classname must be self,
	but the instance variables have to be enumerated manually per class"
	
	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(name formProperties) ] 
]

{ #category : #initialization }
NWFieldUserTask >> addProperty: aProperty [
	formProperties add: aProperty
]

{ #category : #initialization }
NWFieldUserTask >> announcer [
	^ announcer
]

{ #category : #initialization }
NWFieldUserTask >> complete [
	announcer announce: (WaveAnnouncer with: self result).
	
]

{ #category : #initialization }
NWFieldUserTask >> ctype [
	^ #NWFieldUserTask
]

{ #category : #initialization }
NWFieldUserTask >> formProperties [
	^ formProperties
]

{ #category : #initialization }
NWFieldUserTask >> initialize [
	super initialize.
	announcer := Announcer new.
	formProperties := OrderedCollection new.
]

{ #category : #initialization }
NWFieldUserTask >> result [
	^ result
]

{ #category : #initialization }
NWFieldUserTask >> result: aResult [
	result := aResult
]

{ #category : #initialization }
NWFieldUserTask >> value [
	^ value
]

{ #category : #initialization }
NWFieldUserTask >> value: aValue [
	value := aValue
]
