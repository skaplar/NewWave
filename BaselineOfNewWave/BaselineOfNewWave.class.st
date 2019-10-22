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
		do: [ 
			"Dependencies"
			self taskIt: spec.
			"self scheduler: spec."
			self scheduler2: spec.
			"Packages"
			spec
				package: 'NewWave'
		]
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
BaselineOfNewWave >> taskIt: spec [
	spec 
		baseline: 'TaskIt'
		with: [ 
			spec repository: 'github://sbragagnolo/taskit:v1.0.2'
		 ]
]
