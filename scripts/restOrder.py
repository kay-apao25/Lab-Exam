from dosql import *
import cgi
import simplejson as json

def index(req, ide):
    ide = cgi.escape(ide)
    x = doSql()
    k = x.execqry("select * from loadOrder('" + ide + "');", False)
    res = []
    for j in k:
        stringed = map(str, j)
        res.append(stringed)

    return json.dumps(res)
	