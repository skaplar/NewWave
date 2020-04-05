Class {
	#name : #FUGetTaskServer,
	#superclass : #Object,
	#category : #'NewWaveFieldUserTask-Server'
}

{ #category : #'as yet unclassified' }
FUGetTaskServer >> getAllTasks: aUser [
	| entity obj |
	entity := (ZnEasy get: 'http://localhost:8081/alltasks/', aUser) entity string.
	obj := NWClassJSONImporter new importFromJSON: (NeoJSONReader fromString: entity).
	^ obj asOrderedCollection. 
]

{ #category : #'as yet unclassified' }
FUGetTaskServer >> getAllTasksForGroup: groupName [
	| entity obj |
	entity := (ZnEasy get: 'http://localhost:8081/alltasksgroup/', groupName) entity string.
	obj := NWClassJSONImporter new importFromJSON: (NeoJSONReader fromString: entity).
	^ obj asOrderedCollection. 
]

{ #category : #'as yet unclassified' }
FUGetTaskServer >> getTask: aUser [
	| entity obj |
	self deprecated: 'No longer used, when users got added'.
	entity := (ZnEasy get: 'http://localhost:8081/events') entity string.
	obj := NewWaveDOJSONImporter new importFromJSON: (NeoJSONReader fromString: entity).
	^ obj. 
]

{ #category : #'as yet unclassified' }
FUGetTaskServer >> getTaskTest: aUser [
	|adresica json aa imp mag|
	adresica := Adresa new.
	adresica ulica: 'Radnicka'.
	adresica broj: 3."<-nepotrebno"
	json := (NewWaveDOJSONExporter dataObject: adresica) exportDOToJSON."<-nepotrebno"
	imp := NewWaveDOJSONImporter new importFromJSON: json."<-pretvara json koji je dobio u FUDOClassDescription objekat"
	"^ imp."
	aa := (ZnEasy get: 'http://localhost:8081/events') entity string.
	imp := NewWaveDOJSONImporter new importFromJSON: (NeoJSONReader fromString: aa).
	^ imp.
	
]

{ #category : #initialization }
FUGetTaskServer >> initialize [ 	
	super initialize 
]
