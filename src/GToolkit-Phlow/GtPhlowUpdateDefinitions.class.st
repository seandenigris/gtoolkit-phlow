Class {
	#name : #GtPhlowUpdateDefinitions,
	#superclass : #Object,
	#instVars : [
		'definitions'
	],
	#category : #'GToolkit-Phlow-Support'
}

{ #category : #adding }
GtPhlowUpdateDefinitions >> add: aDefinition [
	self definitions add: aDefinition
]

{ #category : #adding }
GtPhlowUpdateDefinitions >> asyncWhen: anAnnouncement in: anAnnouncer [
	self add: (GtPhlowAsyncUpdateDefinition new
		announcement: anAnnouncement;
		announcer: anAnnouncer)
]

{ #category : #accessing }
GtPhlowUpdateDefinitions >> definitions [
	^ definitions
]

{ #category : #accessing }
GtPhlowUpdateDefinitions >> definitions: anObject [
	definitions := anObject
]

{ #category : #initialization }
GtPhlowUpdateDefinitions >> initialize [
	super initialize.
	definitions := OrderedCollection new: 1.
]

{ #category : #subscriptions }
GtPhlowUpdateDefinitions >> subscribeAutoUpdatesOn: aGtPhlowElementContext [
	self definitions do: [ :eachDefinition | 
		eachDefinition subscribeOn: aGtPhlowElementContext ]
]

{ #category : #adding }
GtPhlowUpdateDefinitions >> syncWhen: anAnnouncement in: anAnnouncer [
	self add: (GtPhlowUpdateDefinition new
		announcement: anAnnouncement;
		announcer: anAnnouncer)
]

{ #category : #subscriptions }
GtPhlowUpdateDefinitions >> unsubscribeAutoUpdatesOn: aGtPhlowElementContext [
	self definitions do: [ :eachDefinition | 
		eachDefinition unsubscribeOn: aGtPhlowElementContext ]
]