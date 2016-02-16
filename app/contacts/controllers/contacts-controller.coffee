'use strict'

###*
 # @ngdoc object
 # @name contacts.controller:ContactsCtrl

 # @description

###
class ContactsCtrl
  @$inject = ['ContactsDataService','$modal']

  # Model for all contacts, a new contact
  # and a key to identify a contact
  all_contacts: []
  
  new_contact: {
    personalInfo: {
      name: undefined
      email: undefined
      company: undefined
    }
    telephone: {
      work_phone: undefined
      mobile_phone: undefined
      home_phone: undefined
    }
    address: {
      street: undefined
      city: undefined
      state: undefined
      zip: undefined
    }
  }

  updateKey: undefined

  # Variables for ordering and filtering the contacts list
  sortBy: 'personalInfo.name'
  sortOrder: false
  searchField: ''
  
  # Variable for showing/hiding contact details
  showIndexDetails: -1

  # Constructor method of the class
  constructor: (@ContactsDataService, @$modal) ->
    @ctrlName = 'ContactsCtrl'
    @getContacts()
  
  # Method to show or hide contact details
  showDetails: (index) ->
    if @showIndexDetails is index
      @showIndexDetails = -1
    else
      @showIndexDetails = index
  
  # Method to show or hide the add/edit form
  showAddForm: (edit = false) ->
    @edit = edit

    @showForm = !@showForm

  # Method to retrieve the data of the contact to edit and show it
  showEditForm: (key) ->
    @ContactsDataService.getContact(key)
    .then (data) =>
      @showAddForm(true)
      @updateKey = key
      @new_contact = data
    , (error) ->
      console.error "ContactsCtrl > deleteContact"
      console.error "#{error.status} #{error.statusText}"

  # Method to add contacts to the DataBase
  addFormSubmit: ->
    console.log "Adding contact...."
    @ContactsDataService.createContact(@new_contact)
    .then (data) =>
      @getContacts()
      @showAddForm()
    , (error) ->
      console.error "ContactsCtrl > addFormSubmit"
      console.error "#{error.status} #{error.statusText}"

  # Method to update a contact from the DataBase
  editFormSubmit: () ->
    console.log "Updating contact...."
    @ContactsDataService.updateContact(@updateKey, @new_contact)
    .then (data) =>
      @getContacts()
      @showAddForm()
    , (error) ->
      console.error "ContactsCtrl > editFormSubmit"
      console.error "#{error.status} #{error.statusText}"

  # Method that retrieves the contacts from the DataBase
  getContacts: ->
    console.log "Getting contacts...."
    @all_contacts = []
    @ContactsDataService.getContacts()
    .then (data) =>
      for e,v of data
        @all_contacts.push v
    , (error) ->
      console.error "ContactsCtrl > getContacts"
      console.error "#{error.status} #{error.statusText}"

  # Method to delete a contact from the DataBase
  removeContact: (key) ->
    console.log "Deleting contact with id: #{key}"
    @ContactsDataService.deleteContact(key)
    .then (data) =>
      @getContacts()
    , (error) ->
      console.error "ContactsCtrl > deleteContact"
      console.error "#{error.status} #{error.statusText}"

  # Method to open an instantiate the deletion modal
  openDeleteModal: (key) ->
    modalInstance = @$modal.open {
      controller: 'DeleteModalCtrl as deletemodalctrl'
      templateUrl: 'contacts/views/delete-modal.tpl.html'
    }
    
    modalInstance.result
    .then (modal_result) =>
      if modal_result then @removeContact key
    , ->
      console.log "Modal dismissed at: #{new Date()}"


angular
  .module('contacts')
  .controller 'ContactsCtrl', ContactsCtrl
