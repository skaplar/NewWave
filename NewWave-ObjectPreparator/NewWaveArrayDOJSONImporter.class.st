"
I am a class that is used to import Array of NewWaveDOClassDescription. I am used by the web app to import data from the endpoint. I reread everything into NewWaveDOClassDescription, and use it on the server. I use that class also to recreat dataObject which is sent here.

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
