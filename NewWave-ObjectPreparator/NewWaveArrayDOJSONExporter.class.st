"
I am a class that is used to export Array of NewWaveDOClassDescription. I am used by the server to export necesserary data to the endpoint. I work with NWTaskWrapper classes. NWTaskWrapper bundles task and process info in one place.

"
Class {
	#name : #NewWaveArrayDOJSONExporter,
	#superclass : #Object,
	#instVars : [
		'tasks'
	],
	#category : #'NewWave-ObjectPreparator'
}

{ #category : #'as yet unclassified' }
NewWaveArrayDOJSONExporter class >> tasks: allTasks [
	^ self new
	tasks: allTasks;
	yourself
]

{ #category : #accessing }
NewWaveArrayDOJSONExporter >> collectInstVars: aDataObject [
	^ aDataObject class instVarNames
]

{ #category : #initialization }
NewWaveArrayDOJSONExporter >> createClassContainer [
	^ tasks collect: [ :each |  
		| container |
		container := NewWaveDOClassDescription new.
		container className: (each task dataOutputAssociations first valuedDataObject) class name. 
		container taskName: each task name.
		container taskDescription: each task description.
		container addAllToProps: (self eximplify: (each task dataOutputAssociations first valuedDataObject)).
		container processName: each process name.
		container processId: each process id.
		container processInstanceId: each process processInstanceId.
		container
	].
	
]

{ #category : #initialization }
NewWaveArrayDOJSONExporter >> eximplify: aDataObject [
	^ (self collectInstVars: aDataObject) collect: [ :each | 
		| desc |
		desc := NewWaveDOPropertyDescription new.
		desc varName: each.
		desc varValue: (aDataObject instVarNamed: each).
		desc varType: (aDataObject instVarNamed: each) class asString.  
		desc
	].
]

{ #category : #initialization }
NewWaveArrayDOJSONExporter >> exportDOToJSON [
	| t |
	t := String
		streamContents: [ :out | 
			(NeoJSONWriter on: out)
				prettyPrint: true;
				asciiOnly: true;
				mapInstVarsFor: NewWaveDOClassDescription;
				nextPut: self createClassContainer].
	Transcript show: t.
	^ t.
]

{ #category : #initialization }
NewWaveArrayDOJSONExporter >> initialize [ 
	super initialize.
	
]

{ #category : #accessing }
NewWaveArrayDOJSONExporter >> tasks [
	^ tasks
]

{ #category : #accessing }
NewWaveArrayDOJSONExporter >> tasks: allTasks [
	tasks := allTasks
]
