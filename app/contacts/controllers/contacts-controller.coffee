'use strict'

###*
 # @ngdoc object
 # @name contacts.controller:ContactsCtrl

 # @description

###
class ContactsCtrl
  constructor: ($firebaseArray) ->
    @ctrlName = 'ContactsCtrl'
  showEditForm: (contact) ->
    alert ""
  removeContact: (contact) ->
    alert ""
  showAddForm: ->
    alert "Creating new contact"

ContactsCtrl.$inject = ["$firebaseArray"]

angular
  .module('contacts')
  .controller 'ContactsCtrl', ContactsCtrl
