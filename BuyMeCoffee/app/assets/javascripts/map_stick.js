

$(document).ready(function(){

function detectBrowser() {
  var useragent = navigator.userAgent;
  var mapdiv = document.getElementById("this-map");

  if (useragent.indexOf('iPhone') != -1 || useragent.indexOf('Android') != -1 ) {
    mapdiv.style.width = '100%';
    mapdiv.style.height = '70%';
  } else {
    mapdiv.style.width = '100%';
    mapdiv.style.height = '650px';
  }
}

});
