'use strict'

###*
 # @ngdoc object
 # @name login.controller:LoginCtrl

 # @description

###
class LoginCtrl
  @$inject = ['Auth', '$state']
  
  class User
    constructor: ->
      @email= undefined
      @password= undefined
  
  user: new User

  constructor: (@Auth, @$state) ->
    @ctrlName = 'LoginCtrl'
    @user = new User
    
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
  logout: ->
    @Auth.$unauth()

angular
  .module('login')
  .controller 'LoginCtrl', LoginCtrl
