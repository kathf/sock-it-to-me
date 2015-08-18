//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap



$(window).load(function () {
  $(function() {
     $('.flash-container').delay(500).fadeIn('normal', function() {
        $(this).delay(1500).fadeOut();
     });
  });

  $( "#sock-upload-image" ).click(function( event ) {
    event.preventDefault();
    $( "#sock_avatar" ).click();
    $( "#sock_avatar" ).change(function() {
      console.log("selected");
      $( "#new_sock" ).submit();
    });
  });

  $( "#toe-separator" ).click(function( event ) {
    event.preventDefault();
    $( ".sock_toes_separator").toggleClass("hidden");
    $( ".sock_big_toe_separator").toggleClass("hidden");
  })

  $( "#heel-padding" ).click(function( event ) {
    event.preventDefault();
    $( ".sock_heel_padding").toggleClass("hidden");
  })

  $( ".sock_toes_separator" ).hover(function() {
    $( "#all-toe-image").toggleClass("hidden");
  });

  $( ".sock_big_toe_separator" ).hover(function() {
    $( "#big-toe-image").toggleClass("hidden");
  });

  $('#log-in').on("ajax:success", function(e, data, status, xhr) {
    $('#log-in-form').html(xhr.responseText);
    $('.nav-links').addClass("hidden");
  });

  $('#sign-up').on("ajax:success", function(e, data, status, xhr) {
    $('#log-in-form').html(xhr.responseText);
    $('.nav-links').addClass("hidden");
  });
})
