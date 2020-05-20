Class {
	#name : #NewWaveClassJSONExporterTest,
	#superclass : #TestCase,
	#category : #'NewWave-ObjectPreparator-Tests'
}

{ #category : #tests }
NewWaveClassJSONExporterTest >> testNWClassDescriptionsExportToJson [

	| exp |
	exp := NWClassJSONExporter new.
	exp addObjectAndCreateClassDescription: Adresa example3.
	self assert: exp exportNWClassDescriptionToJSON equals: 
	'[
	{
		"className" : "Adresa",
		"properties" : [
			{
				"varName" : "ulica",
				"varType" : "ByteString",
				"varValue" : "Galac"
			},
			{
				"varName" : "broj",
				"varType" : "ByteString",
				"varValue" : "Osamdeset"
			},
			{
				"varName" : "id",
				"varType" : "ByteString",
				"varValue" : "2"
			}
		],
		"complexProperties" : [
			{
				"className" : "Adresa",
				"properties" : [
					{
						"varName" : "name",
						"varType" : "ByteString",
						"varValue" : "Novi Sad"
					},
					{
						"varName" : "zip",
						"varType" : "ByteString",
						"varValue" : "21000"
					}
				],
				"complexProperties" : [ ]
			}
		]
	}
]'.
]
