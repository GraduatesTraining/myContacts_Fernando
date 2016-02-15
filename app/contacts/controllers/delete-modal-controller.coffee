'use strict'

###*
 # @ngdoc object
 # @name contacts.controller:DeleteModalCtrl

 # @description

###
class DeleteModalCtrl
  @$inject = []

  constructor: () ->
    @ctrlName = 'DeleteModalCtrl'
  ok: ->
    # @$modalInstance.close(true)
    alert "OK"
    return
  cancel: ->
    # @$modalInstance.dismiss(false)
    alert "cancel"
    return

angular
  .module('contacts')
  .controller 'DeleteModalCtrl', DeleteModalCtrl
