$(document).ready(pageListener);

function pageListener(){
  $('#about-click').on('click', aboutListener);
  $('#overlay').on('click', overlayListener)
};

var aboutListener = function(e){
  e.preventDefault();
  $('#overlay').show();
  $("body").addClass("modal-open");
  $('#about-modal').fadeIn([2]);
}

var overlayListener = function(){
  $('#about-modal').hide();
    $("body").removeClass("modal-open")
  $('#overlay').hide();
  }