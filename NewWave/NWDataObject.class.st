"
I am a data object in the workflow. I can hold any Pharo object as a value to pass to the engine. I can also have a name.

    Instance Variables
	itemDef:		<Object>
	itemDefinition:		<Object>
	name:		<Object>
	valuedDataObject:		<Object>


    Implementation Points
"
Class {
	#name : #NWDataObject,
	#superclass : #NWElement,
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
NWDataObject >> initialize [ 
	super initialize.
	self initializeTrait.
	itemDef := NWItemDefinition new.
	
]

{ #category : #initialization }
NWDataObject >> initializeTrait [
	itemDefinition := NWItemDefinition new.
]

{ #category : #accessing }
NWDataObject >> itemDef [
	^ itemDef
]

{ #category : #accessing }
NWDataObject >> itemDef: anObject [
	itemDef := anObject
]

{ #category : #accessing }
NWDataObject >> name [
	^ name
]

{ #category : #accessing }
NWDataObject >> name: anObject [
	name := anObject
]

{ #category : #accessing }
NWDataObject >> valuedDataObject [
	^ valuedDataObject
]

{ #category : #accessing }
NWDataObject >> valuedDataObject: anObject [
	valuedDataObject := anObject
]
