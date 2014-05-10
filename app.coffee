load 'packages/jb/app.js'
# load 'app/router.js'
load 'app/routers/testdb.js'

app = new App().init()
new Router app
