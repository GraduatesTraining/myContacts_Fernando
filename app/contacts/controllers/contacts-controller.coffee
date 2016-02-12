'use strict'

###*
 # @ngdoc object
 # @name contacts.controller:ContactsCtrl

 # @description

###
class ContactsCtrl
  constructor: ($firebaseArray) ->
    @ctrlName = 'ContactsCtrl'
    @showForm = false
  showEditForm: (contact) ->
    alert ""
  removeContact: (contact) ->
    alert ""
  showAddForm: ->
    @showForm = !@showForm

ContactsCtrl.$inject = ["$firebaseArray"]

angular
  .module('contacts')
  .controller 'ContactsCtrl', ContactsCtrl
