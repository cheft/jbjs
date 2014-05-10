load 'app/services/testdb.js'

Router = (app) ->
	svc = new Service()
	app.get '/', (req, res, ctrl) ->
		list = svc.list()
		res.content(JSON.stringify(list)).end()

	app.put '/{id}', (req, res, ctrl) ->
		res.content(app.params(req).path('id')).end()

	app.post '/', (req, res, ctrl) ->
		user = name: 'chf', age: 22
		svc.add user
		res.content(JSON.stringify(user)).end()

	app.del '/', (req, res, ctrl) ->
		res.content('del Hello World').end()

	app.head '/', (req, res, ctrl) ->
		res.content('head Hello World').end()