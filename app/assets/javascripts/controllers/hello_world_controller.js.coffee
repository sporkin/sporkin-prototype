define [
  'controllers/base/controller'
  'models/hello_world'
  'views/hello_world_view'
], (Controller, HelloWorld, HelloWorldView) ->
  'use strict'

  class HelloWorldController extends Controller

    title: 'Hello World'

    show: (params) ->
      
      dust.render "foo", {name: "Fred", a: {b:"c"}}, (err, out) ->
        console.log(out)
      
      @model = new HelloWorld()
      @view = new HelloWorldView model: @model
      
      
      
      
      
