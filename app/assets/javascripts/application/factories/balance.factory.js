(function () {
  'use strict';
  angular.module('main').factory('BalanceFactory', ['$http', function($http){
    return {
      getBalance: function() {
        return $http.get('/balances');
      }
    };
  }])
}());