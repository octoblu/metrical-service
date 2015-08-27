express         = require 'express'
bodyParser      = require 'body-parser'
morgan          = require 'morgan'
errorhandler    = require 'errorhandler'
healthcheck     = require 'express-meshblu-healthcheck'
MetricalController = require './src/metrical-controller'

app = express()
app.use bodyParser.json()
app.use morgan 'dev'
app.use errorhandler()
app.use healthcheck()

metricalController = new MetricalController

app.get '/gateblu/latest', metricalController.gatebluLatest
app.get '/flow/latest', metricalController.flowLatest

server = app.listen (process.env.PORT || 80), ->
  host = server.address().address
  port = server.address().port

  console.log "Metrical Service started http://#{host}:#{port}"
