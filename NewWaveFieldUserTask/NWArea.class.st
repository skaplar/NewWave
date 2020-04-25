Class {
	#name : #NWArea,
	#superclass : #Object,
	#instVars : [
		'name',
		'zip'
	],
	#category : #'NewWaveFieldUserTask-Entities'
}

{ #category : #'as yet unclassified' }
NWArea class >> name: aName zip: aZip [
	^ self new
	name: aName;
	zip: aZip;
	yourself
]

{ #category : #accessing }
NWArea class >> neoJsonMapping: mapper [
	"For inheritance mapping to work, the schema/classname must be self,
	but the instance variables have to be enumerated manually per class"
	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(name zip) ] 
]

{ #category : #accessing }
NWArea >> name [
	^ name
]

{ #category : #accessing }
NWArea >> name: anObject [
	name := anObject
]

{ #category : #accessing }
NWArea >> zip [
	^ zip
]

{ #category : #accessing }
NWArea >> zip: anObject [
	zip := anObject
]
