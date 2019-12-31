"
I am a copy of class NewWaveDOJSONExporter. This comment is copied from there, and might not be entirely accurate

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
	do:		<Object>


    Implementation Points
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
