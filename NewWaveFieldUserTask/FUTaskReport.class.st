Class {
	#name : #FUTaskReport,
	#superclass : #MAReport,
	#instVars : [
		'report',
		'tasks'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #'as yet unclassified' }
FUTaskReport class >> filteredDescriptionsFrom: aTask [
	^ aTask magritteDescription
		select: [ :t | #(#value #announcer #result #status) includes: t accessor selector ]
]

{ #category : #'instance creation' }
FUTaskReport class >> from: tasks [
	| tmp1 tmp3 |
	tmp1 := self rows: tasks description: (self filteredDescriptionsFrom: tasks anyOne).
	tmp1 tasks: tasks.
	tmp3 := MACommandColumn new.
	tmp3
		addCommandOn: tmp1 selector: #doTask: text: 'Do task'.
	tmp1 addColumn: tmp3 yourself.
	^ tmp1
]

{ #category : #'as yet unclassified' }
FUTaskReport >> doTask: task [
	self call: (FUDoTaskComponent new task: task).
]

{ #category : #'as yet unclassified' }
FUTaskReport >> refreshReport [
	self
		rows: tasks;
		refresh
]

{ #category : #rendering }
FUTaskReport >> renderContentOn: html [
	super renderContentOn: html
]

{ #category : #rendering }
FUTaskReport >> renderDoTaskForm: task [
	| tmp2 |
	tmp2 := task formProperties asComponent.
	tmp2 addDecoration: (MAFormDecoration buttons: {(#cancel -> 'Back')}).
	tmp2 addDecoration: (MAFormDecoration buttons: {(#save -> 'Finish task')}).
	^ tmp2 yourself
]

{ #category : #accessing }
FUTaskReport >> tasks [
	^ tasks
]

{ #category : #accessing }
FUTaskReport >> tasks: aTasks [
	tasks := aTasks 
]
