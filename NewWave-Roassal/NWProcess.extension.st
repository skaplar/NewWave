Extension { #name : #NWProcess }

{ #category : #'*NewWave-Roassal' }
NWProcess >> allFlowElements [ 
	| seen toProcess element |
	seen := OrderedCollection new.
	toProcess := OrderedCollection new.
	toProcess add: initialFlowElement.
	seen add: initialFlowElement.
	[ toProcess size isZero ] whileFalse: [ 
		element := toProcess removeFirst. 
		element outgoingFlows do: [:nextElement |
			(seen includes: nextElement) ifFalse: [
				seen add: nextElement.
				toProcess add: nextElement ] ]].
	^ seen 
	
]

{ #category : #'*NewWave-Roassal' }
NWProcess >> inspectionWorkflow [
	<inspectorPresentationOrder: 0 title: 'workflow'>
	
	^ SpRoassalPresenter new 
		script: self workflowRoassalScript
		yourself
]

{ #category : #'*NewWave-Roassal' }
NWProcess >> workflowRoassalScript [
	^ [ :canvas | | nodes allNodes |
		allNodes := self allFlowElements.
		nodes := allNodes select: [ :each | each respondsTo: #basetype ].
		nodes do: [ :node | | element |
			
		(node basetype = #Event) ifTrue: [  
			element := RSEllipse new 
				size: 100; 
				color: (Color red alpha: 0.5);
				model: node;
				yourself.
			element @ RSLabeled @ RSDraggable @ RSPopup.
			canvas add: element ].
	
		(node basetype = #Activity) ifTrue: [  
			element := RSBox new 
				size: 100;
				color: (Color orange alpha: 0.5);
				cornerRadius: 15;
				model: node;
				yourself.
			element @ RSLabeled @ RSPopup @ RSDraggable.
			canvas add: element.
		].

		(node basetype = #Gateway) ifTrue: [  
			element := RSPolygon new
				points: (Array with: 0 @ 0 with: 70 @ 50 with: 0 @ 100 with: -70 @ 50);
				color: (Color blue alpha: 0.5);
				model: node;
				yourself.
			element @ RSLabeled @ RSPopup @ RSDraggable.
			canvas add: element ].
			
		RSEdgeBuilder arrowedLine
			canvas: canvas;
			objects: allNodes;
			withBorderAttachPoint;
			connectFrom: #yourself 
			toAll: [ :e |
				e outgoingFlows collect: #targetRef ].
		

		RSHorizontalTreeLayout on: canvas nodes.
		canvas @ RSCanvasController.
		canvas  ]]
]
