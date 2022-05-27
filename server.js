const jsonServer = require('json-server')
const auth = require('json-server-auth')
const app = jsonServer.create()
const router = jsonServer.router('./db.json')
const middlewares = jsonServer.defaults({noCors:true})
var cors = require("cors");

app.db = router.db
app.use(cors())
app.use(auth)
app.use(middlewares);  
app.use(router)
app.listen(8000,()=>
{
    console.log("json-server running on port 8000");
})