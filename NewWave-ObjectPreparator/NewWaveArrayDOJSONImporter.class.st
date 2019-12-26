"
I am a copy of class NewWaveDOJSONImporter. This comment is copied from there, and might not be entirely accurate

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
	#name : #NewWaveArrayDOJSONImporter,
	#superclass : #Object,
	#instVars : [
		'do'
	],
	#category : #'NewWave-ObjectPreparator'
}

{ #category : #accessing }
NewWaveArrayDOJSONImporter >> importFromJSON: json [

| t |
t := 	(NeoJSONReader on: json readStream) 
		mapAllInstVarsFor: NewWaveDOPropertyDescription ;
		mapAllInstVarsFor: NewWaveDOClassDescription;
		for: #ArrayOfNewWaveDOClassDescription customDo: [  :mapping |
			mapping listOfElementSchema: NewWaveDOClassDescription  
			];
		for: #ArrayOfNewWaveDOPropertyDescription customDo: [ :mapping |
			mapping listOfElementSchema: NewWaveDOPropertyDescription  ];
		for: NewWaveDOClassDescription do: [ :mapping | 
			(mapping mapInstVar: #properties) valueSchema: #ArrayOfNewWaveDOPropertyDescription.
		];
		nextAs: #ArrayOfNewWaveDOClassDescription.
^ t.
]
