'use strict'

isAuthenticated = ($state, Auth) ->
  Auth.$requireAuth().catch( ->
    $state.go('login'))


angular
  .module 'contacts'
  .config ($stateProvider) ->
    $stateProvider
      .state 'contacts',
        url: '/contacts'
        templateUrl: 'contacts/views/contacts.tpl.html'
        controller: 'ContactsCtrl'
        controllerAs: 'contactsCtrl'
        resolve: {
          auth: isAuthenticated
        }

