elasticsearch   = require 'elasticsearch'

class ElasticalModel
  constructor: ->
    @ELASTICSEARCH_URI = process.env.ELASTICSEARCH_URI ? 'localhost:9200'

  connect: (callback=->) =>
    @client = new elasticsearch.Client host: @ELASTICSEARCH_URI

  search: (query={}, callback=->) =>
    @client.search query
      .then (response) =>
        callback null, response
      .catch (error) =>
        callback error?.message

  count: (query={}, callback=->) =>
    @client.count query
      .then (response) =>
        callback null, response
      .catch (error) =>
        callback error?.message

module.exports = ElasticalModel
