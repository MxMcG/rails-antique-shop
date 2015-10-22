$(document).ready(function() {
  var numDivs = $('#products-grouping').children().length;
  console.log(numDivs)
  for (var i = 1; i < numDivs ; i += 3){
    $('.products-item:nth-child(' + i + ')').css({"margin-left" : "0px"});
  }
})
// loop
// .col nth-child.css("margin-left", "0")



