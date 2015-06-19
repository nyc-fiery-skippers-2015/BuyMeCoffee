var app = angular.module('AngularMaps', ["ngMap", "firebase"]);

var myBase = new Firebase('https://incandescent-torch-1712.firebaseio.com')

app.controller('MapCtrl', function($scope, $firebaseArray){

  var dbMarkers = $firebaseArray(myBase)
  $scope.markers = dbMarkers;

  $scope.getLocation = function(){
    navigator.geolocation.getCurrentPosition(function(position) {
      console.log(position)
      addMarkers(position)
    });
  };

  $scope.infoWindow = function(){
    var infowindow = new google.maps.InfoWindow()
    infowindow.setContent()
    infowindow.open($scope.map, this)
  };

  function addMarkers(position){
    if(position){
      $scope.markers.$add({lat: position.coords.latitude + '',lng: position.coords.longitude + ''});
      $scope.markers.$save();
    }
  };

});