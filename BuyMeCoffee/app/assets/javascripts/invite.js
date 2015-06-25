$(document).ready(function(){
  $('.par').on('click','.popup', popForm);
  $('.this-form').on('submit','.invite', getUserLocation);
  $('#logging').on('click', loginForm);
  $('.par').on('click', '.inv-accept', acceptInvite);
  $('.par').on('click', '#accepted', acceptedInvites);
  $('.par').on('click', '#sent', sentInvites);
  $('.par').on('click','.x-button', hideAllForms);
  $('.par').on('click','.x-button2', hideAllForms);
});


var hideAllForms = function(event){
  $('.flash-error').remove();
  $('#abc').remove();
  event.preventDefault();
  document.getElementById('abc1').style.display = 'none';
};

var sentInvites = function(event){
  document.getElementById('invites').style.display = 'block';
  document.getElementById('appoints').style.display = 'none';
};

var acceptedInvites = function(event){
  document.getElementById('invites').style.display = 'none';
  document.getElementById('appoints').style.display = 'block';
};

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
  });
};

var loginForm = function(event){
  event.preventDefault();
  $target = $(event.target);

  $.ajax({
    url: '/login',
    method: 'get'

  }).done(function(response){
    $('.sliding-panel-content,.sliding-panel-fade-screen').toggleClass('is-visible');
    $('.this-form').append(response)
    document.getElementById('abc').style.display = 'block'
  }).fail(function(error){
    console.log(error)
  });
};

var updatePos = function(position){
  var posData = $.param(position.coords)

  $.ajax({
    url: '/users/pos',
    method: 'patch',
    data: posData,
    dataType: 'json'

  }).done(function(response){
    console.log('success');
  }).fail(function(error){
    console.log(error);
  });
};

var updateUserLocation = function(){
  navigator.geolocation.watchPosition(function(position){
    updatePos(position)
  });
};

var savePos = function(user, position){
  var myData = user + '&' + $.param(position.coords)

  $.ajax({
    url: '/login',
    method: 'post',
    data: myData
  }).done(function(response){
    $('.this-form').append(response)
    location.reload()
  }).fail(function(error){
    console.log(error)
  });
};

var getUserLocation = function(event){
  event.preventDefault();
  var $target = $(event.target);
  userInput = $target.serialize();
  navigator.geolocation.watchPosition(success, failure, { enableHighAccuracy: true, timeout: 10000, maximumAge: 10000 })
};

var failure = function(error){
  console.log(error)
}

var success = function(position){
    savePos(userInput, position)
};
var popForm = function(event){
  event.preventDefault();
  $target = $(event.target);
  $.ajax({
    url: '/invitations/new',
    method: 'get',

  }).done(function(response){
    if(response.good === 'togo'){
      $('.user').val($target.attr('id'));
      document.getElementById('abc1').style.display = "block";
    } else{
      $('.this-form').append(response);
    }
  }).fail(function(error){
    console.log(error);
  });

};