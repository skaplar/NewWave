Class {
	#name : #StandardPanel,
	#superclass : #VisibleClass,
	#instVars : [
		'persistentClass'
	],
	#category : #'NewWave-ClassModel'
}

{ #category : #'as yet unclassified' }
StandardPanel class >> neoJsonMapping: mapper [
	"For inheritance mapping to work, the schema/classname must be self,
	but the instance variables have to be enumerated manually per class"
	
	super neoJsonMapping: mapper.
	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(persistentClass) ] 
]

{ #category : #'as yet unclassified' }
StandardPanel class >> persistentClass: aPersistentClass visibleClassName: aVisibleClassName modal: aModal [
	^ self new
		persistentClass: aPersistentClass;
		visibleClassName: aVisibleClassName;
		modal: aModal;
		yourself
]

{ #category : #accessing }
StandardPanel >> persistentClass [
	^ persistentClass
]

{ #category : #accessing }
StandardPanel >> persistentClass: anObject [
	persistentClass := anObject
]
