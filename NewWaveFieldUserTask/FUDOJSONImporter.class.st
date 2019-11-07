Class {
	#name : #FUDOJSONImporter,
	#superclass : #Object,
	#instVars : [
		'do'
	],
	#category : #'NewWaveFieldUserTask-ObjectPreparator'
}

{ #category : #'as yet unclassified' }
FUDOJSONImporter >> importFromJSON: json [ 
	| t |
	t := 	(NeoJSONReader on: json readStream) 
		mapAllInstVarsFor: FUDOPropertyDescription ;
		mapAllInstVarsFor: FUDOClassDescription;
		for: #ArrayOfFUDOPropertyDescription customDo: [ :mapping |
			mapping listOfElementSchema: FUDOPropertyDescription  ];
		for: FUDOClassDescription do: [ :mapping | 
			(mapping mapInstVar: #properties) valueSchema: #ArrayOfFUDOPropertyDescription.
		];
		nextAs: FUDOClassDescription.
	^ t.
]
