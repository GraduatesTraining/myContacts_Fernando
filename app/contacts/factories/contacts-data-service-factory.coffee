'use strict'

###*
 # @ngdoc service
 # @name contacts.factory:ContactsDataService

 # @description

###
ContactsDataService = ($http, $q)->
  ContactsDataServiceBase = {}
  url = "https://mycognizantcontacts.firebaseio.com/fersomo11/contacts.json"
  deferred = deferred || $q.defer()
  
  ContactsDataServiceBase.getContacts = ->
    getRequest = {
      method: 'GET'
      url: url
    }
    
    $http(getRequest)
    .then (data) ->
      deferred.resolve data.data
    , (error) ->
      deferred.reject error
          
    return deferred.promise

  ContactsDataServiceBase.createContact = (new_contact) ->
    postRequest = {
      method: 'POST'
      url: url
      data: new_contact
    }
    $http(postRequest)
    .then (data) ->
      deferred.resolve data
    , (error) ->
      deferred.reject error
    
    return deferred.promise

  ContactsDataServiceBase


angular
  .module 'contacts'
  .factory 'ContactsDataService', ContactsDataService