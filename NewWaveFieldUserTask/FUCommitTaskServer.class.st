Class {
	#name : #FUCommitTaskServer,
	#superclass : #Object,
	#category : #'NewWaveFieldUserTask-Server'
}

{ #category : #'as yet unclassified' }
FUCommitTaskServer >> commitTask: json [
	| resp |
	"resp := ZnClient new
		systemPolicy;
  		forJsonREST;
  		url: 'http://localhost:8088/'; 
   		contents: json;
   		post.
	^ resp  "
	resp := ZnClient new
  		url: 'http://localhost:8081/addNewEntity'; 
   		contents: json;
   		post.
	^ resp.
	
]

{ #category : #initialization }
FUCommitTaskServer >> initialize [ 	
	super initialize 
]
