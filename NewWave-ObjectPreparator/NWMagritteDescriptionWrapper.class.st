Class {
	#name : #NWMagritteDescriptionWrapper,
	#superclass : #Object,
	#instVars : [
		'descriptionName',
		'descriptionValue'
	],
	#category : #'NewWave-ObjectPreparator'
}

{ #category : #accessing }
NWMagritteDescriptionWrapper class >> neoJsonMapping: mapper [
	"For inheritance mapping to work, the schema/classname must be self,
	but the instance variables have to be enumerated manually per class"

	mapper
		for: self
		do:
			[ :mapping | mapping mapInstVars: #(descriptionName descriptionValue) ]
]

{ #category : #accessing }
NWMagritteDescriptionWrapper >> descriptionName [
	^ descriptionName
]

{ #category : #accessing }
NWMagritteDescriptionWrapper >> descriptionName: anObject [
	descriptionName := anObject
]

{ #category : #accessing }
NWMagritteDescriptionWrapper >> descriptionValue [
	^ descriptionValue
]

{ #category : #accessing }
NWMagritteDescriptionWrapper >> descriptionValue: anObject [
	descriptionValue := anObject
]
