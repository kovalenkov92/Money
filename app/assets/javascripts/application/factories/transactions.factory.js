(function () {
  'use strict';
  angular.module('main').factory('TransactionsFactory', ['$http', function ($http){
    return {
      all: function() {
        return $http.get('/transactions');
      },
      createTransaction: function (summ, category_id, comment, time) {
        if (time != undefined) {
          time = time.toString();
        }else{
          time = new Date();
          time = time.toString();
        };
        return $http.post('/transactions', {transaction: {summ: summ, 
                                                          category_id: category_id, 
                                                          comment: comment,
                                                          time: time}
                                            });
      },
      deleteTransaction: function(id) {
        return $http.delete('/transactions/' + id);
      },
      getGraphData: function(from, to) {
        return $http.get('/transactions/generate_graph?from=' + from + '&to=' + to);
      },
      getAreaData: function(from, to) {
        return $http.get('transactions/generate_area_data?from=' + from + '&to=' + to);
      },
      startSearch: function(query) {
        if (query === undefined) {
          query = "";
        };
        return $http.get('/transactions/search?query=' + query);
      }
    };
  }])
}());