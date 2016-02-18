'use strict'

###*
 # @ngdoc object
 # @name login.controller:LoginCtrl

 # @description

###
class LoginCtrl
  @$inject = ['Auth', '$state']
  
  user: {
    email: undefined
    password: undefined
  }
  
  constructor: (@Auth, @$state) ->
    @ctrlName = 'LoginCtrl'
    
  login: ->
    @Auth.$authWithPassword(@user)
    .then (auth) =>
      @$state.go('contacts')
    , (error) =>
      @error = error
  register: ->
    @Auth.$unauth()

    @Auth.$createUser(@user)
    .then (auth) =>
      @login()
    , (error) =>
      @error = error
  

angular
  .module('login')
  .controller 'LoginCtrl', LoginCtrl
