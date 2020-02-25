"
I am a class that is used to export data object that is filled in the WebApp, and also to bundle process information, because I am submitted to the server, which needs to know info about the process.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	do:		<Object>


    Implementation Points
"
Class {
	#name : #NewWaveDOProcessJSONExporter,
	#superclass : #Object,
	#instVars : [
		'do',
		'processName',
		'processId',
		'processInstanceId',
		'taskName',
		'taskDescription',
		'userName',
		'groupName',
		'taskId'
	],
	#category : #'NewWave-ObjectPreparator'
}

{ #category : #'as yet unclassified' }
NewWaveDOProcessJSONExporter class >> dataObject: do processName: aProcessName processId: aProcessId processInstanceId: aProcessInstanceId taskName: aTaskName taskDescription: aTaskDescription userName: aUserName groupName: aGroupName [
	^ self new
	do: do;
	processName: aProcessName;
	processId: aProcessId;
	processInstanceId: aProcessInstanceId;
	taskName: aTaskName;
	taskDescription: aTaskDescription;
	userName: aUserName;
	groupName: aGroupName;
	yourself
]

{ #category : #'as yet unclassified' }
NewWaveDOProcessJSONExporter class >> dataObject: do processName: aProcessName processId: aProcessId processInstanceId: aProcessInstanceId taskName: aTaskName taskDescription: aTaskDescription userName: aUserName groupName: aGroupName taskId: aTaskId [
	^ self new
	do: do;
	processName: aProcessName;
	processId: aProcessId;
	processInstanceId: aProcessInstanceId;
	taskId: aTaskId;
	taskName: aTaskName;
	taskDescription: aTaskDescription;
	userName: aUserName;
	groupName: aGroupName;
	yourself
]

{ #category : #'as yet unclassified' }
NewWaveDOProcessJSONExporter class >> dataObject: do task: aTask process: aProcess [
	^ self new
	do: do;
	task: aTask;
	process: aProcess;
	yourself
]

{ #category : #accessing }
NewWaveDOProcessJSONExporter >> collectInstVars [
	^ do class instVarNames
]

{ #category : #initialization }
NewWaveDOProcessJSONExporter >> createClassContainer [
	| container |
	container := NewWaveDOClassDescription new.
	container className: do class name. 
	container addAllToProps: self eximplify.
	container processName: processName.
	container processId: processId.
	container processInstanceId: processInstanceId.
	container taskName: taskName.
	container taskDescription: taskDescription.
	container userName: userName.
	container groupName: groupName.
	container taskId: taskId.
	^ container
]

{ #category : #accessing }
NewWaveDOProcessJSONExporter >> do [
	^ do
]

{ #category : #accessing }
NewWaveDOProcessJSONExporter >> do: anObject [
	do := anObject
]

{ #category : #initialization }
NewWaveDOProcessJSONExporter >> eximplify [
	^ self collectInstVars collect: [ :each | 
		| desc |
		desc := NewWaveDOPropertyDescription new.
		desc varName: each.
		desc varValue: (do instVarNamed: each).
		desc varType: (do instVarNamed: each) class asString.  
		desc
	].
]

{ #category : #initialization }
NewWaveDOProcessJSONExporter >> exportDOToJSON [
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

{ #category : #accessing }
NewWaveDOProcessJSONExporter >> groupName [
	^ groupName
]

{ #category : #accessing }
NewWaveDOProcessJSONExporter >> groupName: anObject [
	groupName := anObject
]

{ #category : #initialization }
NewWaveDOProcessJSONExporter >> initialize [ 
	super initialize.
	
]

{ #category : #accessing }
NewWaveDOProcessJSONExporter >> processId [
	^ processId
]

{ #category : #accessing }
NewWaveDOProcessJSONExporter >> processId: anObject [
	processId := anObject
]

{ #category : #accessing }
NewWaveDOProcessJSONExporter >> processInstanceId [
	^ processInstanceId
]

{ #category : #accessing }
NewWaveDOProcessJSONExporter >> processInstanceId: anObject [
	processInstanceId := anObject
]

{ #category : #accessing }
NewWaveDOProcessJSONExporter >> processName [
	^ processName
]

{ #category : #accessing }
NewWaveDOProcessJSONExporter >> processName: anObject [
	processName := anObject
]

{ #category : #accessing }
NewWaveDOProcessJSONExporter >> taskDescription [
	^ taskDescription
]

{ #category : #accessing }
NewWaveDOProcessJSONExporter >> taskDescription: anObject [
	taskDescription := anObject
]

{ #category : #accessing }
NewWaveDOProcessJSONExporter >> taskId [
	^ taskId
]

{ #category : #accessing }
NewWaveDOProcessJSONExporter >> taskId: anObject [
	taskId := anObject
]

{ #category : #accessing }
NewWaveDOProcessJSONExporter >> taskName [
	^ taskName
]

{ #category : #accessing }
NewWaveDOProcessJSONExporter >> taskName: anObject [
	taskName := anObject
]

{ #category : #accessing }
NewWaveDOProcessJSONExporter >> userName [
	^ userName
]

{ #category : #accessing }
NewWaveDOProcessJSONExporter >> userName: anObject [
	userName := anObject
]
