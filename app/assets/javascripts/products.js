// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$( function() {
  $("#new_review").on("ajax:success", function(e, data, status, xhr) {
    $("#reviews").append(xhr.responseText)
  }).on("ajax:error", function(e, xhr, status, error) {
    $("#new_review").append("<p>ERROR</p>")
  })
})