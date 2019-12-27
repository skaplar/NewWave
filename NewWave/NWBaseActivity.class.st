"
I am the base activity, mostly used for subclassing. However I can contain elements, data associations and boundary events.

    Instance Variables
	boundaryEvents:		<Object>
	dataOutputAssociations:		<Object>
	elements:		<Object>


    Implementation Points
"
Class {
	#name : #NWBaseActivity,
	#superclass : #NWNode,
	#instVars : [
		'elements',
		'boundaryEvents',
		'dataOutputAssociations',
		'name'
	],
	#category : #'NewWave-Core'
}

{ #category : #initialization }
NWBaseActivity >> addBoundaryEvent: aBoundaryEvent [
	boundaryEvents add: aBoundaryEvent 
]

{ #category : #accessing }
NWBaseActivity >> addDataOutputAssociation: dataObject [
	"In order to connect the task with the data object, data association should be created. This metod 	receives dataObject, which is used to create the DataAssociation. sourceRef is task to which the 	dataObject belongs."
	
	"| dataAssociation |
	dataAssociation := DataAssociation sourceRef: self targetRef: dataObject.
	dataOutputAssociations add: dataAssociation."
	dataOutputAssociations add: dataObject.
	
]

{ #category : #initialization }
NWBaseActivity >> addElement: anElement [
	elements add: anElement
]

{ #category : #initialization }
NWBaseActivity >> basetype [
	^ #Activity
]

{ #category : #initialization }
NWBaseActivity >> boundaryEvents [
	^ boundaryEvents 
]

{ #category : #initialization }
NWBaseActivity >> ctype [
	^ #NWBaseActivity
]

{ #category : #accessing }
NWBaseActivity >> dataOutputAssociations [
	^ dataOutputAssociations
]

{ #category : #accessing }
NWBaseActivity >> elements [
	^ elements
]

{ #category : #accessing }
NWBaseActivity >> findDataObject: anElement [
	| dataObject |
	dataObject := dataOutputAssociations detect: [ :each | each itemDef structureRef id = anElement id ].
	^ dataObject.
]

{ #category : #initialization }
NWBaseActivity >> initialize [

	super initialize.
	elements := OrderedCollection new.
	boundaryEvents := OrderedCollection new.
	dataOutputAssociations := OrderedCollection new.
]

{ #category : #accessing }
NWBaseActivity >> name [
	^ name
]

{ #category : #accessing }
NWBaseActivity >> name: anObject [
	name := anObject
]

{ #category : #accessing }
NWBaseActivity >> nextDataObject [
	"Here I want to get all the dataObjects that are not in the elements Collection.
	targetRef is the DataObject. each is a DataAssociation"
	| assoc |
	"assoc := dataOutputAssociations detect: [ :each | (elements includes: each targetRef) not ifTrue: [ ^ each targetRef itemDef structureRef  ] ifFalse: [ ^ nil ]]."
	assoc := dataOutputAssociations detect: [ :each | (elements includes: each) not ].
	^ assoc itemDef structureRef.
]
