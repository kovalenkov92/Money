(function () {
  'use strict';
  angular.module('main').factory('TransactionsFactory', ['$http', function ($http){
    return {
      all: function() {
        return $http.get('/transactions');
      },
      createTransaction: function (summ, category_id, comment) {
        return $http.post('/transactions', {transaction: {summ: summ, 
                                                          category_id: category_id, 
                                                          comment: comment}
                                            });
      },
      deleteTransaction: function(id) {
        return $http.delete('/transactions/' + id);
      }
    };
  }])
}());