Class {
	#name : #FUFormMagritte,
	#superclass : #MAReport,
	#instVars : [
		'fields'
	],
	#category : #NewWaveFieldUserTask
}

{ #category : #'instance creation' }
FUFormMagritte class >> from: aTask [
   | forma |
	forma := FUFormMagritte new fields: aTask formProperties.
   ^ forma getMagritteForm
]

{ #category : #adding }
FUFormMagritte >> addField: aField [
	fields add: aField
	
]

{ #category : #accessing }
FUFormMagritte >> fields [
	^ fields
]

{ #category : #accessing }
FUFormMagritte >> fields: aFields [
	fields := aFields 
]

{ #category : #'as yet unclassified' }
FUFormMagritte >> getMagritteForm [
	| fieldDesc |
	fieldDesc := OrderedCollection new.
	fieldDesc := self fields collect: [ :f | (FUFieldMagritte new field: f) fieldDescription ].
	^ fieldDesc
]

{ #category : #initialization }
FUFormMagritte >> initialize [
	super initialize.
	fields := OrderedCollection new
]

{ #category : #rendering }
FUFormMagritte >> renderContentOn: html [
	| tmp1 |
	super renderContentOn: html.
	tmp1 := self asComponent.
	tmp1
		addDecoration:
			(MAFormDecoration 
				buttons:
					{(#save -> 'Finish task').
					(#cancel -> 'Cancel')}).
	^ tmp1 yourself
]
