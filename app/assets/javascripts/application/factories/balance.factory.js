(function () {
  'use strict';
  angular.module('main').factory('BalancesFactory', ['$http', function($http){
    return {
      getBalance: function() {
        return $http.get('/balances');
      }
    };
  }])
}());