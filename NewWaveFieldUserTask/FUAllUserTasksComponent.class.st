Class {
	#name : #FUAllUserTasksComponent,
	#superclass : #FUScreenComponent,
	#instVars : [
		'report',
		'component',
		'task'
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

{ #category : #'as yet unclassified' }
FUAllUserTasksComponent >> getMADescription [
	|ent obj form |
	ent := FUDOMagritteContainerCreator dataObject: self task.
	obj := ent createEntity.
	obj := FUDOMagritteContainerCreator dataObject: obj.
	form := ent createMaContainer asComponentOn: obj do.
	self task: obj.
"	form addDecoration:
			(MAFormDecoration
				buttons:
					{(#save -> 'Finish task').
					(#cancel -> 'Cancel')})."
	^ form addValidation  
]

{ #category : #initialization }
FUAllUserTasksComponent >> initialize [
|taksskss|
	super initialize.
	"taksskss := self session currentlyLoggedUser tasks."
	taksskss := FUGetTaskServer new getTaskTest: (self session currentlyLoggedUser username).
	taksskss isNil
		ifFalse: [ 
			"self report: (FUTaskReport from: (self session currentlyLoggedUser tasks))"
			self task: taksskss  ].
]

{ #category : #rendering }
FUAllUserTasksComponent >> renderAcceptButton: html [
	html tbsSubmitButton 
		tbsPullRight;
		beSuccess;
		callback: [ self sendResult ];
		value: 'Finish task'.
	html tbsSubmitButton
		tbsPullRight;
		beSuccess;
		callback: [ self goBack ];
		value: 'Cancel'.
	
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
					html render: self getMADescription.					
						self renderAcceptButton: html. ].
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

{ #category : #'as yet unclassified' }
FUAllUserTasksComponent >> sendResult [
	self halt.
]

{ #category : #accessing }
FUAllUserTasksComponent >> task [
	^ task
]

{ #category : #accessing }
FUAllUserTasksComponent >> task: anObject [
	task := anObject
]
