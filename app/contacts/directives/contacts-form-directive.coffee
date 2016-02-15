'use strict'
###*
 # @ngdoc directive
 # @name contacts.directive:contactsForm
 # @restrict E
 # @element

 # @description

 # @example
   <example module="contacts">
     <file name="index.html">
      <contacts-form></contacts-form>
     </file>
   </example>

###
class ContactsForm
  constructor: ->
    return {
      restrict: 'E'
      scope: false
      templateUrl: 'contacts/directives/contacts-form-directive.tpl.html'
      replace: false
      
      # ### Using the module controller ###

      ### Defining a new controller or not, thats the question??????
      controllerAs: 'contactsForm'
      controller: ->
        vm = @
        vm.name = 'contactsForm'
      ###
      
      link: (scope, element, attrs) ->
        ###jshint unused:false ###
        ###eslint "no-unused-vars": [2, {"args": "none"}]###
    }

angular
  .module 'contacts'
  .directive 'contactsForm', ContactsForm
