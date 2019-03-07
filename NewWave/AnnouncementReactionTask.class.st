Class {
	#name : #AnnouncementReactionTask,
	#superclass : #UserTask,
	#category : #'NewWave-Model'
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
