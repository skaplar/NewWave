Extension { #name : #WaveEngine }

{ #category : #'*NewWave-Server' }
WaveEngine >> server [ 
	^ pluginData at: #NewWaveServer.
]

{ #category : #'*NewWave-Server' }
WaveEngine >> startTeapotServer [
	pluginData
		at: #NewWaveServer
		put: (NewWaveServer serveOn: 8081 waveEngine: self)
]
