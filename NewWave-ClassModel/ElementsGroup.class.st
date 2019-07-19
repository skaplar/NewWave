Class {
	#name : #ElementsGroup,
	#superclass : #VisibleElement,
	#instVars : [
		'superElement',
		'subElements',
		'visibleElements'
	],
	#category : #'NewWave-ClassModel'
}

{ #category : #initialization }
ElementsGroup >> addSubElement: subElement [
 subElements add: subElement
]

{ #category : #initialization }
ElementsGroup >> addVisibleElement: visibleElement [

 visibleElements add: visibleElement
]

{ #category : #initialization }
ElementsGroup >> initialize [ 

	super initialize.
	subElements := OrderedCollection new.
	visibleElements := OrderedCollection new.
]
