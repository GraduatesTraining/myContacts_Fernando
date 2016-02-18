'use strict'

RefreshUserData = ($rootScope, $state, User, Auth) ->
  retrieveUserOnChange = ->
    loggedInUser = User.getLoggedInUser()
    if loggedInUser
      $rootScope.loggedInUser = loggedInUser

  $rootScope.$on '$stateChangeStart', retrieveUserOnChange
  
  Auth.$onAuth ( (data) ->
    unless data?
      $state.go('login') )
  



angular
  .module 'myContacts'
  .constant 'FireBaseUrl', 'https://mycognizantcontacts.firebaseio.com/'

  .run RefreshUserData