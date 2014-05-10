Router = (app) ->
	app.get '/a', (req, res, ctrl) ->
		print req.queryParam('name')
		res.content(app.params(req).query('name')).end()

	app.put '/{id}', (req, res, ctrl) ->
		res.content(app.params(req).path('id')).end()

	app.post '/', (req, res, ctrl) ->
		print req.queryParam('name')
		print req.postParam('age')
		res.content(app.params(req).form('age')).end()

	app.del '/', (req, res, ctrl) ->
		res.content('del Hello World').end()

	app.head '/', (req, res, ctrl) ->
		res.content('head Hello World').end()