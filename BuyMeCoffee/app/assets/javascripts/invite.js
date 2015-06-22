$(document).ready(function(){
  $('.par').on('click','.popup', popForm);
  $('.this-form').on('submit','.invite', getUserLocation);
  // $('.invite').on('submit', hideForm);
  $('#login').on('click', loginForm);
  $('.par').on('click', '.inv-accept', acceptInvite);
  $('.par').on('click', '#accepted', acceptedInvites);
  $('.par').on('click', '#sent', sentInvites);
});

var sentInvites = function(event){
  document.getElementById('invites').style.display = 'block';
  document.getElementById('appoints').style.display = 'none';
}

var acceptedInvites = function(event){
  document.getElementById('invites').style.display = 'none';
  document.getElementById('appoints').style.display = 'block';
}

var acceptInvite = function(event){
  event.preventDefault();
  $target = $(event.target);
  var id = $target.data('id');

  $.ajax({
    url: '/invitations/' + id,
    method: 'put'

  }).done(function(response){
    location.reload()
  }).fail(function(error){
    console.log(error)
  })
}

var loginForm = function(event){
  event.preventDefault();
  $target = $(event.target);

  $.ajax({
    url: '/login',
    method: 'get'

  }).done(function(response){
    $('.this-form').append(response)
  }).fail(function(error){
    console.log(error)
  })
}

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
  $target = $(event.target);
  $('.user').val($target.attr('id'))
  document.getElementById('abc1').style.display = "block";
}
