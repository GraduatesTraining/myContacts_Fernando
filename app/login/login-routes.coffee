'use strict'

angular
  .module 'login'
  .config ($stateProvider) ->
    $stateProvider
      .state 'login',
        url: '/login'
        templateUrl: 'login/views/login.tpl.html'
        controller: 'LoginCtrl'
        controllerAs: 'loginCtrl'
    $stateProvider
      .state 'register',
        url: '/register'
        templateUrl: 'login/views/register.tpl.html'
        controller: 'LoginCtrl'
        controllerAs: 'loginCtrl'
