Class {
	#name : #ExampleClass,
	#superclass : #Object,
	#instVars : [
		'announcer'
	],
	#category : #'NewWave-Example'
}

{ #category : #accessing }
ExampleClass >> announcer [ 
	^ announcer
]

{ #category : #accessing }
ExampleClass >> announcer: anObject [
	announcer := anObject 
]

{ #category : #accessing }
ExampleClass >> initialize [
	super initialize.
	self announcer: Announcer new.
]

{ #category : #accessing }
ExampleClass >> rici [
	"announcer subscribe: (ExampleAnnouncer where: [ :ann | ann parameter = 'reci' ])
	do: [ 
		:ann | ann logCr. 'pera' logCr.
	]."

	announcer subscribe: WaveAnnouncer
		do: [ :ann | ann parameter logCr. 'pera' logCr ].

"
Ovako se pokrece
| e |
e := ExampleClass new.
e rici.
e announcer announce: (ExampleAnnouncer with: 'reci')."
]
