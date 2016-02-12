###global describe, beforeEach, it, expect, inject, module###
'use strict'

describe 'contactsForm', ->
  scope = undefined
  element = undefined

  # coffeelint: disable=max_line_length
  beforeEach module('contacts', 'contacts/directives/contacts-form-directive.tpl.html')
  # coffeelint: enable=max_line_length


  beforeEach inject ($compile, $rootScope) ->
    scope = $rootScope.$new()
    element = $compile(angular.element('<contactsForm></contactsForm>')) scope

  it 'should have correct text', ->
    scope.$apply()
    expect(element.isolateScope().contactsForm.name).toEqual 'contactsForm'
