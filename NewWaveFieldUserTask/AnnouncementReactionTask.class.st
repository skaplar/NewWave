Class {
	#name : #AnnouncementReactionTask,
	#superclass : #NWUserTask,
	#category : #NewWaveFieldUserTask
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
