Class {
	#name : #FUAllUserTasksComponent,
	#superclass : #FUScreenComponent,
	#instVars : [
		'tasks',
		'component'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #'instance creation' }
FUAllUserTasksComponent class >> from: aComponent [
	^ self new
	component: aComponent;
	yourself
]

{ #category : #accessing }
FUAllUserTasksComponent >> component [
	^ component
]

{ #category : #accessing }
FUAllUserTasksComponent >> component: aComponent [
	component := aComponent 
]

{ #category : #initialization }
FUAllUserTasksComponent >> initialize [
	super initialize.
	tasks := OrderedCollection new

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
		html heading: 'Your tasks are:'.
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
					self renderAllTasks: html ].
				]
			].
	html tbsColumn
		extraSmallSize: 0;
		smallSize: 1;
		mediumSize: 2. 
]

{ #category : #accessing }
FUAllUserTasksComponent >> tasks [
	^ tasks
]

{ #category : #accessing }
FUAllUserTasksComponent >> tasks: aTasks [
	tasks := aTasks
]
