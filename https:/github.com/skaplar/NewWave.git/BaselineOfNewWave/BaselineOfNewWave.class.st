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
			
			"Packages"
			spec
				package: 'NewWave';
				package: 'NewWave-Model' with: [ spec requires: #('NewWave') ];
				package: 'NewWave-Core' with: [ spec requires: #('NewWave') ];
				package: 'NewWave-Engine' with: [ spec requires: #('NewWave') ];
				package: 'NewWave-Announcers' with: [ spec requires: #('NewWave') ];
				package: 'NewWave-Tests' with: [ spec requires: #('NewWave') ];
				package: 'NewWave-Example'	with: [ spec requires: #('NewWave') ]
		]
]

{ #category : #accessing }
BaselineOfNewWave >> projectClass [ 
	^ MetacelloCypressBaselineProject
]

{ #category : #accessing }
BaselineOfNewWave >> taskIt: spec [
	spec 
		baseline: 'TaskIt'
		with: [ 
			spec repository: 'github://sbragagnolo/taskit:v1.0'
		 ]
]
