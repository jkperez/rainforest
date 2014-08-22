// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$( function() {
  $("#new_review").on("ajax:success", function(e, data, status, xhr) {
  	$("#reviews").append(xhr.responseText)
  	$("#new-review").html("<h3>Thanks for your Review!</h3>")

  }).on("ajax:error", function(e, xhr, status, error) {
   	$("#review-errors").html(xhr.responseText)
  })
})