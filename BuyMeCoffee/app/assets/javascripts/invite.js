$(document).ready(function(){
  $('.popup').on('click', popForm);
  $('.this-form').on('submit','.invite', getUserLocation);
  // $('.invite').on('submit', hideForm);
});

var savePos = function(user, position){
  var myData = user + '&' + $.param(position.coords)

  $.ajax({
    url: '/login',
    method: 'post',
    data: myData
  }).done(function(response){
    location.reload();
  }).fail(function(error){
    console.log(error)
  })
}

var getUserLocation = function(event){
  event.preventDefault();
  var $target = $(event.target);
  var userInput = $target.serialize();
  navigator.geolocation.getCurrentPosition(function(position){
    savePos(userInput, position)
  });

}

var hideForm = function(event){
  event.preventDefault();
  var $target = $(event.target);

  $.ajax({
    url: '/invitations',
    method: 'post',
    data: $target.serialize()
  }).done(function(response){
    document.getElementById('abc').style.display = "none";
  }).fail(function(error){
    console.log(error)
  })
}

var popForm = function(event){
  event.preventDefault();
  document.getElementById('abc').style.display = "block";
}
