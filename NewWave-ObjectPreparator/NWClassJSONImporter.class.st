Class {
	#name : #NWClassJSONImporter,
	#superclass : #Object,
	#category : #'NewWave-ObjectPreparator'
}

{ #category : #accessing }
NWClassJSONImporter >> importFromJSON: json [
	| t |
	t := (NeoJSONReader on: json readStream)
		mapAllInstVarsFor: NewWaveDOPropertyDescription;
		mapAllInstVarsFor: NewWaveDOClassDescription;
		mapAllInstVarsFor: NWMagritteDescriptionWrapper;
		for: #ArrayOfNewWaveDOClassDescription
			customDo:
				[ :mapping | mapping listOfElementSchema: NewWaveDOClassDescription ];
		for: #ArrayOfNewWaveDOPropertyDescription
			customDo:
				[ :mapping | mapping listOfElementSchema: NewWaveDOPropertyDescription ];
		for: #ArrayOfNWMagritteDescriptionWrappers
			customDo:
				[ :mapping | mapping listOfElementSchema: NWMagritteDescriptionWrapper ];
		for: NewWaveDOClassDescription
			do: [ :mapping | 
			(mapping mapInstVar: #properties)
				valueSchema: #ArrayOfNewWaveDOPropertyDescription.
			(mapping mapInstVar: #complexProperties)
				valueSchema: #ArrayOfNewWaveDOClassDescription.
			(mapping mapInstVar: #magritteDescriptions)
				valueSchema: #ArrayOfNWMagritteDescriptionWrappers  ];
		nextAs: #ArrayOfNewWaveDOClassDescription.
	^ t
]

{ #category : #'as yet unclassified' }
NWClassJSONImporter >> importObjectFromJSON: json [
	| t |
	t := (NeoJSONReader on: json readStream)
		mapAllInstVarsFor: NewWaveDOPropertyDescription;
		mapAllInstVarsFor: NewWaveDOClassDescription;
		mapAllInstVarsFor: NWMagritteDescriptionWrapper;
		for: #ArrayOfNewWaveDOPropertyDescription
			customDo: [ :mapping | mapping listOfElementSchema: NewWaveDOPropertyDescription ];
		for: #ArrayOfNewWaveDOClassDescription
			customDo: [ :mapping | mapping listOfElementSchema: NewWaveDOClassDescription ];
		for: #ArrayOfNWMagritteDescriptionWrappers
			customDo:
				[ :mapping | mapping listOfElementSchema: NWMagritteDescriptionWrapper ];		
		for: NewWaveDOClassDescription
			do: [ :mapping |
				(mapping mapInstVar: #properties) valueSchema: #ArrayOfNewWaveDOPropertyDescription.
				(mapping mapInstVar: #complexProperties) valueSchema: #ArrayOfNewWaveDOClassDescription.
				(mapping mapInstVar: #magritteDescriptions) valueSchema: #ArrayOfNWMagritteDescriptionWrappers. ];
		nextAs: NewWaveDOClassDescription.
	^ t
]
