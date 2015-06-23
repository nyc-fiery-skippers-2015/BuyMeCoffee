$(document).ready(function(){
  $('.par').on('click','.popup', popForm);
  $('.this-form').on('submit','.invite', getUserLocation);
  $('#login').on('click', loginForm);
  $('.par').on('click', '.inv-accept', acceptInvite);
  $('.par').on('click', '#accepted', acceptedInvites);
  $('.par').on('click', '#sent', sentInvites);
  $('.par').on('click','.x-button', hideAllForms);
  $('.par').on('click','.x-button2', hideAllForms);
  $('body').on('click', '#logging', hideNav);
});

var hideNav = function(event){
  $('#cupnav').remove();
}

var hideAllForms = function(event){
  this.parentElement.parentElement.parentElement.remove()
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
    $('.this-form').append(response)
  }).fail(function(error){
    console.log(error)
  });
};

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
  });
};

var getUserLocation = function(event){
  event.preventDefault();
  var $target = $(event.target);
  var userInput = $target.serialize();
  navigator.geolocation.getCurrentPosition(function(position){
    savePos(userInput, position)
  });
};

var popForm = function(event){
  event.preventDefault();
  $target = $(event.target);
  $('.user').val($target.attr('id'))
  document.getElementById('abc1').style.display = "block";
};