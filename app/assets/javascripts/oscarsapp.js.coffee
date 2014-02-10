window.Oscarsapp =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
    new Oscarsapp.Routers.Questions()
    Backbone.history.start({pushState: true})

$(document).ready ->
  Oscarsapp.initialize()
