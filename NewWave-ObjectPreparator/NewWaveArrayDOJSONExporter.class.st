"
I am a class that is used to export Array of NewWaveDOClassDescription. I am used by the server to export necesserary data to the endpoint. I work with NWTaskWrapper classes. NWTaskWrapper bundles task and process info in one place.

"
Class {
	#name : #NewWaveArrayDOJSONExporter,
	#superclass : #Object,
	#instVars : [
		'classDescriptions'
	],
	#category : #'NewWave-ObjectPreparator'
}

{ #category : #'as yet unclassified' }
NewWaveArrayDOJSONExporter class >> nwClassDescriptions: classDescriptions [
	^ self new
	classDescriptions: classDescriptions;
	yourself
]

{ #category : #accessing }
NewWaveArrayDOJSONExporter >> classDescriptions [
	^ classDescriptions
]

{ #category : #accessing }
NewWaveArrayDOJSONExporter >> classDescriptions: anObject [
	classDescriptions := anObject
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
				nextPut: self classDescriptions].
	Transcript show: t.
	^ t.
]

{ #category : #initialization }
NewWaveArrayDOJSONExporter >> initialize [ 
	super initialize.
	
]
