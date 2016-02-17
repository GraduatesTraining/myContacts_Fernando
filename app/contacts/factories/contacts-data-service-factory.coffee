'use strict'

###*
 # @ngdoc service
 # @name contacts.factory:ContactsDataService

 # @description

###
ContactsDataService = ($http, $q)->
  ContactsDataServiceBase = {}
  url = "https://mycognizantcontacts.firebaseio.com/fersomo11/contacts"
  jsonExtension = ".json"
  
  ContactsDataServiceBase.getContacts = ->
    deferred = $q.defer()
    getRequest = {
      method: 'GET'
      url: url + jsonExtension
    }
    
    $http(getRequest)
    .then (data) ->
      deferred.resolve data.data
    , (error) ->
      deferred.reject error
          
    return deferred.promise

  ContactsDataServiceBase.getContact = (key) ->
    deferred = $q.defer()
    getRequest = {
      method: 'GET'
      url: url + "/" + key + jsonExtension
    }
    
    $http(getRequest)
    .then (data) ->
      deferred.resolve data.data
    , (error) ->
      deferred.reject error
          
    return deferred.promise

  ContactsDataServiceBase.createContact = (new_contact) ->
    deferred = $q.defer()
    postRequest = {
      method: 'POST'
      url: url + jsonExtension
      data: new_contact
    }
    
    $http(postRequest)
    .then (data) ->
      ContactsDataServiceBase.patchKeyAsId data.data.name
      deferred.resolve data.data
    , (error) ->
      deferred.reject error
    
    return deferred.promise
    
  ContactsDataServiceBase.updateContact = (key, new_contact) ->
    deferred = $q.defer()
    postRequest = {
      method: 'PUT'
      url: url + "/" + key + jsonExtension
      data: new_contact
    }
    
    $http(postRequest)
    .then (data) ->
      deferred.resolve data.data
    , (error) ->
      deferred.reject error
    
    return deferred.promise
    
  ContactsDataServiceBase.deleteContact = (key) ->
    deferred = $q.defer()
    deleteRequest = {
      method: 'DELETE'
      url: url + "/" + key + jsonExtension
    }
  
    $http(deleteRequest)
    .then (data) ->
      deferred.resolve data
    , (error) ->
      deferred.reject error
    
    return deferred.promise

  ContactsDataServiceBase.patchKeyAsId = (key) ->
    deferred = $q.defer()
    patchRequest = {
      method: 'PATCH'
      url: url + "/" + key + jsonExtension
      data: {id: key}
    }
  
    $http(patchRequest)
    .then (data) ->
      deferred.resolve data
    , (error) ->
      deferred.reject error
    
    return deferred.promise

  ContactsDataServiceBase


angular
  .module 'contacts'
  .factory 'ContactsDataService', ContactsDataService