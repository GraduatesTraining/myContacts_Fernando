###global describe, beforeEach, it, expect, inject, module###
'use strict'

describe 'User', ->
  factory = undefined

  beforeEach module 'login'

  beforeEach inject (User) ->
    factory = User
