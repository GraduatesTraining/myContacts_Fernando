'use strict'

angular
  .module 'login'
  .config ($stateProvider) ->
    $stateProvider
      .state 'login',
        url: '/login'
        templateUrl: 'login/views/login.tpl.html'
        controller: 'LoginCtrl'
        controllerAs: 'login'
