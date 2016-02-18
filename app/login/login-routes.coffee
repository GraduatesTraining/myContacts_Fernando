'use strict'

isNotAuthenticated = ($state, Auth) ->
  Auth.$requireAuth()
  .then (auth) ->
    $state.go('contacts')
  , (error) ->
    return


angular
  .module 'login'
  .config ($stateProvider) ->
    $stateProvider
      .state 'login',
        url: '/login'
        templateUrl: 'login/views/login.tpl.html'
        controller: 'LoginCtrl'
        controllerAs: 'loginCtrl'
        resolve: {
          notAuth: isNotAuthenticated
        }
    $stateProvider
      .state 'register',
        url: '/register'
        templateUrl: 'login/views/register.tpl.html'
        controller: 'LoginCtrl'
        controllerAs: 'loginCtrl'
        resolve: {
          notAuth: isNotAuthenticated
        }
