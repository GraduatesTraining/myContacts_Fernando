###global describe, beforeEach, it, expect, inject, module###
'use strict'

describe 'ContactsCtrl', ->
  ctrl = undefined

  beforeEach module 'contacts'

  beforeEach inject ($rootScope, $controller) ->
    ctrl = $controller 'Contacts'

  it 'should have ctrlName as ContactsCtrl', ->
    expect(ctrl.ctrlName).toEqual 'ContactsCtrl'

