Class {
	#name : #DataObject,
	#superclass : #Element,
	#traits : 'TItemAwareElementTrait',
	#classTraits : 'TItemAwareElementTrait classTrait',
	#instVars : [
		'itemDef',
		'valuedDataObject',
		'name'
	],
	#category : #'NewWave-Core'
}

{ #category : #initialization }
DataObject >> initialize [ 
	super initialize.
	self initializeTrait.
	itemDef := ItemDefinition new.
	
]

{ #category : #accessing }
DataObject >> itemDef [
	^ itemDef
]

{ #category : #accessing }
DataObject >> itemDef: anObject [
	itemDef := anObject
]

{ #category : #accessing }
DataObject >> name [
	^ name
]

{ #category : #accessing }
DataObject >> name: anObject [
	name := anObject
]

{ #category : #accessing }
DataObject >> valuedDataObject [
	^ valuedDataObject
]

{ #category : #accessing }
DataObject >> valuedDataObject: anObject [
	valuedDataObject := anObject
]
