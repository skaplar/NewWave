Class {
	#name : #FUCommitTaskServer,
	#superclass : #Object,
	#category : #'NewWaveFieldUserTask-Server'
}

{ #category : #'as yet unclassified' }
FUCommitTaskServer >> commitTask: json [
	| resp |
	resp := ZnClient new
		systemPolicy;
  		forJsonREST;
  		url: 'http://localhost:8088/'; "port needs to be changed"
   		contents: json;
   		post.
	^ resp  
	
]

{ #category : #initialization }
FUCommitTaskServer >> initialize [ 	
	super initialize 
]
