###global describe, beforeEach, it, browser, expect ###
'use strict'


ContactsPagePo = require './contacts.po'

describe 'Contacts page', ->
  contactsPage = undefined

  beforeEach ->
    contactsPage = new ContactsPagePo
    browser.get '/#/contacts'

  it 'should say ContactsCtrl', ->
    expect(contactsPage.heading.getText()).toEqual 'contacts'
    expect(contactsPage.text.getText()).toEqual 'ContactsCtrl'
