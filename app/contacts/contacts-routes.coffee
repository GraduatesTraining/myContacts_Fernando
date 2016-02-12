'use strict'

angular
  .module 'contacts'
  .config ($stateProvider) ->
    $stateProvider
      .state 'contacts',
        url: '/contacts'
        templateUrl: 'contacts/views/contacts.tpl.html'
        controller: 'ContactsCtrl'
        controllerAs: 'contactsCtrl'
