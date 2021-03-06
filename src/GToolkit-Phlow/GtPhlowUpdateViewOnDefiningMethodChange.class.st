"
I listen to system changes.
I udpate a ${class:GtPhlowView}$ and a corresponsind ${class:BlElement}$ on view definition change.
See ${class:GtPhlowUpdateView}$ for more details.

"
Class {
	#name : #GtPhlowUpdateViewOnDefiningMethodChange,
	#superclass : #GtPhlowSystemChangeUpdateDefinition,
	#category : #'GToolkit-Phlow-Updating'
}

{ #category : #'announcement handling' }
GtPhlowUpdateViewOnDefiningMethodChange >> handleMethodModifiedAnnouncement: aMethodModified [ 
	self hasContexts ifFalse: [ ^ self ].
	self hasDefiningMethod ifFalse: [ ^ self ].
	(self definingMethod gtPhlowIncludesCompiledMethod: aMethodModified methodAffected)
		ifFalse: [ ^ self ].
	self updatePhlowViews.
]

{ #category : #subscriptions }
GtPhlowUpdateViewOnDefiningMethodChange >> subscribeOn: aGtPhlowElementContext [
	self hasDefiningMethod ifFalse: [ ^ self ].
	self addContext: aGtPhlowElementContext.
	self setSubscribedIfAlreadySubscribedDo: [ ^ self ].
	self
		subscribeAnnouncement: MethodModified
		send: #handleMethodModifiedAnnouncement:
		subscriber: self
]

{ #category : #updating }
GtPhlowUpdateViewOnDefiningMethodChange >> updatePhlowView: aGtPhlowElementContext [
	self scheduleTask: (GtPhlowUpdateView new
		elementContext: aGtPhlowElementContext)
]

{ #category : #updating }
GtPhlowUpdateViewOnDefiningMethodChange >> updatePhlowViews [
	self contexts do: [ :eachContext | 
		eachContext hasBuildContext ifTrue: [ 
			self updatePhlowView: eachContext ] ].
]
