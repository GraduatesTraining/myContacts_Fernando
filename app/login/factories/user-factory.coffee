'use strict'

###*
 # @ngdoc service
 # @name login.factory:User

 # @description

###
User = (firebaseObject) ->
  UserBase = {}
  
  UserBase.getLoggedInUser = ->
    user  = localStorage.getItem('firebase:session::mycognizantcontacts')
    if user then JSON.parse(user)

  UserBase

angular
  .module 'login'
  .factory 'User', ['$firebaseObject' , User]