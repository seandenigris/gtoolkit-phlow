Class {
	#name : #GtPhlowTaskItView,
	#superclass : #GtPhlowProtoView,
	#instVars : [
		'originalView'
	],
	#category : #'GToolkit-Phlow-! Views'
}

{ #category : #converting }
GtPhlowTaskItView >> asElementDo: aBlock [

	| aLazyElement |

	aLazyElement := BlLazyElement new
		layout: BlFrameLayout new;
		background: BlBackground transparent;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		elementBuilder: [ self originalElementDo: [ :anElement | anElement ] ];
		withGlamorousPreview.

	self assignMeAsEntityFor: aLazyElement.
	
	^ aBlock value: aLazyElement
]

{ #category : #converting }
GtPhlowTaskItView >> asTaskItView [
	^ self
]

{ #category : #accessing }
GtPhlowTaskItView >> buildContext [
	<return: #GtPhlowBuildContext>
	^ self originalView buildContext
]

{ #category : #accessing }
GtPhlowTaskItView >> buildContext: aGtPhlowBuildContext [
	self originalView buildContext: aGtPhlowBuildContext
]

{ #category : #accessing }
GtPhlowTaskItView >> definingMethod [
	"Get view defining method.
	It is a method where a view is defined."
	<return: #RGMethodDefinition>
	^ self originalView definingMethod
]

{ #category : #accessing }
GtPhlowTaskItView >> definingMethod: aRGMethodDefinition [
	"Set view defining method.
	It is a method where a view is defined."
	^ self originalView definingMethod: aRGMethodDefinition
]

{ #category : #converting }
GtPhlowTaskItView >> ifItHasContent: aBlock [
	self originalView ifItHasContent: aBlock
]

{ #category : #initialization }
GtPhlowTaskItView >> initialize [
	super initialize.
	self originalView: self empty.
]

{ #category : #private }
GtPhlowTaskItView >> originalElementDo: anAsElementBlock [

	^ self originalView asElementDo: anAsElementBlock.

]

{ #category : #accessing }
GtPhlowTaskItView >> originalView [
	<return: #GtPhlowView>
	^ originalView
]

{ #category : #accessing }
GtPhlowTaskItView >> originalView: aView [
	self 
		assert: [ aView notNil ]
		description: [ 'Original view must be non-nil' ].
	originalView := aView
]

{ #category : #accessing }
GtPhlowTaskItView >> priority [
	"Get view priority defining a view order.
	Lower priority is supposed to be displayed to the left."
	<return: #Number>
	^ self originalView priority
]

{ #category : #accessing }
GtPhlowTaskItView >> priority: aNumber [
	"Set view priority defining a view order.
	Lower priority is supposed to be displayed to the left."
	^ self originalView priority: aNumber
]

{ #category : #accessing }
GtPhlowTaskItView >> title [
	"Return view title, a user friendly view name.
	It is supposed to be a short name"
	^ self originalView title
]

{ #category : #accessing }
GtPhlowTaskItView >> title: aString [
	"Set view title, a user friendly view name.
	It is supposed to be a short name"
	^ self originalView title: aString
]

{ #category : #updating }
GtPhlowTaskItView >> updateContent: aCurrentElement [
	"anElement is previously computed content from asElementDo:"
	| aChildElement |
	self
		assert: [ aCurrentElement childrenCount <= 1 ]
		description: [ 'TaskIt lazy element must have at most one child ' ].
	aCurrentElement element ifNotNil: [ 
		aChildElement := aCurrentElement children at: 1 ifAbsent: [ ^ self ].
		self originalView updateContent: aChildElement ].
]
