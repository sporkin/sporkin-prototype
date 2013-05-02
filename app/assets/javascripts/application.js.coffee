#= require hamlcoffee
#= require dust-core

#= require_tree ./templates
# Bootstrap the application

require [
  'sporkin_application'
  'bootstrap'
], (SporkinApplication, bootstrap) ->
  'use strict'

  app = new SporkinApplication()
  app.initialize()
