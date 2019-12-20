Extension { #name : #WaveEngineOld }

{ #category : #'*NewWave-Server' }
WaveEngineOld >> server [ 
	^ pluginData at: #NewWaveServer.
]

{ #category : #'*NewWave-Server' }
WaveEngineOld >> startTeapotServer [
	pluginData
		at: #NewWaveServer
		put: (NewWaveServer serveOn: 8081 waveEngine: self)
]
