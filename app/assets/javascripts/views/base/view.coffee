define [
  'chaplin'
  'lib/view_helper' # Just load the view helpers, no return value
], (Chaplin) ->
  'use strict'

  class View extends Chaplin.View

    render: ->
      return false if @disposed
      templateFunc = @getTemplateFunction()
      dust.render @templateName, @getTemplateData(), (err, out) =>
        console.log @$el.html()
        @$el.html out
      this


    getTemplateFunction: ->
      return @templateName



    # getTemplateFunction: ->
    #   #console.log 'View#getTemplateFunction', @templateName, JST[@templateName]
    #   templateFunction = JST[@templateName]
    #   if typeof @templateName is 'string' and typeof templateFunction isnt 'function'
    #     throw new Error "View template #{@templateName} not found"
    # 
    #   templateFunction
