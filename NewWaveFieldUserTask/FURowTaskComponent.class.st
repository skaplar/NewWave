Class {
	#name : #FURowTaskComponent,
	#superclass : #WAComponent,
	#instVars : [
		'task',
		'component'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #'instance creation' }
FURowTaskComponent class >> from: aComponent [
	^ self new
	component: aComponent;
	yourself
]

{ #category : #accessing }
FURowTaskComponent >> component [
	^ component
]

{ #category : #accessing }
FURowTaskComponent >> component: anObject [
	component := anObject
]

{ #category : #'as yet unclassified' }
FURowTaskComponent >> goToDoTask [
	"generating form should be here - some day in future"
	| object |
	object := component call: (FUTaskComponent new task: task).
	'povratna vrednost je ' traceCr.
	object traceCr.
	self answer: task.
]

{ #category : #initialization }
FURowTaskComponent >> initialize [
	super initialize
]

{ #category : #rendering }
FURowTaskComponent >> renderButtonDoTask: html [	
	html tbsSubmitButton
	beSuccess;
	callback: [ self goToDoTask ];
	with: 'Do task'.
	"  html anchor  
        callback: [ self goToDoTask];
        with: 'edit'."
			
]

{ #category : #rendering }
FURowTaskComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsModalBody: [
				html tbsForm: [	
					html tbsContainer: [ 
		html tbsColumn
				extraSmallSize: 6;
				smallSize: 3;
				mediumSize: 2;
			with: [ html heading level: 4; with: 'Task'].
		html tbsColumn
				extraSmallSize: 6;
				smallSize: 3;
				mediumSize: 2;
			with: [ html text: (task taskName). ].
		html tbsColumn
				extraSmallSize: 6;
				smallSize: 4;
				mediumSize: 3;
			with: [ html text: task taskDescription. ].
		html tbsColumn
			 with: [ 
					self renderButtonDoTask: html ].
		 ].	
		html horizontalRule.
]]
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
