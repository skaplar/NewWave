Class {
	#name : #FUGetTaskServer,
	#superclass : #Object,
	#category : #'NewWaveFieldUserTask-Server'
}

{ #category : #'as yet unclassified' }
FUGetTaskServer >> getTask: aUser [
	| resp |
	resp := ZnClient new
  		url: 'http://localhost:8088/'; "port needs to be changed"
		"formAt: 'username' put: aUser;"
   		get;
   		response.
	^ resp entity string 
]

{ #category : #'as yet unclassified' }
FUGetTaskServer >> getTaskTest: aUser [
	|adresica json aa imp mag|
	adresica := Adresa new ulica: 'Radnicka'; broj: '3'."<-nepotrebno"

	json := (FUDOJSONExporter dataObject: adresica) exportDOToJSON."<-nepotrebno"
	imp := FUDOJSONImporter new importFromJSON: json."<-pretvara json koji je dobio u FUDOClassDescription objekat"
	^ imp
]

{ #category : #initialization }
FUGetTaskServer >> initialize [ 	
	super initialize 
]
