"
I am a class which simply import one DataObject from JSON.
"
Class {
	#name : #NewWaveDOJSONImporter,
	#superclass : #Object,
	#instVars : [
		'do'
	],
	#category : #'NewWave-ObjectPreparator'
}

{ #category : #accessing }
NewWaveDOJSONImporter >> importFromJSON: json [

| t |
t := 	(NeoJSONReader on: json readStream) 
		mapAllInstVarsFor: NewWaveDOPropertyDescription ;
		mapAllInstVarsFor: NewWaveDOClassDescription;
		for: #ArrayOfNewWaveDOPropertyDescription customDo: [ :mapping |
			mapping listOfElementSchema: NewWaveDOPropertyDescription  ];
		for: NewWaveDOClassDescription do: [ :mapping | 
			(mapping mapInstVar: #properties) valueSchema: #ArrayOfNewWaveDOPropertyDescription.
		];
		nextAs: NewWaveDOClassDescription.
^ t.
]
