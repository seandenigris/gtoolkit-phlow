Class {
	#name : #GtPhlowSyncUpdateDefinition,
	#superclass : #Object,
	#instVars : [
		'announcementValuable',
		'announcerValuable'
	],
	#category : #'GToolkit-Phlow-Support'
}

{ #category : #accessing }
GtPhlowSyncUpdateDefinition >> announcement [
	^ announcementValuable value
]

{ #category : #accessing }
GtPhlowSyncUpdateDefinition >> announcement: aValuable [
	announcementValuable := aValuable
]

{ #category : #subscriptions }
GtPhlowSyncUpdateDefinition >> announcementHandlerFor: aGtPhlowElementContext [
	^ [ aGtPhlowElementContext syncUpdate ]
]

{ #category : #accessing }
GtPhlowSyncUpdateDefinition >> announcer [
	^ announcerValuable value
]

{ #category : #accessing }
GtPhlowSyncUpdateDefinition >> announcer: aValuable [
	announcerValuable := aValuable
]

{ #category : #subscriptions }
GtPhlowSyncUpdateDefinition >> subscribeOn: aGtPhlowElementContext [
	| aSubscription |
	aSubscription := self announcer 
		when: self announcement 
		do: (self announcementHandlerFor: aGtPhlowElementContext).
	aSubscription subscriber: aGtPhlowElementContext.
]

{ #category : #subscriptions }
GtPhlowSyncUpdateDefinition >> unsubscribeOn: aGtPhlowElementContext [
	self announcer unsubscribe: aGtPhlowElementContext
]