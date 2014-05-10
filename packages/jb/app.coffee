Thread            = java.lang.Thread
createWebServer   = Packages.org.webbitserver.WebServers.createWebServer
StaticFileHandler = Packages.org.webbitserver.handler.StaticFileHandler
HttpHandler       = Packages.org.webbitserver.HttpHandler
Rest              = Packages.org.webbitserver.rest.Rest

App = ->
	init: (port) ->
		@webServer = createWebServer(port || 9000)
		@rest = new Rest @webServer
		@webServer.add new StaticFileHandler('./public')
		@

	start: ->
		@webServer.start()
		print 'Server running at ' + @webServer.getUri()

	stop: ->
		@webServer.stop() if @webServer

	#app.params(req).path('id')
	#app.params(req).query('name')
	#app.params(req).form('age')
	params: (req) ->
		path: (key) ->
			Rest.params(req).get(key)

		query: (key) ->
			req.queryParam(key)

		form: (key) ->
			req.postParam(key)

	_url: '/jb'

	_restMethods:
		get: 'GET'
		post: 'POST'
		put: 'PUT'
		del: 'DELETE'
		head: 'HEAD'

	__noSuchMethod__ : (name, url, fn) ->
		url = '' if url == '/'
		@rest[@_restMethods[name]] (@_url + url), new HttpHandler
			handleHttpRequest: fn
