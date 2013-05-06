define [
  'controllers/base/controller'
  'models/user'
  'views/social_connect_view'
], (Controller, User, SocialConnectView) ->
  'use strict'

  class SocialConnectController extends Controller
    title: 'social connect'

    show: (params) ->
      @user = new User()
      @view = new SocialConnectView user: @user
