(function () {

    "use strict";

    angular.module('main').controller('TestCtrl', [ '$scope', '$state',
        function($scope, $state) {

            $scope.list = [
            	{id: 1, name: 'first'},
            	{id: 2, name: 'second'},
            	{id: 3, name: 'third'},
            	{id: 4, name: 'fourth'},
            	{id: 5, name: 'fifth'}
            ];

            $scope.list2 = [
            	{id: 1, name: 'first'},
            	{id: 2, name: 'second'},
            	{id: 3, name: 'third'},
            	{id: 4, name: 'fourth'},
            	{id: 5, name: 'fifth'}
            ];

            $scope.slides = [ 
            									{"image": "https://www.wonderplugin.com/wp-content/plugins/wonderplugin-lightbox/images/demo-image0.jpg",
            									 "text": "hello"}, 
            									{"image": "http://www.gettyimages.in/gi-resources/images/Homepage/Category-Creative/UK/UK_Creative_462809583.jpg",
            									 "text": "jhkghjfgjh"},
            									{"image": "http://www.gettyimages.co.uk/landing/assets/static_content/home/109393787_birds.jpg",
            									 "text": "//placekitten.com/"},
            								];

        }])
}());
