function userLogin(){

  //When email or password inputs are focused remove red border color
  $('#emailInput').focus(function() {
    $('#passwordInput').css('border-color', '');
    $('#emailInput').css('border-color', '');
  });
  $('#passwordInput').focus(function() {
    $('#passwordInput').css('border-color', '');
    $('#emailInput').css('border-color', '');
  });
  
  //Get Email and password value
  var email = $('#emailInput').val();
  var password = $('#passwordInput').val();
  var alert;

  var check1 = true;
  var check2 = true;

  //Check if email address contains '@' and ends with .com or .edu(just check if there are three letters after the final dot)
  if( email == '' ||email.indexOf('@') == -1 || (email.substring(email.lastIndexOf(".")+1)).length !== 3){
    alert = $('<div class="alert"> Error: Please enter a valid Email Address!</div>');


    //add the alert
    $('#alertContainer').prepend(alert);
    $(alert).fadeOut(2500);


    //make email input border red
    $('#emailInput').css('border-color', 'red');
    check1 = false;

  }
  //Check if password field is filled
  if (password == ''){
    alert = $('<div class="alert"> Error: Please enter a valid Password! </div>');

    //add the alert
    $('#alertContainer').prepend(alert);
    $(alert).fadeOut(2500);

    //make password input border red
    $('#passwordInput').css('border-color', 'red');
    check2 = false;

  }

  //If both email and password are valid, login
  if(check1 && check2){
    return true;
  }
  else {
    return false;
  }




}
