###global describe, beforeEach, it, expect, inject, module###
'use strict'

describe 'DeleteModalCtrl', ->
  ctrl = undefined

  beforeEach module 'contacts'

  beforeEach inject ($rootScope, $controller) ->
    ctrl = $controller 'DeleteModalCtrl'

  it 'should have ctrlName as DeleteModalCtrl', ->
    expect(ctrl.ctrlName).toEqual 'DeleteModalCtrl'

