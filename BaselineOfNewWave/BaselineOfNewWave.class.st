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
			self taskIt: spec.
			self teapot: spec.
			"self scheduler: spec."
			self scheduler2: spec.
			self seaside: spec.
			self bootstrap: spec.
			self magritte: spec.
			self neoJson: spec.
			self zinc: spec.

			"Packages"
			spec package: 'NewWave' with: [spec requires: #(TaskIt Scheduler)].
			spec package: 'NewWaveFieldUserTask' with: [spec requires: #(Core ZincHTTPComponents NeoJSON Magritte Seaside3 Bootstrap 'NewWave-Server')].
			spec
				package: 'NewWave-Server'
				with: [ spec requires: #(NewWave Teapot) ].
			spec package: 'NewWave-Plugin'.
			"Groups"
			spec group: 'Core' with: #(NewWave).
			spec group: 'TeapotServer' with: #(Core Teapot).
			spec
				group: 'All'
				with: #(Core TeapotServer 'NewWave-Plugin') ]
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
				repository: 'github://magritte-metamodel/magritte:master/source' ]
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
			spec repository: 'github://svenvc/zinc:master/repository'
		 ]
]
