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
				package: 'NewWave-Model';
				package: 'NewWave-Core';
				package: 'NewWave-Engine';
				package: 'NewWave-Announcers';
				package: 'NewWave-Tests';
				package: 'NewWave-Example'	
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
