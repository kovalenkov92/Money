(function () {

  "use strict";

  angular.module('main').controller('ChartCtrl', [ '$scope', '$state', 'TransactionsFactory',
    function($scope, $state, transactions) {
    $scope.hideError = true;
    $scope.getGraph = function(fromDate, toDate){
      transactions.getGraphData(fromDate, toDate)
      .success(function(data){
        $scope.graphData = data.response;
        $scope.hideError = false;
        drawGraph(data.response);
      })
      .error(function(data){
        console.log(data);
      })
    };

    var drawGraph = function(data){

      $(function () {
      $('#chart').highcharts({
        chart: {
          type: 'pie',
          options3d: {
            enabled: false,
            alpha: 45,
            beta: 0
          }
        },
        title: {
          text: '',
          align: 'left',
          verticalAlign: 'bottom',
          y: 0
        },
        tooltip: {
          pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
          pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            depth: 20,
            dataLabels: {
              enabled: true,
              distance: -50,
              style: {
                fontWeight: 'bold',
                color: 'white',
                textShadow: '0px 1px 2px black'
              }
            },
            startAngle: -90,
            endAngle: 270,
            center: ['50%', '50%']
          }
        },
        series: [{
          type: 'pie',
          name: 'Outgoes',
          innerSize: '0%',
          data: data
        }]
      });

      
      });
    };

    }])
}());
