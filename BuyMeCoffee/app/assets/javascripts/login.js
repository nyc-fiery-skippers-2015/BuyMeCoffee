$(document).ready(function(){
  $('#login').on('click', loginForm);

});

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

