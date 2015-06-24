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

  $scope.hide = function(){
    debugger
    document.getElementById('invites').style.display = 'none';
  }

  $scope.infoWindow = function(){
    marker = this
    var user = this.id
    $http.get('/users/' + user + '/card').success(function(data){
      var infowindow = new google.maps.InfoWindow({ maxWidth: 400 })
      infowindow.setContent("<div class='info-window'> " + data + '<button id=' + user + "" + ' class=popup>Invite</button>' + '</div>' + '<button data-id=' + user + ' class=popup1>Rate Me!</button></div>')
      infowindow.open($scope.map, marker)
    })
  };

  function addMarkers(){
    $http.get('/users.json').success(function(data){
      if(data){
        var marks = []
        for(var i=0; i<data.length; i++){
          if(data[i].latitude){
            marks.push({lat: data[i].latitude,lng: data[i].longitude, id: data[i].id});
          }
        }
        if($scope.markers !== marks){
          $scope.markers = marks;
        }
        // debugger
      }
    });
  };
  addMarkers();
  setInterval(addMarkers, 20000);
});