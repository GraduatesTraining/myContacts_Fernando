'use strict'

###*
 # @ngdoc object
 # @name contacts.controller:DeleteModalCtrl

 # @description

###
class DeleteModalCtrl
  @$inject = ['$scope','$modalInstance']

  constructor: (@$scope, @$modalInstance) ->
    @ctrlName = 'DeleteModalCtrl'
    console.log @$modalInstance
    @$scope.ok = =>
      @$modalInstance.close true
    @$scope.cancel = =>
      @$modalInstance.dismiss false

angular
  .module('contacts')
  .controller 'DeleteModalCtrl', DeleteModalCtrl
