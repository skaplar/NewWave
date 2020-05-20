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

{ #category : #initialization }
FUGetTaskServer >> initialize [ 	
	super initialize 
]
