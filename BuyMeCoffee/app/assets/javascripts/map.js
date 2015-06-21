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

  function addMarkers(position){
    if(position){
      $scope.markers.$add({lat: position.coords.latitude + '',lng: position.coords.longitude + ''});
      $scope.markers.$save();
    }
  };
});

app.controller('LoginController', function($http, $scope){
  $scope.loginForm = function(){
    $http.get('/login').success(function(data){
      $('.this-form').append(data);
      document.getElementById('abc').style.display = "block";
    });
  };

  $scope.hideForm = function(){
    document.getElementById('abc').style.display = "none";
  }
});