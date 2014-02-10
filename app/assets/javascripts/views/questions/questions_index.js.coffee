class Oscarsapp.Views.QuestionsIndex extends Backbone.View

  template: JST['questions/index']

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    $(@el).html(@template(questions: @collection))
    this