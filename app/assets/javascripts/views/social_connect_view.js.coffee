define [
  'views/base/view'
], (View, template) ->
  'use strict'

  class SocialConnectView extends View
    templateName: 'social_connect'
    className: 'social-connect'
    container: '#page-container'
    autoRender: true
    autoAttach: true

    initialize: (options) ->
      super
      @delegate 'click', '.btn', ->
        @$el.find('.btn').button('loading')