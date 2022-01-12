Class {
	#name : #BaselineOfNewWave,
	#superclass : #BaselineOf,
	#category : #BaselineOfNewWave
}

{ #category : #baselines }
BaselineOfNewWave >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ "Dependencies"
			self teapot: spec.
			"self scheduler: spec."
			self scheduler2: spec.
			self seaside: spec.
			self bootstrap: spec.
			self magritte: spec.
			self neoJson: spec.
			self zinc: spec.

			"Packages"
			spec 
				package: 'NewWave' 
				with: [ spec requires: #(Scheduler) ].
			
			spec package: 'NewWave-Plugin'.
			spec 
				package: 'NewWave-ObjectPreparator' 
				with: [ spec requires: #(NewWave) ].
			spec 
				package: 'NewWaveFieldUserTask' 
				with: [ spec requires: #(ZincHTTPComponents Core 'NewWave-ObjectPreparator' NeoJSON Magritte Seaside3 Bootstrap 'NewWave-Server') ].
			spec
				package: 'NewWave-Roassal'
				with: [ spec requires: #(NewWave) ].
			spec
				package: 'NewWave-Server'
				with: [ spec requires: #(NewWave Teapot) ].
				
			"Groups"
			spec group: 'default' with: #(All).
			spec group: 'Core' with: #(NewWave).
			spec group: 'WebTask' with: #( 'NewWaveFieldUserTask' ).
			spec group: 'TeapotServer' with: #(Core Teapot).
			spec group: 'Visualization' with: #(Core 'NewWave-Roassal').
			spec
				group: 'All'
				with: #(Core TeapotServer 'NewWave-Plugin' WebTask Visualization) ].
	spec
		for: #(#'pharo7.x' #'pharo8.x')
		do: [  
			self taskIt: spec.
			spec package: 'NewWave' with: [ spec requires: #(TaskIt) ].
			self roassal: spec.
			spec package: 'NewWave-Roassal' with: [ spec requires: #(Roassal3) ].].

]

{ #category : #accessing }
BaselineOfNewWave >> bootstrap: spec [
	spec 
		baseline: 'Bootstrap'
		with: [ 
			spec repository: 'github://astares/Seaside-Bootstrap:master/src'
		 ]
]

{ #category : #accessing }
BaselineOfNewWave >> magritte: spec [
	spec 
		baseline: 'Magritte'
		with: [ 
			spec 
				loads: #( Seaside );
				repository: 'github://skaplar/magritte:master/source' ]

]

{ #category : #accessing }
BaselineOfNewWave >> neoJson: spec [
	spec 
		baseline: 'NeoJSON' 
		with: [ 
			spec repository: 'github://svenvc/NeoJSON/repository' 
		].
]

{ #category : #accessing }
BaselineOfNewWave >> projectClass [ 
	^ MetacelloCypressBaselineProject
]

{ #category : #accessing }
BaselineOfNewWave >> roassal: spec [
	spec 
		baseline: 'Roassal3'
		with: [ 
			spec repository: 'github://ObjectProfile/Roassal3/src'
		 ]
]

{ #category : #accessing }
BaselineOfNewWave >> scheduler2: spec [
	spec 
		baseline: 'Scheduler'
		with: [ 
			spec repository: 'github://seandenigris/Scheduler:master'
		 ]
]

{ #category : #accessing }
BaselineOfNewWave >> scheduler: spec [
	spec 
		project: 'Scheduler'
		with: [ spec
			className: #ConfigurationOfScheduler;
			versionString:#'development';
			repository: 'http://smalltalkhub.com/mc/TorstenBergmann/Scheduler/main' ]
]

{ #category : #accessing }
BaselineOfNewWave >> seaside: spec [
	spec 
		baseline: 'Seaside3'
		with: [ 
			spec repository: 'github://SeasideSt/Seaside:master/repository'
		 ]
]

{ #category : #accessing }
BaselineOfNewWave >> taskIt: spec [
	spec 
		baseline: 'TaskIt'
		with: [ 
			spec repository: 'github://sbragagnolo/taskit:v1.0.2'
		 ]
]

{ #category : #accessing }
BaselineOfNewWave >> teapot: spec [
	spec 
		baseline: 'Teapot'
		with: [ 
			spec repository: 'github://zeroflag/teapot:master/source'
		 ]
]

{ #category : #accessing }
BaselineOfNewWave >> zinc: spec [
	spec 
		baseline: 'ZincHTTPComponents'
		with: [ 
			spec repository: 'github://svenvc/zinc:v3.0.1/repository'
		 ]
]
