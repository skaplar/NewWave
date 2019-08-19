Class {
	#name : #FUFieldComponent,
	#superclass : #WAComponent,
	#instVars : [
		'field'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #accessing }
FUFieldComponent >> field [
	^ field
]

{ #category : #accessing }
FUFieldComponent >> field: aField [
	field := aField
]

{ #category : #initialization }
FUFieldComponent >> initialize [
	super initialize.
]

{ #category : #rendering }
FUFieldComponent >> renderAcceptButton: html [
]

{ #category : #rendering }
FUFieldComponent >> renderContentOn: html [
	html tbsContainer: [ 
		html tbsColumn
				extraSmallSize: 5;
				smallSize: 4;
				mediumSize: 3;
			with: [ html text; with: self field name].
		html tbsColumn
				extraSmallSize: 7;
				smallSize: 8;
				mediumSize: 9;
			with: [ self renderFieldType: html ].
		html horizontalRule.
		self renderAcceptButton: html
		]
]

{ #category : #rendering }
FUFieldComponent >> renderFieldType: html [
]
