Class {
	#name : #FUApplicationRootComponent,
	#superclass : #WAComponent,
	#instVars : [
		'main'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #testing }
FUApplicationRootComponent class >> canBeRoot [
	^ true

]

{ #category : #'class initialization' }
FUApplicationRootComponent class >> initialize [
"self initialize"
	| app |
	app := WAAdmin register: self asApplicationAt: 'NewWave-Engine'.
	app
		preferenceAt: #sessionClass put: FUSession.
	app
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: TBSDeploymentLibrary

]

{ #category : #hooks }
FUApplicationRootComponent >> children [
	^ { main }
]

{ #category : #initialization }
FUApplicationRootComponent >> initialize [
	super initialize.
	main := FUSignInComponent new
]

{ #category : #rendering }
FUApplicationRootComponent >> renderContentOn: html [
	html render: main
]

{ #category : #updating }
FUApplicationRootComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'NewWave - process engine'
]
