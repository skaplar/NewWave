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
				"varValue" : "Bul. Cara Lazara"
			},
			{
				"varName" : "broj",
				"varType" : "SmallInteger",
				"varValue" : 80
			},
			{
				"varName" : "id",
				"varType" : "ByteString",
				"varValue" : "2"
			},
			{
				"varName" : "grad",
				"varType" : "ByteString",
				"varValue" : "Novi Sad"
			}
		],
		"complexProperties" : [
			{
				"className" : "NWArea",
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
				"complexProperties" : [ ],
				"magritteDescriptions" : [ ]
			}
		],
		"magritteDescriptions" : [
			{
				"descriptionName" : "descriptionGrad",
				"descriptionValue" : "descriptionGrad\r\t<magritteDescription>\r\t\r\t^ MASingleOptionDescription new\r\t\toptions: #(''Novi Sad'' ''Beograd'' ''Sombor'');\r\t\treference: MAStringDescription new;\r\t\taccessor: #grad;\r\t\tlabel: ''Grad'';\r\t\tpriority: 40;\r\t\tyourself"
			},
			{
				"descriptionName" : "descriptionUlica",
				"descriptionValue" : "descriptionUlica\r  <magritteDescription>\r\t^ MAStringDescription new \r\t\taccessor: #ulica;\r\t\tlabel: ''ulica'';\r\t\tpriority: 10;\r\t\tvisible: true;\r\t\tyourself"
			},
			{
				"descriptionName" : "descriptionId",
				"descriptionValue" : "descriptionId\r  <magritteDescription>\r\t^ MAStringDescription new \r\t\taccessor: #id;\r\t\tlabel: ''id'';\r\t\tpriority: 10;\r\t\tvisible: false;\r\t\tyourself"
			},
			{
				"descriptionName" : "descriptionBroj",
				"descriptionValue" : "descriptionBroj\r  <magritteDescription>\r\t^ MAStringDescription new \r\t\taccessor: #broj;\r\t\tlabel: ''broj'';\r\t\tpriority: 10;\r\t\tvisible: true;\r\t\tyourself"
			}
		]
	}
]'.
]
