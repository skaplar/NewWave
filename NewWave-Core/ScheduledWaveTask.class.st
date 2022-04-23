Class {
	#name : #ScheduledWaveTask,
	#superclass : #NWUserTask,
	#category : #'NewWave-Core-Model'
}

{ #category : #initialization }
ScheduledWaveTask >> initialize [
	super initialize.
	
]

{ #category : #initialization }
ScheduledWaveTask >> value [ 
	| s scheduler rc |
	scheduler := TaskScheduler new.
	scheduler start.
	rc := 0.
	
	s := Schedule starting: (DateAndTime now) duration: 30 seconds.
	s schedule: { 10 seconds}.
	scheduler do: [ 
		'Pozz' logCr. 
		rc := rc + 1. 
		rc = 2 ifTrue: [result := 'Manual Task Executed'. self complete.] 
	] following: s.
	
	

	
	
]
