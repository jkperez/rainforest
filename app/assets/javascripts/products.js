// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$( function() {
  $("#new_review").on("ajax:success", function(e, data, status, xhr) {
  	$("#reviews").append(xhr.responseText)
  	$("div#errors").html("")
  }).on("ajax:error", function(e, xhr, status, error) {
   	$("div#errors").html(xhr.responseText)
  })
})