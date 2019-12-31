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
	#name : #NewWaveDOProcessJSONExporter,
	#superclass : #Object,
	#instVars : [
		'do',
		'processName',
		'processId',
		'processInstanceId'
	],
	#category : #'NewWave-ObjectPreparator'
}

{ #category : #'as yet unclassified' }
NewWaveDOProcessJSONExporter class >> dataObject: do [
	^ self new
	do: do;
	yourself
]

{ #category : #'as yet unclassified' }
NewWaveDOProcessJSONExporter class >> dataObject: do processName: aProcessName processId: aProcessId [
	^ self new
	do: do;
	processName: aProcessName;
	processId: aProcessId;
	yourself
]

{ #category : #'as yet unclassified' }
NewWaveDOProcessJSONExporter class >> dataObject: do processName: aProcessName processId: aProcessId processInstanceId: aProcessInstanceId [
	^ self new
	do: do;
	processName: aProcessName;
	processId: aProcessId;
	processInstanceId: aProcessInstanceId;
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
