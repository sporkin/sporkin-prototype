define [
  'chaplin'
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class User extends Model
    url: "/users"

    initialize: (attributes, options) ->
      super

    createWithFacebook: (attributes) ->
      params =
        type: "facebook"
        accessToken: attributes.accessToken

      @save params,
        patch: true
