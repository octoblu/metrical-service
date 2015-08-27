ElasticalModel   = require './elastical-model'
byApplication   = require './searches/by_application'

INDEXES_BY_APP =
  gateblu: 'device_status_gateblu'
  flow   : 'device_status_flow'

class MetricalModel
  constructor: ->
    @elasticalModel = new ElasticalModel
    @elasticalModel.connect()

  getMetrics: (app, callback=->) =>
    query = byApplication INDEXES_BY_APP[app]
    @elasticalModel.search query, (error, results) =>
      return callback error if error?
      callback null, @convertSearchResults results

  convertSearchResults: (results) =>
    buckets = results?.aggregations?.group_by_application.buckets ? {}
    return buckets: buckets

module.exports = MetricalModel
