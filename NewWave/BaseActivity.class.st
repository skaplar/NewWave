"
I am the base activity, mostly used for subclassing. However I can contain elements, data associations and boundary events.

    Instance Variables
	boundaryEvents:		<Object>
	dataOutputAssociations:		<Object>
	elements:		<Object>


    Implementation Points
"
Class {
	#name : #BaseActivity,
	#superclass : #Node,
	#instVars : [
		'elements',
		'boundaryEvents',
		'dataOutputAssociations'
	],
	#category : #'NewWave-Core'
}

{ #category : #initialization }
BaseActivity >> addBoundaryEvent: aBoundaryEvent [
	boundaryEvents add: aBoundaryEvent 
]

{ #category : #accessing }
BaseActivity >> addDataOutputAssociation: dataObject [
	"In order to connect the task with the data object, data association should be created. This metod 	receives dataObject, which is used to create the DataAssociation. sourceRef is task to which the 	dataObject belongs."
			
	| dataAssociation |
	dataAssociation := DataAssociation sourceRef: self targetRef: dataObject.
	dataOutputAssociations add: dataAssociation. 
	
]

{ #category : #initialization }
BaseActivity >> addElement: anElement [
	elements add: anElement
]

{ #category : #initialization }
BaseActivity >> basetype [
	^ #Activity
]

{ #category : #initialization }
BaseActivity >> boundaryEvents [
	^ boundaryEvents 
]

{ #category : #initialization }
BaseActivity >> ctype [
	^ #BaseActivity
]

{ #category : #accessing }
BaseActivity >> dataOutputAssociations [
	^ dataOutputAssociations
]

{ #category : #initialization }
BaseActivity >> initialize [

	super initialize.
	elements := OrderedCollection new.
	boundaryEvents := OrderedCollection new.
	dataOutputAssociations := OrderedCollection new.
]
