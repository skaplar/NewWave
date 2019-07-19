Class {
	#name : #VisibleElement,
	#superclass : #Object,
	#instVars : [
		'label',
		'component',
		'visible'
	],
	#category : #'NewWave-ClassModel'
}

{ #category : #accessing }
VisibleElement class >> neoJsonMapping: mapper [
	"For inheritance mapping to work, the schema/classname must be self,
	but the instance variables have to be enumerated manually per class"
	
	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(label component visible) ] 
]

{ #category : #accessing }
VisibleElement >> component [
	^ component
]

{ #category : #accessing }
VisibleElement >> component: anObject [
	component := anObject
]

{ #category : #accessing }
VisibleElement >> label [
	^ label
]

{ #category : #accessing }
VisibleElement >> label: anObject [
	label := anObject
]

{ #category : #accessing }
VisibleElement >> visible [
	^ visible
]

{ #category : #accessing }
VisibleElement >> visible: anObject [
	visible := anObject
]
