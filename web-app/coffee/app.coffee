class Committee extends Backbone.Model
	urlRoot: "api/committee"

class CommitteeCollection extends Backbone.Collection
	model: Committee

class CommitteeView extends Backbone.View
	tagName: "li"

	initialize: ->
		_.bindAll @

		

class CommitteeListView extends Backbone.View
