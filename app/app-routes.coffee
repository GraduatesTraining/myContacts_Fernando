'use strict'

angular
  .module 'myContacts'
  .config ($urlRouterProvider) ->
    $urlRouterProvider.otherwise '/login'
