(function () {
  'use strict';
  angular.module('main').factory('CategoriesFactory', ['$http', function($http){
    return {
      all: function() {
        return $http.get('/categories');
      },
      createCategory: function(name) {
        return $http.post('/categories', {category: {name: name}});
      }
    };
  }])
}());