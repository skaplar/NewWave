Class {
	#name : #FUTaskComponent,
	#superclass : #WAComponent,
	#instVars : [
		'task'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #evaluating }
FUTaskComponent >> announcer [
	^ task announcer
]

{ #category : #initialization }
FUTaskComponent >> initialize [
	super initialize.
	task := FUTask new
]

{ #category : #rendering }
FUTaskComponent >> renderButtonDoTask: html [	
	html tbsSubmitButton
	beSuccess;
	callback: [ self validate ];
	value: 'Do task'
]

{ #category : #rendering }
FUTaskComponent >> renderContentOn: html [
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
FUTaskComponent >> result [
	^ task result
]

{ #category : #accessing }
FUTaskComponent >> task: aTask [
	task := aTask
]

{ #category : #evaluating }
FUTaskComponent >> value [
	^ task value
]
