'use strict'

###*
 # @ngdoc object
 # @name contacts.controller:ContactsCtrl

 # @description

###
class ContactsCtrl
  @$inject = ['ContactsDataService']

  all_contacts: {}
  
  newContact: {
    name: undefined
    email: undefined
    company: undefined
    work_phone: undefined
    mobile_phone: undefined
    home_phone: undefined
    street: undefined
    city: undefined
    state: undefined
    zip: undefined
  }
  
  constructor: (@ContactsDataService) ->
    @ctrlName = 'ContactsCtrl'
    @getContacts()
  showEditForm: (contact) ->
    alert ""
  removeContact: (contact) ->
    alert ""
  showAddForm: ->
    @showForm = !@showForm
  addFormSubmit: ->
    console.log "Adding contact...."
    @ContactsDataService.createContact(@new_contact)
    .then (data) =>
      console.log data
      @getContacts()
      @showAddForm()
    , (error) ->
      console.error "ContactsCtrl > addFormSubmit"
      console.error "#{error.status} #{error.statusText}"
  getContacts: ->
    console.log "Getting contacts...."
    @ContactsDataService.getContacts()
    .then (data) =>
      @all_contacts = data
    , (error) ->
      console.error "ContactsCtrl > getContacts"
      console.error "#{error.status} #{error.statusText}"


angular
  .module('contacts')
  .controller 'ContactsCtrl', ContactsCtrl
