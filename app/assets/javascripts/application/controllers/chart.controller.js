(function () {

    "use strict";

    angular.module('main').controller('ChartCtrl', [ '$scope', '$state',
        function($scope, $state) {

            $(function () {
              $('#chart').highcharts({
                  chart: {
                      plotBackgroundColor: null,
                      plotBorderWidth: 0,
                      plotShadow: false
                  },
                  title: {
                      text: '2015',
                      align: 'center',
                      verticalAlign: 'middle',
                      y: 40
                  },
                  tooltip: {
                      pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                  },
                  plotOptions: {
                      pie: {
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
                          endAngle: 90,
                          center: ['50%', '75%']
                      }
                  },
                  series: [{
                      type: 'pie',
                      name: 'Outgoes',
                      innerSize: '50%',
                      data: [
                          ['Lunch',   10.38],
                          ['Other',       56.33],
                          ['Transport', 24.03],
                          ['Products',    4.77],
                          ['blabla',     0.91],
                          // {
                          //     name: 'Proprietary or Undetectable',
                          //     y: 0.2,
                          //     dataLabels: {
                          //         enabled: false
                          //     }
                          // }
                      ]
                  }]
              });
          });



        }])
}());
