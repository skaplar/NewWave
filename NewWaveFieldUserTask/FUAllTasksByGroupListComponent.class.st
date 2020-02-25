"
I am a copy of class FUAllTasksListComponent. This comment is copied from there, and might not be entirely accurate

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
	#name : #FUAllTasksByGroupListComponent,
	#superclass : #FUScreenComponent,
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #'instance creation' }
FUAllTasksByGroupListComponent class >> from: aComponent [
	^ self new
	component: aComponent;
	yourself
]

{ #category : #initialization }
FUAllTasksByGroupListComponent >> initialize [

	super initialize.
	"taksskss := ExampleExecutions returnTwoDataObjects."
	"self tasks: (FUGetTaskServer new getAllTasks: (self session currentlyLoggedUser username))."
	
]

{ #category : #rendering }
FUAllTasksByGroupListComponent >> renderAllTasks: html [
	
	| taskers groupName |
	"This is also here for now, however I intend to refactor it."
	groupName := self session currentlyLoggedUser groupName.
	taskers := (FUGetTaskServer new getAllTasksForGroup: (groupName)).
	taskers ifEmpty: [ html heading: 'No more tasks!' ].
	taskers 
		do: [ :task | 
			html
				tbsModalBody: [ html
						tbsForm: [" html
								tbsContainer: [" 
									html tbsColumn
										extraSmallSize: 0;
										smallSize: 1;
										mediumSize: 1. 
									html tbsColumn
										extraSmallSize: 6;
										smallSize: 3;
										mediumSize: 1;
										with: [ html text: task processName ].
									html tbsColumn
										extraSmallSize: 6;
										smallSize: 3;
										mediumSize: 1;
										with: [ html text: task taskName ].
									html tbsColumn
										extraSmallSize: 6;
										smallSize: 4;
										mediumSize: 1;
										with: [ html text: task taskDescription ].
									html tbsColumn
										extraSmallSize: 6;
										smallSize: 4;
										mediumSize: 1;
										with: [ html text: task groupName ].
									html tbsColumn
										extraSmallSize: 6;
										smallSize: 4;
										mediumSize: 1;
										with: [ html text: task userName ].
									
									html tbsColumn
										with: [ self renderButtonDoTask: html task: task ] ].
							html horizontalRule ] ] "]" 
]

{ #category : #rendering }
FUAllTasksByGroupListComponent >> renderButtonDoTask: html	task: task [
	
	task userName 
		ifEmpty: [  
			html tbsSubmitButton
				beWarning;
				callback: [  
					| tmp entity |
					"tmp := self call: (FUTaskComponent new task: task)."
					ZnClient new
   						url: 'http://localhost:8081/assignTask';
   						formAt: 'taskName' put: task taskName;
   						formAt: 'userName' put: self session currentlyLoggedUser username;
						formAt: 'processId' put: task processId;
						formAt: 'groupName' put:  task groupName;
						formAt: 'taskId' put: task taskId;
   						post.
				];
				with: 'Assign'.
		] ifNotEmpty: [  
			html tbsSubmitButton
				beSuccess;
				callback: [  
					| tmp |
		
					tmp := self call: (FUTaskComponent new task: task).
					"I can return from component true, false or anything I like."
					"tmp ifTrue: [ self tasks remove: task. ]"
		
				];
			with: 'Do task'.
		].
	
]

{ #category : #rendering }
FUAllTasksByGroupListComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [
		html heading: 'Tasks ';
		break;
		break.
		"html horizontalRule"].
	
	html tbsColumn
		extraSmallSize: 0;
		smallSize: 1;
		mediumSize: 1. 

	
	html tbsColumn
		extraSmallSize: 6;
		smallSize: 3;
		mediumSize: 1;
		with: [ html heading
					level: 4;
					with: 'Process' ].
	html tbsColumn
		extraSmallSize: 6;
		smallSize: 3;
		mediumSize: 1;
		with: [ html heading
					level: 4;
					with: 'Task' ].
	html tbsColumn
		extraSmallSize: 6;
		smallSize: 3;
		mediumSize: 1;
		with: [ html heading
					level: 4;
					with: 'Description' ].
	html tbsColumn
		extraSmallSize: 6;
		smallSize: 3;
		mediumSize: 1;
		with: [ html heading
					level: 4;
					with: 'Group' ].
	html tbsColumn
		extraSmallSize: 6;
		smallSize: 3;
		mediumSize: 1;
		with: [ html heading
					level: 4;
					with: 'User' ].				
	html tbsRow.
	html horizontalRule.
	html tbsColumn
		with: [ 
			self renderAllTasks: html
		].
]
