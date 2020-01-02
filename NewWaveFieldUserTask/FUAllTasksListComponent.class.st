"
I am a copy of class FUAllUserTasksComponent. This comment is copied from there, and might not be entirely accurate

Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	component:		<Object>
	report:		<Object>
	task:		<Object>


    Implementation Points
"
Class {
	#name : #FUAllTasksListComponent,
	#superclass : #FUScreenComponent,
	#instVars : [
		'report',
		'tasks'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #'instance creation' }
FUAllTasksListComponent class >> from: aComponent [
	^ self new
	component: aComponent;
	yourself
]

{ #category : #initialization }
FUAllTasksListComponent >> initialize [
|taksskss|
	super initialize.
	"taksskss := self session currentlyLoggedUser tasks."
	"taksskss := FUGetTaskServer new getTask: (self session currentlyLoggedUser username)."
	"taksskss := ExampleExecutions returnTwoDataObjects."
	taksskss := FUGetTaskServer new getAllTasks: (self session currentlyLoggedUser username).
	taksskss isNil
		ifFalse: [ 
			"self report: (FUTaskReport from: (self session currentlyLoggedUser tasks))"
			self tasks: taksskss  ].
]

{ #category : #rendering }
FUAllTasksListComponent >> renderAllTasks: html [
	"self tasks ifNotNil: [ 
			self tasks do: [ :t | html render: ( FURowTaskComponent new task: t ) ]
	 ]."
	
	self tasks ifEmpty: [ html heading: 'No more tasks!' ].
	self tasks 
		do: [ :task | 
			html
				tbsModalBody: [ html
						tbsForm: [" html
								tbsContainer: [" 
									html tbsColumn
										extraSmallSize: 0;
										smallSize: 1;
										mediumSize: 2. 
									html tbsColumn
										extraSmallSize: 6;
										smallSize: 3;
										mediumSize: 2;
										with: [ html text: task processName ].
									html tbsColumn
										extraSmallSize: 6;
										smallSize: 3;
										mediumSize: 2;
										with: [ html text: task taskName ].
									html tbsColumn
										extraSmallSize: 6;
										smallSize: 4;
										mediumSize: 3;
										with: [ html text: task taskDescription ].
									html tbsColumn
										with: [ self renderButtonDoTask: html task: task ] ].
							html horizontalRule ] ] "]" 
]

{ #category : #rendering }
FUAllTasksListComponent >> renderButtonDoTask: html	task: task [
	html tbsSubmitButton
	beSuccess;
	callback: [  
		| tmp |
		tmp := self call: (FUTaskComponent new task: task).
		self tasks remove: tmp.
	];
	with: 'Do task'.
]

{ #category : #rendering }
FUAllTasksListComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [
		html heading: 'Choose task and do it:'.
		"html horizontalRule"].
	
	html tbsColumn
		extraSmallSize: 0;
		smallSize: 1;
		mediumSize: 2. 

	html tbsColumn
		extraSmallSize: 6;
		smallSize: 3;
		mediumSize: 2;
		with: [ html heading
					level: 4;
					with: 'Process' ].
	html tbsColumn
		extraSmallSize: 6;
		smallSize: 3;
		mediumSize: 2;
		with: [ html heading
					level: 4;
					with: 'Task' ].
	html tbsColumn
		extraSmallSize: 6;
		smallSize: 3;
		mediumSize: 2;
		with: [ html heading
					level: 4;
					with: 'Description' ].				
	html tbsRow.
	html horizontalRule.
	html tbsColumn
		with: [ 
			self renderAllTasks: html
		].
]

{ #category : #accessing }
FUAllTasksListComponent >> report [
	^ report
]

{ #category : #accessing }
FUAllTasksListComponent >> report: arg1 [
	report := arg1
]

{ #category : #'as yet unclassified' }
FUAllTasksListComponent >> sendResult [
	| newValue json |
	self component validate 
		ifFalse: [ ^nil ]."show validation message"
	newValue := self component save model.
	json := (FUDOJSONExporter dataObject: newValue) exportDOToJSON.
	FUCommitTaskServer new commitTask: json.
]

{ #category : #initialization }
FUAllTasksListComponent >> tasks [
	^ tasks
]

{ #category : #initialization }
FUAllTasksListComponent >> tasks: aTasks [
	tasks := aTasks
]
