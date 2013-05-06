define [
  'underscore'
  'views/base/view'
  'controllers/session_controller'
], (_, View, SessionController) ->
  'use strict'

  class SocialConnectView extends View
    templateName: 'social_connect'
    className: 'social-connect'
    container: '#page-container'
    autoRender: true
    autoAttach: true

    initialize: (options) ->
      @user = options.user

      serviceProviders = SessionController.serviceProviders
      console.log serviceProviders
      _.each serviceProviders, (serviceProvider, serviceProviderName) =>
        bind = (fn) =>
          _(fn).bind this, serviceProviderName, serviceProvider

        buttonSelector = ".#{serviceProviderName}"
        @$(buttonSelector).addClass('service-loading')

        @delegate 'click', buttonSelector, bind @loginWith
        serviceProvider.done bind @serviceProviderLoaded
        serviceProvider.fail bind @serviceProviderFailed

      super
      @delegate 'click', '.btn', ->
        @$el.find('.btn').button('loading')
        console.log @user

    loginWith: (serviceProviderName, serviceProvider, event) ->
      console.log 'loginWith...', serviceProviderName, serviceProvider, event
      event.preventDefault()
      return unless serviceProvider.isLoaded()
      @publishEvent 'login:pickService', serviceProviderName
      @publishEvent '!login', serviceProviderName

    serviceProviderLoaded: (serviceProviderName) ->
      @$(".#{serviceProviderName}").removeClass('service-loading')

    serviceProviderFailed: (serviceProviderName) ->
      @$(".#{serviceProviderName}")
        .removeClass('service-loading')
        .addClass('service-unavailable')
        .attr('disabled', true)
        .attr('title', "Error connecting. Please check whether you are
    blocking #{utils.upcase(serviceProviderName)}.")

# class SessionController extends Controller
#   # Service provider instances as static properties
#   # This just hardcoded here to avoid async loading of service providers.
#   # In the end you might want to do this.
#   @serviceProviders =
#     facebook: new Facebook()