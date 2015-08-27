module.exports = (index) =>
  query =
    body: aggs: group_by_application: terms: field: "payload.application.raw"
    index: index
    searchType: 'count'
  return query
