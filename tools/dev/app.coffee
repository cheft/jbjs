File                  = Packages.java.io.File
HashMap               = Packages.java.util.HashMap
Iterator              = Packages.java.util.Iterator
Map                   = Packages.java.util.Map
Objects               = Packages.java.util.Objects
Set                   = Packages.java.util.Set;
Thread                = java.lang.Thread

beforeMap = new HashMap()
afterMap = new HashMap()

scanFile = (f) ->
    files = f.listFiles()
    for index, file of files
        if file.isFile()
            afterMap.put file.getAbsolutePath(), file.lastModified()
        else
          scanFile file

watchFile = ->
    afterSet = afterMap.keySet()
    it = afterSet.iterator()
    while it.hasNext()
        key = (String) it.next()
        if !Objects.equals(afterMap.get(key), beforeMap.get(key))
            print key + " modified!"
            return true
    return false

start = ->
    if app?
        app.stop()
        delete app
    load 'app.js'
    app.start()
    print 'app started'

run = ->
    f = new File(".")
    scanFile f
    beforeMap.putAll(afterMap);
    while true
        afterCount = afterMap.keySet().size()
        if afterCount != beforeCount
            beforeCount = afterCount;
            beforeMap.clear()
            beforeMap.putAll afterMap
            start()
        else if watchFile()
            beforeMap.clear()
            beforeMap.putAll afterMap
            start()

        Thread.sleep 500
        afterMap.clear()
        scanFile f

new Thread(run).start()
Thread.currentThread().join()

