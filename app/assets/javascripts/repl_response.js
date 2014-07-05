window.printError = function(msg) {
  $("#result").css("color", "red");
  $("#result").text(msg);
}

window.printResponse = function(msg) {
  $("#result").css("color", "black");
  $("#result").text(msg);
}

$(document).ready(function(e) {
  $("#result").text("Result")
});
