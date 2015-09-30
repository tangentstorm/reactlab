express = require 'express'

app = express()
app.set 'view engine', 'jade'
app.use express.static 'web'

app.get '/', (req, res) ->
  res.render 'index', title: 'Hey', message: 'Hello there!'

server = app.listen 3000, ->
  host = server.address().address
  port = server.address().port
  console.log "Example app listening at http://#{host}:#{port}"
