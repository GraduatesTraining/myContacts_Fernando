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
    @$modalInstance.close true
  cancel: ->
    @$modalInstance.dismiss false

angular
  .module('contacts')
  .controller 'DeleteModalCtrl', DeleteModalCtrl
