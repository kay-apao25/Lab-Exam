from dosql import *
import cgi
import simplejson as json

def index(req, ide):
    ide = cgi.escape(ide)
    x = doSql()
    rets = x.execqry("select * from loadOrder('" + ide + "');", False)
    result = []
    for ret in rets:
        stringed = map(str, ret)
        result.append(stringed)

    return json.dumps(result)
	