(function () {
  'use strict';
  angular.module('main').factory('IncomesFactory', ['$http', function($http){
    return {
      index: function() {
        return $http.get('/incomes');
      },
      update: function(value, comment, time) {
        if (time != undefined) {
          time = time.toString();
        }else{
          time = new Date();
          time = time.toString();
        };
        return $http.post('/incomes', {income: {diff: value, comment: comment, time: time}});
      },
      deleteIncome: function(id) {
        return $http.delete('/incomes/' + id);
      }
    };
  }])
}());