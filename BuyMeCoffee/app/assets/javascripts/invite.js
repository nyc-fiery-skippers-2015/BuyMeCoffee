$(document).ready(function(){
  $('.popup').on('click', popForm);
  // $('.invite').on('submit', hideForm);
});

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
