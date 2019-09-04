Class {
	#name : #FUAllUserTasksComponent,
	#superclass : #FUScreenComponent,
	#instVars : [
		'report'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #'instance creation' }
FUAllUserTasksComponent class >> from: aComponent [
	^ self new
	component: aComponent;
	yourself
]

{ #category : #initialization }
FUAllUserTasksComponent >> initialize [
	super initialize.
	self report: (FUTaskReport from: (self session currentlyLoggedUser tasks)).
]

{ #category : #rendering }
FUAllUserTasksComponent >> renderAllTasks: html [
	self tasks isNil 
		ifFalse: [ 
			self tasks do: [ :t | t isWaiting and: [html render: ( FURowTaskComponent new task: t )] ]
	 ]
]

{ #category : #rendering }
FUAllUserTasksComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [
		html heading: 'Choose task and do it:'.
		html horizontalRule].
	html tbsColumn
		extraSmallSize: 0;
		smallSize: 1;
		mediumSize: 2. 
	html tbsColumn
		extraSmallSize: 12;
		smallSize: 10;
		mediumSize: 8;
		with: [ 
			html tbsModalBody: [
				html tbsForm: [	
					html render: self report ].
				]
			].
	html tbsColumn
		extraSmallSize: 0;
		smallSize: 1;
		mediumSize: 2. 
]

{ #category : #accessing }
FUAllUserTasksComponent >> report [
	^ report
]

{ #category : #accessing }
FUAllUserTasksComponent >> report: arg1 [
	report := arg1
]
