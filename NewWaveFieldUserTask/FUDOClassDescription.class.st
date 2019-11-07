Class {
	#name : #FUDOClassDescription,
	#superclass : #Object,
	#instVars : [
		'className',
		'properties'
	],
	#category : #'NewWaveFieldUserTask-ObjectPreparator'
}

{ #category : #adding }
FUDOClassDescription >> addAllToProps: aColl [ 
	properties addAll: aColl
]

{ #category : #accessing }
FUDOClassDescription >> className1 [
	^ className
]

{ #category : #accessing }
FUDOClassDescription >> className: anObject [
	className := anObject
]

{ #category : #initialization }
FUDOClassDescription >> initialize [ 
	
	super initialize.
	properties := OrderedCollection new.
]

{ #category : #accessing }
FUDOClassDescription >> neoJsonMapping: mapper [
	"For inheritance mapping to work, the schema/classname must be self,
	but the instance variables have to be enumerated manually per class"
	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(className properties) ] 
]

{ #category : #accessing }
FUDOClassDescription >> properties [
	^ properties
]

{ #category : #accessing }
FUDOClassDescription >> properties: anObject [
	properties := anObject
]
