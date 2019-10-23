Class {
	#name : #DataObject,
	#superclass : #Element,
	#traits : 'TItemAwareElementTrait',
	#classTraits : 'TItemAwareElementTrait classTrait',
	#instVars : [
		'itemDef'
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
