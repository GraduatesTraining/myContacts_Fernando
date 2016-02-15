###global describe, beforeEach, it, expect, inject, module###
'use strict'

describe 'contactsDataService', ->
  factory = undefined

  beforeEach module 'contacts'

  beforeEach inject (contactsDataService) ->
    factory = contactsDataService
