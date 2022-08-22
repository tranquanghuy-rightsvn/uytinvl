document.addEventListener("turbolinks:load", () => {
  $("#error-message-signin").hide();

  $(".login-form .field input").focus(function(){
    $(".login-form .field input").css("border-color", "black");
    $("#error-message-signin").hide("slow");
  });

  $(".signup-form .field input").focus(function(){
    $(".signup-form .field input").css("border-color", "black");
  });

  $(".nav-item .session").click(function(){
    $(".login-form .field input").css("border-color", "black");
    $("#error-message-signin").hide();
    $(".singup-form .field input").css("border-color", "black");
  });

  $(".signup-click").click(function(){
    $('#modal-signin').modal('hide');
    $('#modal-signup').modal('show');
    $(".singup-form .field input").css("border-color", "black");
  });

  $(".signin-click").click(function(){
    $('#modal-signup').modal('hide');
    $('#modal-signin').modal('show');
    $("#error-message-signin").hide();
    $(".login-form .field input").css("border-color", "black");
  });
});
