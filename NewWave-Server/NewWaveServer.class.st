Class {
	#name : #NewWaveServer,
	#superclass : #Object,
	#instVars : [
		'port',
		'teapot',
		'engine',
		'element',
		'pendingTasks',
		'pendingTasksCollection',
		'originalTasksCollection'
	],
	#category : #'NewWave-Server'
}

{ #category : #'instance creation' }
NewWaveServer class >> serveOn: portNumber [
	^ self new  
		initializePort: portNumber;
		start
]

{ #category : #'instance creation' }
NewWaveServer class >> serveOn: portNumber waveEngine: aWaveEngine [
	^ self new  
		initializePort: portNumber;
		engine: aWaveEngine; 
		start
]

{ #category : #routes }
NewWaveServer >> addEvent: aRequest [
	engine engineAnnouncer announce: (WaveAnnouncer with: 'Izvrsen').
	^ 'Izvrsen'
		
]

{ #category : #routes }
NewWaveServer >> addNewEntity: aRequest [
	| tmp entity pHandler |
	tmp := NWClassJSONImporter new
		importObjectFromJSON: aRequest entity string.
	"entity := (NewWaveMagritteContainerCreator dataObject: tmp) createEntity."
	pHandler := engine processHandler: (tmp processInstanceId).
	"Ranije sam prosledjivao entity, medjutim ne zelim da mi se kompajlira jos jednom objekat tako da ga vracam ovde kao NWClassDescription" 
	pHandler engineAnnouncer announce: (WaveAnnouncer with: tmp).
	"engine engineAnnouncer announce: (WaveAnnouncer with: tmp)"
	^ 'Adding of entity executed'
]

{ #category : #routes }
NewWaveServer >> addNewEntityMultipleDataObjects: aRequest [
	| tmp entity |
	"This is not used, internal purposes only!"
	
	"tmp := NeoJSONWriter toString: aRequest entity fields."
	"tmp := NewWaveDOJSONImporter new importFromJSON: (NeoJSONReader fromString: aRequest entity string)."
	"Ovo je bilo kad sam pokusavao parcijalno da zavrsim zadatke... Odnosno kad sam citao dataObjekte sa servera, jedan po jedan, sada ce da ide promena da se salju svi dataobjekti odjednom..."
	tmp := NWClassJSONImporter new
		importFromJSON: aRequest entity string.
	entity := (NewWaveMagritteContainerCreator dataObject: tmp) createEntity.
	pendingTasks
		at: 'default'
		ifPresent: [ :task | 
			task first addElement: (task first findDataObject: entity).
			task first elements size = task first dataOutputAssociations size ifTrue: [ 
				engine engineAnnouncer announce: (WaveAnnouncer with: tmp).
			].
		].
	^ 'Adding of entity executed'
]

{ #category : #routes }
NewWaveServer >> addTask: aTask user: aUser [
	
	pendingTasks
		at: aUser
		ifPresent: [ 
			:tasks |
			tasks add: aTask.
		]
		ifAbsentPut: [ OrderedCollection with: aTask ].
	pendingTasksCollection add: aTask.
]

{ #category : #routes }
NewWaveServer >> addTaskWrapper: aTaskWrapper addTask: anOriginalTask [
	"aTaskWrapper is a NewWaveDOClassDescription, which is used to be send to the server
	anOriginal task is a task entity in the system.
	I have a list of original tasks so I can update them"
	pendingTasksCollection add: aTaskWrapper.
	originalTasksCollection add: anOriginalTask.
]

{ #category : #routes }
NewWaveServer >> assignTask: aRequest [
	"Assigning a task to the user, with the request from the server. 
	IE. When the group on the task in the process is the only thing that is defined,
	user which belongs to the group can assign itself to the task using web application."
	
	| tmp taskDescriptionsList |
	aRequest traceCr.
	taskDescriptionsList := pendingTasksCollection
		detect: [ :each | 
			| gName pId tId |
			gName := aRequest at: #groupName.
			pId := aRequest at: #processId.
			tId := aRequest at: #taskId.
			each groupName = gName & (each processId = pId)
				& (each taskId = tId) ].
	taskDescriptionsList userName: (aRequest at: #userName).
	tmp := originalTasksCollection detect: [ :each | each id = (aRequest at: #taskId)].

	"userManagement := engine findManagementByProcessId: (aRequest at: #processId). 
	tmp user: (userManagement findUserByName: (aRequest at: #userName)).
	This is an idea when I start working on support for multiple groups and managements."
	
	
	tmp user: (engine userManagement findUserByName: (aRequest at: #userName)).

	"tmp := NewWaveDOJSONImporter new
		importFromJSON: aRequest entity string.
	entity := (NewWaveMagritteContainerCreator dataObject: tmp) createEntity.
	pHandler := engine processHandler: (tmp processInstanceId). 
	pHandler engineAnnouncer announce: (WaveAnnouncer with: entity)."
	^ 'Adding of entity executed'.
]

{ #category : #accessing }
NewWaveServer >> element [
	^ element
]

{ #category : #accessing }
NewWaveServer >> element: anObject [
	element := anObject
]

{ #category : #initialization }
NewWaveServer >> engine [
	^ engine
]

{ #category : #initialization }
NewWaveServer >> engine: waveEngine [
	engine := waveEngine
]

{ #category : #initialization }
NewWaveServer >> initialize [ 
	super initialize.
	pendingTasks := Dictionary new.
	pendingTasksCollection := OrderedCollection new.
	originalTasksCollection := OrderedCollection new.
]

{ #category : #initialization }
NewWaveServer >> initializePort: anInteger [
	teapot := Teapot configure: { 
		#port -> anInteger.
		#debugMode -> true.
		#defaultOutput -> #json.
	 }.
	
	^ self
		registerRoutes;
		registerErrorHandlers;
		yourself.
]

{ #category : #accessing }
NewWaveServer >> originalTasksCollection [
	^ originalTasksCollection
]

{ #category : #initialization }
NewWaveServer >> pendingTasks [
	^ pendingTasks
]

{ #category : #initialization }
NewWaveServer >> pendingTasksCollection [
	^ pendingTasksCollection
]

{ #category : #accessing }
NewWaveServer >> port: anObject [
	port := anObject
]

{ #category : #initialization }
NewWaveServer >> readAllTasksForGroup: aRequest [
	| taskDescriptionsList exp |
	taskDescriptionsList := pendingTasksCollection select: [ :each | each groupName = (aRequest at: #groupname) ].
	taskDescriptionsList ifEmpty: [ ^ '[]' ].
	"exp := NewWaveArrayDOJSONExporter nwClassDescriptions: taskDescriptionsList."
	exp := NWClassJSONExporter withClassDescriptions: taskDescriptionsList.
	^ exp exportNWClassDescriptionToJSON.
]

{ #category : #initialization }
NewWaveServer >> readAllTasksForUser: aRequest [
	| taskDescriptionsList exp |
	self deprecated: 'Deprecated and not used, here for legacy reasons.'.

		"taskDescriptionsList := pendingTasks at: (aRequest at: #username) ifAbsent: [ ^'[]' ]."
	taskDescriptionsList := pendingTasks at: 'default'.
	taskDescriptionsList ifNil: [ ^ 'Non-existing user' ].
	taskDescriptionsList ifEmpty: [ ^ '[]' ].
	exp := NWClassJSONExporter withClassDescriptions: taskDescriptionsList.
	^ exp exportDOToJSON.
]

{ #category : #initialization }
NewWaveServer >> readAllTasksForUserName: aRequest [
	| taskDescriptionsList exp |
	taskDescriptionsList := pendingTasksCollection select: [ :each | each userName = (aRequest at: #username) ].
	taskDescriptionsList ifEmpty: [ ^ '[]' ].
	"exp := NewWaveArrayDOJSONExporter nwClassDescriptions: taskDescriptionsList."
	exp := NWClassJSONExporter withClassDescriptions: taskDescriptionsList.
	^ exp exportNWClassDescriptionToJSON.
]

{ #category : #initialization }
NewWaveServer >> readEvents: aRequest [
	| n prvi exp |
	
	self deprecated: 'We use users and groups now'.
	n := pendingTasks at: 'default'.
	n ifNil: [ ^ 'Non-existing user' ].
	n ifEmpty: [ ^ 'Empty' ].
	prvi := n first.
	"exp := NewWaveDOJSONExporter dataObject: prvi nextDataObject."
	" Dodati podrsku za vise data objekata!"
	exp := NewWaveDOJSONExporter dataObject: prvi dataOutputAssociations first valuedDataObject.
	^ exp exportDOToJSON.  
	"^ prvi value."
]

{ #category : #initialization }
NewWaveServer >> registerErrorHandlers [
	teapot
		exception: TeaNoSuchParam -> (Send message: #missingParam:request: to: self).
		"exception: BookNotFound -> (Send message: #bookNotFound:request: to: self);
		exception: Error -> (TeaResponse serverError body: { #code -> 'ERROR' } asDictionary )	"	
]

{ #category : #initialization }
NewWaveServer >> registerRoutes [
	teapot
		GET: '/' -> '<h1>It works!</h1>';output: #html;
		GET: '/events' -> (Send message: #readEvents: to: self); output: #json;
		GET: '/eventzz' -> (Send message: #addEvent: to: self); output: #json;
		POST: '/addNewEntity' -> (Send message: #addNewEntity: to: self);
		GET: '/alltasks' -> (Send message: #readAllTasksForUser: to: self); output: #json;
		GET: '/alltasks/<username>' -> (Send message: #readAllTasksForUserName: to: self); output: #json;
		GET: '/alltasksgroup/<groupname>' -> (Send message: #readAllTasksForGroup: to: self); output: #json;
		POST: '/assignTask' -> (Send message: #assignTask: to: self).
		
]

{ #category : #routes }
NewWaveServer >> removeTask: aTask [
	pendingTasksCollection remove: aTask.
	
	
]

{ #category : #controlling }
NewWaveServer >> start [
	teapot start.
	^ self.
]

{ #category : #controlling }
NewWaveServer >> stop [
	teapot stop.
]
