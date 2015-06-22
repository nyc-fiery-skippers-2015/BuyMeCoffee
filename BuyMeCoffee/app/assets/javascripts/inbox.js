$(document).ready(function(){
  $('#inbox_icon').on('click', inbox);

});

var inbox = function(event){
  event.preventDefault();
  $target = $(event.target);

  $.ajax({
    url: '/invitations',
    method: 'get'

  }).done(function(response){
    $('.this-form').append(response)
  }).fail(function(error){
    console.log(error)
  })
}


