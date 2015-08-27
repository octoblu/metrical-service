MetricalModel   = require './metrical-model'
debug           = require('debug')('metrical-service:controller')


class MetricalController
  constructor: ->
    @metricalModel = new MetricalModel

  gatebluLatest: (request, response) =>
    @metricalModel.getMetrics 'gateblu', (error, results) =>
      return response.status(500).send error: error if error?
      response.status(200).send results

  flowLatest: (request, response) =>
    @metricalModel.getMetrics 'flow', (error, results) =>
      return response.status(500).json error: error if error?
      response.status(200).json results

module.exports = MetricalController
