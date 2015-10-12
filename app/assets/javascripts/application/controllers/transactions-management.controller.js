(function () {

    "use strict";

    angular.module('main').controller('ManagementCtrl', [ '$scope', '$state', 'TransactionsFactory',
        function($scope, $state, transactions) {

          $scope.search = function(query) {
            transactions.startSearch(query)
              .success(function(data) {
                $scope.transactions = data.transactions;
              })
              .error(function(data) {
                console.log(data);
              })
          };
          
        }])
}());