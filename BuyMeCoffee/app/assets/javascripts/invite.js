$(document).ready(function(){
  $('.popup').on('click', popForm);
  $('#submit').on('click', hideForm);
});

var hideForm = function(event){
  event.preventDefault();
  document.getElementById('abc').style.display = "none";
}

var popForm = function(event){
  event.preventDefault();
  document.getElementById('abc').style.display = "block";
}
