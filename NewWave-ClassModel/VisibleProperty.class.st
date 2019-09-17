Class {
	#name : #VisibleProperty,
	#superclass : #VisibleElement,
	#instVars : [
		'columnLabel',
		'displayFormat',
		'representative',
		'autoGo',
		'disabled',
		'default'
	],
	#category : #'NewWave-ClassModel'
}

{ #category : #'as yet unclassified' }
VisibleProperty class >> columnLabel: aColumnLabel component: aComponent [

	^ self new 
		columnLabel: aColumnLabel;
		displayFormat: 'text';
		representative: false;
		autoGo: false;
		disabled: false;
		default: false;
		label: aColumnLabel;
		component: aComponent;
		visible: true;
		yourself
]

{ #category : #accessing }
VisibleProperty class >> neoJsonMapping: mapper [
	"For inheritance mapping to work, the schema/classname must be self,
	but the instance variables have to be enumerated manually per class"
	
	super neoJsonMapping: mapper.
	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(columnLabel displayFormat representative autoGo disabled default) ] 
]

{ #category : #accessing }
VisibleProperty >> autoGo [
	^ autoGo
]

{ #category : #accessing }
VisibleProperty >> autoGo: anObject [
	autoGo := anObject
]

{ #category : #accessing }
VisibleProperty >> columnLabel [
	^ columnLabel
]

{ #category : #accessing }
VisibleProperty >> columnLabel: anObject [
	columnLabel := anObject
]

{ #category : #accessing }
VisibleProperty >> default [
	^ default
]

{ #category : #accessing }
VisibleProperty >> default: anObject [
	default := anObject
]

{ #category : #accessing }
VisibleProperty >> disabled [
	^ disabled
]

{ #category : #accessing }
VisibleProperty >> disabled: anObject [
	disabled := anObject
]

{ #category : #accessing }
VisibleProperty >> displayFormat [
	^ displayFormat
]

{ #category : #accessing }
VisibleProperty >> displayFormat: anObject [
	displayFormat := anObject
]

{ #category : #accessing }
VisibleProperty >> representative [
	^ representative
]

{ #category : #accessing }
VisibleProperty >> representative: anObject [
	representative := anObject
]
