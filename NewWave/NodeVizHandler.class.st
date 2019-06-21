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
	#category : #'NewWave-Visualization'
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

	| v eventShapes taskShapes gateShapes elements elements2 elements3 lineShape |
	v := RTView new.
	eventShapes := (RTEllipse new size: 100; color: Color red trans) + RTLabel.
	taskShapes := (RTRoundedBox new size: 100; color: Color orange trans; borderRadius: 15) + RTLabel.
	gateShapes := (RTPolygon new vertices: (Array with: 200 @ 0 with: 300 @ 100 with: 200 @ 200 with: 100 @ 100)) + RTLabel.
	gateShapes := (RTPolygon new vertices: (Array with: 200 @ 0 with: 300 @ 100 with: 200 @ 200 with: 100 @ 100)) + RTLabel.
	gateShapes := (RTPolygon new vertices: (Array with: 0 @ 0 with: 70 @ 50 with: 0 @ 100 with: -70 @ 50)) + RTLabel.
	
	gateShapes color: Color blue trans.
	
	elements := taskShapes elementsOn: tasks.
	elements2 := gateShapes elementsOn: gates.
	elements3 := eventShapes elementsOn: events.
	
	v addAll: elements.
	v addAll: elements2.
	v addAll: elements3.
	
	elements @ RTPopup @ RTDraggable.
	elements2 @ RTPopup @ RTDraggable.
	elements3 @ RTPopup @ RTDraggable.
	
	lineShape := (RTLine new
				attachPoint: RTShorterDistanceAttachPoint new;
				color: Color veryDarkGray)
			+
					(RTSimpleArrowHead new
						attachPoint: RTShorterDistanceAttachPoint new;
						color: Color veryDarkGray).
	

	RTEdgeBuilder new
		view: v;
		objects: nodes;
		shape: lineShape;
		connectFrom: #yourself 
		toAll: [  
		:e |
			e logCr.
			nodes := OrderedCollection new. 
			e outgoingFlows ifNotEmpty: [ 
				e outgoingFlows do: [ :h | 
					nodes add: h targetRef  ].
				nodes.
			].
		
		].
		

	RTHorizontalTreeLayout on: v elements.
	view := v
]

{ #category : #initialization }
NodeVizHandler >> events [
	^ events
]

{ #category : #initialization }
NodeVizHandler >> gates [
 ^ gates
]

{ #category : #initialization }
NodeVizHandler >> initialize [ 
	super initialize.
	tasks := OrderedCollection new.
	gates := OrderedCollection new.
	events := OrderedCollection new.
	view := RTView new.
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
