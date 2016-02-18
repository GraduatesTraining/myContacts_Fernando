'use strict'

###*
 # @ngdoc service
 # @name login.factory:Auth

 # @description

###
Auth = ($firebaseAuth, FireBaseUrl) ->
  ref = new Firebase FireBaseUrl
  auth = $firebaseAuth ref
  
  auth


angular
  .module 'login'
  .factory 'Auth', ['$firebaseAuth', 'FireBaseUrl', Auth]
