var app = angular.module('AngularMaps', ["ngMap"]);

app.directive('googleplace', function() {
  return {
    require: 'ngModel',
    link: function(scope, element, attrs, model) {
      var options = {
        types: [],
        componentRestrictions: {}
      };
      scope.gPlace = new google.maps.places.Autocomplete(element[0], options);

      google.maps.event.addListener(scope.gPlace, 'place_changed', function() {
          scope.$apply(function() {
              model.$setViewValue(element.val());
          });
      });
    }
  };
});

app.controller('MapCtrl', function($http, $scope){

  $scope.markers = [];

  function addMarkers(){
    $http.get('/users.json').success(function(data){
      if(data){
        for(var i=0; i<data.length; i++){
          if(data[i].latitude){
            $scope.markers.push({lat: data[i].latitude,lng: data[i].longitude, title: data[i].name});
          }
        }
      }
    });
  };
  // addMarkers();
  setInterval(addMarkers, 20000);
});