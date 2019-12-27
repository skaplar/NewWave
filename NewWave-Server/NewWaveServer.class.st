Class {
	#name : #NewWaveServer,
	#superclass : #Object,
	#instVars : [
		'port',
		'teapot',
		'engine',
		'element',
		'pendingTasks'
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
	| tmp entity |
	tmp := NewWaveDOJSONImporter new
		importFromJSON: aRequest entity string.
	entity := (NewWaveMagritteContainerCreator dataObject: tmp) createEntity.
	engine engineAnnouncer announce: (WaveAnnouncer with: entity).
	^ 'Adding of entity executed'
]

{ #category : #routes }
NewWaveServer >> addNewEntityMultipleDataObjects: aRequest [
	| tmp entity |
	"This is not used, internal purposes only!"
	
	"tmp := NeoJSONWriter toString: aRequest entity fields."
	"tmp := NewWaveDOJSONImporter new importFromJSON: (NeoJSONReader fromString: aRequest entity string)."
	"Ovo je bilo kad sam pokusavao parcijalno da zavrsim zadatke... Odnosno kad sam citao dataObjekte sa servera, jedan po jedan, sada ce da ide promena da se salju svi dataobjekti odjednom..."
	tmp := NewWaveDOJSONImporter new
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

{ #category : #initialization }
NewWaveServer >> pendingTasks [
	^ pendingTasks
]

{ #category : #accessing }
NewWaveServer >> port: anObject [
	port := anObject
]

{ #category : #initialization }
NewWaveServer >> readAllTasksForUser: aRequest [
	| n prvi exp |
	n := pendingTasks at: 'default'.
	n ifNil: [ ^ 'Non-existing user' ].
	n ifEmpty: [ ^ 'Empty' ].
	prvi := n first.
	
	exp := NewWaveArrayDOJSONExporter tasks: n.
	^ exp exportDOToJSON.
	"^ ExampleExecutions returnTwoDataObjects exportDOToJSON"
]

{ #category : #initialization }
NewWaveServer >> readEvents: aRequest [
	| n prvi exp |
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
		GET: '/alltasks' -> (Send message: #readAllTasksForUser: to: self); output: #json.
		
]

{ #category : #routes }
NewWaveServer >> removeTask: aTask user: aUser [
	| tasks |
	tasks := pendingTasks at: aUser ifAbsent: [ ^ '{"result": "Empty"}'].
	tasks remove: aTask.
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
