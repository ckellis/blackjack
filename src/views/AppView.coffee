class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button> <button class ="new-game-button">New Game</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    <div class="results"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.stand()

  initialize: ->
    @listenTo(@model, 'end', @renderResults)
    @render()

  renderResults: (reason) ->
    @$('.results').html new ResultsView({reason: reason}).el

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

