# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.

# You can use CoffeeScript in this file: http://coffeescript.org/
#
$(document).ready ->
  setInterval ->
    $("td:contains('Pass')").css("color", "green");
    $("td:contains('Pass')").css("font-weight", "bold");
    $("td:contains('Failed')").css("color", "red");
    $("td:contains('Failed')").css("font-weight", "bold");
    $("td:contains('Failed')").fadeOut(400).fadeIn(400)
    $("td:contains('Correct')").css("color", "green");
    $("td:contains('Correct')").css("font-weight", "bold");
    $("td:contains('Incorrect')").css("color", "red");
    $("td:contains('Incorrect')").css("font-weight", "bold");
    $("td:contains('Incorrect')").fadeOut(400).fadeIn(400)
  , 1000;
