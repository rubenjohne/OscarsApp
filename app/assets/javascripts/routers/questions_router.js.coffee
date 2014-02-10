class Oscarsapp.Routers.Questions extends Backbone.Router
  routes:
    'contest':'index'
    'questions/:id':'show'
  
  initialize: ->
    @questions = new Oscarsapp.Collections.Questions()
    @questions.fetch({reset: true})

  index: ->
    view = new Oscarsapp.Views.QuestionsIndex(collection: @questions)
    $('body').append(view.render().el)	

  show: (id) ->
   alert "Showing questions #{id}"