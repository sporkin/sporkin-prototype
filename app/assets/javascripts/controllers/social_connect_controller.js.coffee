define [
  'controllers/base/controller'
  'models/user'
  'views/social_connect_view'
], (Controller, User, SocialConnectView) ->
  'use strict'

  class SocialConnectController extends Controller
    title: 'social connect'

    show: (params) ->
      # dust.render "foo", {name: "Fred", a: {b:"c"}}, (err, out) ->
        # $('body').append(out)
      @user = new User()
      @view = new SocialConnectView user: @user

