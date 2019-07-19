Class {
	#name : #VisibleClass,
	#superclass : #VisibleElement,
	#instVars : [
		'visibleClassName',
		'modal',
		'visibleElements'
	],
	#category : #'NewWave-ClassModel'
}

{ #category : #accessing }
VisibleClass class >> neoJsonMapping: mapper [
	"For inheritance mapping to work, the schema/classname must be self,
	but the instance variables have to be enumerated manually per class"
	
	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(visibleClassName modal visibleElements) ] 
]

{ #category : #initialization }
VisibleClass >> addVisibleElement: visibleElement [

 visibleElements add: visibleElement
]

{ #category : #initialization }
VisibleClass >> initialize [

	super initialize.
	visibleElements := OrderedCollection new.
]

{ #category : #accessing }
VisibleClass >> modal [
	^ modal
]

{ #category : #accessing }
VisibleClass >> modal: anObject [
	modal := anObject
]

{ #category : #accessing }
VisibleClass >> visibleClassName [
	^ visibleClassName
]

{ #category : #accessing }
VisibleClass >> visibleClassName: anObject [
	visibleClassName := anObject
]

{ #category : #accessing }
VisibleClass >> visibleElements [
	^ visibleElements
]

{ #category : #accessing }
VisibleClass >> visibleElements: anObject [
	visibleElements := anObject
]
