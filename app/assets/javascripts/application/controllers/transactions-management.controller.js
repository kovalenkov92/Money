(function () {

    "use strict";

    angular.module('main').controller('ManagementCtrl', [ '$scope', '$state', 'TransactionsFactory',
        function($scope, $state, transactions) {

          $scope.search = function(query) {
            transactions.startSearch(query)
              .success(function(data) {
                $scope.by_query = data.transactions;
              })
              .error(function(data) {
                console.log(data);
              })
          };

          $scope.searchByDate = function(date) {
            transactions.startSearchByDate(date)
              .success(function(data) {
                $scope.by_date = data.transactions;
              })
              .error(function(data) {
                console.log(data);
              })
          };
          
        }])
}());