'use strict'

###*
 # @ngdoc object
 # @name contacts.controller:ContactsCtrl

 # @description

###
class ContactsCtrl
  @$inject = ['ContactsDataService']

  all_contacts: {}
  
  new_contact: {
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
  
  updateKey: undefined
  
  constructor: (@ContactsDataService) ->
    @ctrlName = 'ContactsCtrl'
    @getContacts()
  showEditForm: (key) ->
    @ContactsDataService.getContact(key)
    .then (data) =>
      @showAddForm(true)
      @updateKey = key
      @new_contact = data
    , (error) ->
      console.error "ContactsCtrl > deleteContact"
      console.error "#{error.status} #{error.statusText}"
  removeContact: (key) ->
    console.log "Deleting contact with id: #{key}"
    @ContactsDataService.deleteContact(key)
    .then (data) =>
      @getContacts()
    , (error) ->
      console.error "ContactsCtrl > deleteContact"
      console.error "#{error.status} #{error.statusText}"
  showAddForm: (edit = false) ->
    @edit = edit
    @showForm = !@showForm
  addFormSubmit: ->
    console.log "Adding contact...."
    @ContactsDataService.createContact(@new_contact)
    .then (data) =>
      @getContacts()
      @showAddForm()
    , (error) ->
      console.error "ContactsCtrl > addFormSubmit"
      console.error "#{error.status} #{error.statusText}"
  editFormSubmit: () ->
    console.log "Updating contact...."
    @ContactsDataService.updateContact(@updateKey, @new_contact)
    .then (data) =>
      @getContacts()
      @showAddForm()
    , (error) ->
      console.error "ContactsCtrl > editFormSubmit"
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
