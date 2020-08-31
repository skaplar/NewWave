Class {
	#name : #NewWaveClassJSONExporterTest,
	#superclass : #TestCase,
	#category : #'NewWave-ObjectPreparator-Tests'
}

{ #category : #tests }
NewWaveClassJSONExporterTest >> testNWClassDescriptionsExportToJsonClassAccess [

	| exp |
	exp := NWClassJSONExporter new.
	exp addObjectAndCreateClassDescription: Adresa example3.
	self assert: (exp nwClassDescriptions at: 1) class asString equals: 'NewWaveDOClassDescription'.
	
]

{ #category : #tests }
NewWaveClassJSONExporterTest >> testNWClassDescriptionsExportToJsonComplexProperties [

	| exp classDescription |
	exp := NWClassJSONExporter new.
	exp addObjectAndCreateClassDescription: Adresa example3.
	classDescription := exp nwClassDescriptions at: 1.
	self assert: classDescription complexProperties size equals: 1.
	
]

{ #category : #tests }
NewWaveClassJSONExporterTest >> testNWClassDescriptionsExportToJsonComplexPropertiesType [

	| exp classDescription |
	exp := NWClassJSONExporter new.
	exp addObjectAndCreateClassDescription: Adresa example3.
	classDescription := exp nwClassDescriptions at: 1.
	self assert: (classDescription complexProperties at: 1) className1 asString equals: 'NWArea'.
	
]

{ #category : #tests }
NewWaveClassJSONExporterTest >> testNWClassDescriptionsExportToJsonProperties [

	| exp classDescription |
	exp := NWClassJSONExporter new.
	exp addObjectAndCreateClassDescription: Adresa example3.
	classDescription := exp nwClassDescriptions at: 1.
	self assert: classDescription properties size equals: 4.
	
]

{ #category : #tests }
NewWaveClassJSONExporterTest >> testNWClassDescriptionsExportToJsonSize [

	| exp |
	exp := NWClassJSONExporter new.
	exp addObjectAndCreateClassDescription: Adresa example3.
	self assert: exp nwClassDescriptions size equals: 1.
	
]
