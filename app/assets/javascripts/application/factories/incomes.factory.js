(function () {
  'use strict';
  angular.module('main').factory('IncomesFactory', ['$http', function($http){
    return {
      index: function() {
        return $http.get('/incomes');
      },
      update: function(value, comment) {
        return $http.post('/incomes', {income: {diff: value, comment: comment}});
      },
      deleteIncome: function(id) {
        return $http.delete('/incomes/' + id);
      }
    };
  }])
}());