"
I am a copy of class NewWaveDOJSONExporter. This comment is copied from there, and might not be entirely accurate

I am a class which simply export one DataObject into JSON.
"
Class {
	#name : #NWClassJSONExporter,
	#superclass : #Object,
	#instVars : [
		'nwClassDescriptions'
	],
	#category : #'NewWave-ObjectPreparator'
}

{ #category : #'as yet unclassified' }
NWClassJSONExporter class >> dataObject: do [
	^ self new
	do: do;
	yourself
]

{ #category : #'as yet unclassified' }
NWClassJSONExporter class >> withClassDescriptions: nwClassDescriptions [ 
	^ self new
	addAllToClassDescriptions: nwClassDescriptions;
	yourself
]

{ #category : #adding }
NWClassJSONExporter >> addAllToClassDescriptions: tmpClassDescriptions [
	nwClassDescriptions addAll: tmpClassDescriptions.
	
]

{ #category : #adding }
NWClassJSONExporter >> addObjectAndCreateClassDescription: anObject [
	| nwClassDecsription |
	nwClassDecsription := NWClassDescriptionGenerator dataObject: anObject.
	nwClassDescriptions add: nwClassDecsription createClassDescription.
	
]

{ #category : #adding }
NWClassJSONExporter >> addObjectAndExportOne: anObject [
	| nwClassDecsription |
	nwClassDecsription := NWClassDescriptionGenerator dataObject: anObject.
	^ self exportOneNWClassDescriptionToJSON: nwClassDecsription createClassDescription.
	
]

{ #category : #initialization }
NWClassJSONExporter >> exportNWClassDescriptionToJSON [
	| t |
	t := String
		streamContents: [ :out | 
			(NeoJSONWriter on: out)
				prettyPrint: true;
				asciiOnly: true;
				mapInstVarsFor: NewWaveDOClassDescription;
				nextPut: nwClassDescriptions].
	Transcript show: t.
	^ t.
]

{ #category : #initialization }
NWClassJSONExporter >> exportOneNWClassDescriptionToJSON: anObject [
	| t |
	t := String
		streamContents: [ :out | 
			(NeoJSONWriter on: out)
				prettyPrint: true;
				asciiOnly: true;
				mapInstVarsFor: NewWaveDOClassDescription;
				nextPut: anObject].
	Transcript show: t.
	^ t.
]

{ #category : #initialization }
NWClassJSONExporter >> initialize [ 
	super initialize.
	nwClassDescriptions := OrderedCollection new.
]
