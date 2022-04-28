Class {
	#name : #AnnouncementReactionTask,
	#superclass : #NWUserTask,
	#category : #'NewWave-Core-Model'
}

{ #category : #accessing }
AnnouncementReactionTask >> initialize [
	super initialize.
	
]

{ #category : #accessing }
AnnouncementReactionTask >> value [ 
	result := 'Manual Task Executed'.
	self complete.
	
]
