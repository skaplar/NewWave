Class {
	#name : #FURowTaskComponent,
	#superclass : #WAComponent,
	#instVars : [
		'task'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #evaluating }
FURowTaskComponent >> announcer [
	^ task announcer
]

{ #category : #'as yet unclassified' }
FURowTaskComponent >> goToDoTask [
	| newComponent |
	newComponent := FUDoTaskComponent new.
	newComponent fields: (self task formProperties ).
	self call: newComponent 
	
]

{ #category : #initialization }
FURowTaskComponent >> initialize [
	super initialize.
	task := FUTask new
]

{ #category : #rendering }
FURowTaskComponent >> renderButtonDoTask: html [	
	html tbsSubmitButton
	beSuccess;
	callback: [self goToDoTask ];
	with: 'Do task'
]

{ #category : #rendering }
FURowTaskComponent >> renderContentOn: html [
	html tbsContainer: [ 
		html tbsColumn
				extraSmallSize: 6;
				smallSize: 3;
				mediumSize: 2;
			with: [ html heading level: 4; with: self value].
		html tbsColumn
				extraSmallSize: 6;
				smallSize: 3;
				mediumSize: 2;
			with: [ html text: self result. ].
		html tbsColumn
				extraSmallSize: 6;
				smallSize: 4;
				mediumSize: 3;
			with: [ html text: self announcer ].
		html tbsColumn
			with: [ self renderButtonDoTask: html ]
		 ].	
		html horizontalRule.

]

{ #category : #evaluating }
FURowTaskComponent >> result [
	^ task result
]

{ #category : #accessing }
FURowTaskComponent >> task [
	^ task 
]

{ #category : #accessing }
FURowTaskComponent >> task: aTask [
	task := aTask
]

{ #category : #evaluating }
FURowTaskComponent >> value [
	^ task value
]
