"
I am a class that represents the engine of the workflow. Execution is started through this class by calling message startEngine which accesses the main executor.
Engine contains one main executor and other subexecutors (depending on the model) and a system of announcers which announnces when something happens during execution.

We create engine using, and then provide it with main executor. Main executor needs the node from which he will start executing. We start the execution by simply calling startEngine. 

start := StartEvent new.
start description: 'StartEvent'.

end := EndEvent new.
end description: 'End Event ee'.

seq1 := Sequence source: start target: end.
start addOutgoingFlow: seq1.
end addIncomingFlow: seq1. 

engine := WaveEngine new.
we := WaveExecutor initialNode: start.
engine addExecutor: we.
engine startEngine.

Internal Representation and Key Implementation Points.

Instance Variables
	engineAnnouncer: Announcer for receiving announcements in the engine (eg. joinCompleted)
	joinHandler:		JoinHandler for handling joins in the engine
	mainExecutor:		WaveExecutor for performing main execution
	subExecutors:		SubExecutor for spawning new subexecutors (type of WaveExecutor)


    Implementation Points
"
Class {
	#name : #WaveEngine,
	#superclass : #Object,
	#instVars : [
		'engineAnnouncer',
		'scheduler',
		'pluginData',
		'processHandlers'
	],
	#category : #'NewWave-Engine'
}

{ #category : #'as yet unclassified' }
WaveEngine class >> initialNode: startNode [
	| we | 
	we := NWExecutor initialNode: startNode.
	^ self new 
		addExecutor: we;
		yourself.
]

{ #category : #'as yet unclassified' }
WaveEngine class >> initialProcess: aProcess [
	| we | 
	we := NWExecutor initialNode: aProcess initialFlowElement.
	^ self new 
		addExecutor: we;
		process: aProcess;
		yourself.
]

{ #category : #adding }
WaveEngine >> addProcess: aProcess name: aProcessName [
	| processHandler |
	processHandler := NWProcessHandler initialProcess: aProcess engine: self.
	processHandlers at: aProcessName put: processHandler. 
]

{ #category : #accessing }
WaveEngine >> engineAnnouncer [
	^ engineAnnouncer 
]

{ #category : #accessing }
WaveEngine >> engineAnnouncer: anAnnouncer [
	engineAnnouncer := anAnnouncer 
]

{ #category : #adding }
WaveEngine >> findManagementByProcessId: aProcessId [
	"In order to find the management, first we find the appropriate management name, then we use the user management to find the user management class."
	| managmentName |
	self deprecated: 'should not be used until multiple groups are ready'.
	
	managmentName := self findManagementNameByProcessId: aProcessId.
	self userManagement findUserManagementByName: managmentName.
]

{ #category : #adding }
WaveEngine >> findManagementNameByProcessId: aProcessId [
	"When sending a request from the server we get the processId, and we use it to find the appropriate process handler, and it's managementName"
	self deprecated: 'should not be used until multiple groups are ready'.
	processHandlers values detect: [ :each | (each process id) = aProcessId ] ifFound: [ :processHandler | ^ processHandler process managementName ] 
]

{ #category : #accessing }
WaveEngine >> initialize [
	super initialize.
	self engineAnnouncer: Announcer new.
	pluginData := Dictionary new.
	processHandlers := Dictionary new.
	"scheduler := TaskScheduler new."
	"scheduler start."
]

{ #category : #finalization }
WaveEngine >> processHandler: aProcessName [
	^ processHandlers at: aProcessName.
]

{ #category : #adding }
WaveEngine >> reExecuteProcess: aProcessName [
	| processHandler process |
	process := (processHandlers at: aProcessName) process.
	processHandler := NWProcessHandler initialProcess: process engine: self.
	processHandlers at: aProcessName put: processHandler. 
	processHandler startEngine.
]

{ #category : #adding }
WaveEngine >> restartProcess: aProcessName newProcess: proc1 [
	| processHandler |
	processHandler := NWProcessHandler initialProcess: proc1 engine: self.
	processHandlers at: aProcessName put: processHandler. 
	processHandler startEngine.
]

{ #category : #accessing }
WaveEngine >> scheduler [
	^ scheduler
]

{ #category : #adding }
WaveEngine >> startProcess: aProcessName [
	| processHandler |
	processHandler := processHandlers at: aProcessName.
	processHandler startEngine.
]

{ #category : #adding }
WaveEngine >> stopProcess: aProcessName [
	| processHandler |
	processHandler := processHandlers at: aProcessName.
	processHandler stopEngine.
]
