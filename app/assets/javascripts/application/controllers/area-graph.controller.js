(function () {

  "use strict";

  angular.module('main').controller('AreaGraphCtrl', [ '$scope', '$state', 'TransactionsFactory',
    function($scope, $state, transactions) {
      $scope.hideError = true;
      $scope.getGraph = function(fromDate, toDate){
        transactions.getAreaData(fromDate, toDate)
        .success(function(data){
          $scope.hideError = true;
          drawGraph(data.response);
        })
        .error(function(data){
          $scope.hideError = false;
        })
      };

      var drawGraph = function(data){
        console.log('(' + data + ')');
        $('#area').highcharts({
            chart: {
                zoomType: 'x'
            },
            title: {
                text: 'Expenses'
            },
            subtitle: {
                text: document.ontouchstart === undefined ?
                        'Click and drag in the plot area to zoom in' : 'Pinch the chart to zoom in'
            },
            xAxis: {
                type: 'datetime'
            },
            yAxis: {
                title: {
                    text: "Value, ₴"
                }
            },
            legend: {
                enabled: false
            },
            plotOptions: {
                area: {
                    fillColor: {
                        linearGradient: {
                            x1: 0,
                            y1: 0,
                            x2: 0,
                            y2: 1
                        },
                        stops: [
                            [0, Highcharts.getOptions().colors[0]],
                            [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                        ]
                    },
                    marker: {
                        radius: 2
                    },
                    lineWidth: 1,
                    states: {
                        hover: {
                            lineWidth: 1
                        }
                    },
                    threshold: null
                }
            },

            series: [{
                type: 'area',
                name: 'expense',
                data: data
            }]
        });  
      };
    }])
}());