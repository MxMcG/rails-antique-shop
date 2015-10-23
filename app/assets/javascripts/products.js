// left column
var alignLeftColumn = function() {
  var numDivs = $('#products-grouping').children().length;
  console.log(numDivs)
  for (var i = 1; i < numDivs ; i += 3){
    $('.products-item:nth-child(' + i + ')').css({"margin-left" : "0px"});
  }
}

var descriptionHover = function(){
  $(".products-item").hover(function(){
    $(this).css({"background": "linear-gradient(rgba(0, 0, 0, .8), rgba(0, 0, 0, .8)", "z-index": "10"})
  })
}


$(document).ready(function() {
    alignLeftColumn();
    // descriptionHover();
});

$(document).on('page:change', function() {
    alignLeftColumn();
    // descriptionHover();
});




