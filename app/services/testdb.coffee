load 'packages/jb/db/mongo/app.js'

Service = ->
	mgr = new Manager 'users'

	add: (obj) ->
		mgr.add obj

	list: ->
		mgr.list()