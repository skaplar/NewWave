Class {
	#name : #FUTaskReport,
	#superclass : #MAReport,
	#instVars : [
		'tasks'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #'as yet unclassified' }
FUTaskReport class >> filteredDescriptionsFrom: aTask [
	^ aTask magritteDescription
		select: [ :t | #(#taskID #details) includes: t accessor selector ]
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
FUTaskReport >> doTask: aTask [
	|dataFields|
	self session currentTask: aTask.
	self call: (FUDataFieldReport from: aTask dataFields)
	
	"self call: (FUDoTaskComponent new task: aTask)."
	
	"aTask dataFields do: [ :f | self call: (self renderField: f) ].
	dataFields := self call: (self renderEditForm: aTask dataFields).
	dataFields ifNotNil: [  ]"
	
	
]

{ #category : #'as yet unclassified' }
FUTaskReport >> getDictionaryFromProps: aFormProperties [
	| dict counter temp|
	dict := Dictionary new.
			counter := 1.
	aFormProperties isNil 
		ifFalse: [ 
			aFormProperties do: [ :prop | 
				temp := (prop asComponent).
				temp := ((temp children) at: 1) magritteDescription .
				dict at: counter put: temp .  
				counter := counter+1]
			 ].
	^ dict 
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
FUTaskReport >> renderEditForm: aDataFields [
	| form for1|
	for1 := (aDataFields at:1 )asComponent .
	form := MAContainerComponent new.
	form setDescription: MAPriorityContainer new.
	form setChildren: (self getDictionaryFromProps: aDataFields).
	form
		addDecoration:
			(MAFormDecoration
				buttons:
					{(#save -> 'OK').
					(#cancel -> 'Cancel')}).
	^ form   
]

{ #category : #rendering }
FUTaskReport >> renderField: aDataField [
	| form |
	form := aDataField asComponent.
	form addValidation.
	form
		addDecoration:
			(MAFormDecoration
				buttons:
					{(#save -> 'OK').
					(#cancel -> 'Cancel')}).
	^ form   
]

{ #category : #accessing }
FUTaskReport >> tasks [
	^ tasks
]

{ #category : #accessing }
FUTaskReport >> tasks: aTasks [
	tasks := aTasks 
]
