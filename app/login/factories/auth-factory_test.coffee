###global describe, beforeEach, it, expect, inject, module###
'use strict'

describe 'Auth', ->
  factory = undefined

  beforeEach module 'login'

  beforeEach inject (Auth) ->
    factory = Auth