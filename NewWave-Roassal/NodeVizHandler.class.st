Class {
	#name : #NodeVizHandler,
	#superclass : #Object,
	#instVars : [
		'nodes',
		'events',
		'tasks',
		'gates',
		'view'
	],
	#category : #'NewWave-Roassal'
}

{ #category : #initialization }
NodeVizHandler >> createOc [

nodes do: [ :each | 
	each basetype = #Event ifTrue: [events add: each].
	each basetype = #Activity ifTrue: [tasks add: each].
	each basetype = #Gateway ifTrue: [gates add: each].
].

self createView.
]

{ #category : #initialization }
NodeVizHandler >> createView [
	| c |
	c := RSCanvas new.
	
	events do: [ :event | | e |
		e := RSEllipse new 
		size: 100; 
		color: Color red trans;
		model: event;
		yourself.
		e @ RSLabeled @ RSDraggable @ RSPopup.
		c add: e ].
	
	tasks do: [ :task | | e |
		e := RSBox new 
			size: 100;
			color: Color orange trans;
			cornerRadius: 15;
			model: task;
			yourself.
		e @ RSLabeled @ RSPopup @ RSDraggable.
		c add: e.
		].

	gates do: [ :gate | | e |
		e := RSPolygon new
			points: (Array with: 0 @ 0 with: 70 @ 50 with: 0 @ 100 with: -70 @ 50);
			color: Color blue trans;
			yourself.
		e @ RSLabeled @ RSPopup @ RSDraggable.
		c add: e ].
			
	RSEdgeBuilder arrowedLine
		canvas: c;
		objects: nodes;
		withBorderAttachPoint;
		connectFrom: #yourself 
		toAll: [ :e |
			e logCr.
			e outgoingFlows collect: #targetRef ].
		

	RSHorizontalTreeLayout on: c nodes.
	view := c @ RSControlsCanvas 
]

{ #category : #initialization }
NodeVizHandler >> events [
	^ events
]

{ #category : #initialization }
NodeVizHandler >> gates [
 ^ gates
]

{ #category : #'as yet unclassified' }
NodeVizHandler >> gtViewWorkflowIn: composite [
	<gtInspectorPresentationOrder: 9>
	^ composite roassal2 
		title: 'Workflow';
		initializeView: [ self view ]
]

{ #category : #initialization }
NodeVizHandler >> initialize [ 
	super initialize.
	tasks := OrderedCollection new.
	gates := OrderedCollection new.
	events := OrderedCollection new.
	view := RSView new.
]

{ #category : #initialization }
NodeVizHandler >> nodes [ 
	^ nodes
]

{ #category : #initialization }
NodeVizHandler >> nodes: aNode [
	nodes := aNode
]

{ #category : #initialization }
NodeVizHandler >> tasks [
	^ tasks
]

{ #category : #initialization }
NodeVizHandler >> view [
	^ view
]
