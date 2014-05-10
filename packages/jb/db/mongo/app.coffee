Mongo         = Packages.com.mongodb.Mongo
BasicDBObject = Packages.com.mongodb.BasicDBObject
# DB            = com.mongodb.DB
# DBCollection  = com.mongodb.DBCollection
# DBCursor      = com.mongodb.DBCursor
# DBObject      = Packages.com.mongodb.DBObject

Manager = (name) ->
	mg = new Mongo()
	db = mg.getDB 'temp'
	collect = db.getCollection name

	list: ->
    	cur = collect.find()
	    while cur.hasNext()
	        cur.next()
	
	add: (obj) ->
		dbobj = new BasicDBObject obj
		collect.save dbobj


	destory: ->
		if mg?
            mg.close();
        mg = null
        db = null