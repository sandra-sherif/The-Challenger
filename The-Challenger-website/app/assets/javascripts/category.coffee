# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $(".challenge_select").on "change", ->
    $.ajax
      url: "/category"
      type: "GET"
      dataType: "script"
      data:
        category: $(".challenge_select").val()