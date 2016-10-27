
$(document).ready(function(){  
  $('#signUpEmailInput').blur(function(){
    console.log('blurred');
    var email = $(this).val();
    $.get(
      baseURL+'/signup/check',
      { 'email': email  },
      function(data){
         if(data.status == 'unavailable') {
           alert = $('<div class="alert"> This email is already taken </div>');
    //add the alert
    $('#alertContainer2').prepend(alert);
    $(alert).fadeOut(3500);
    //make password input border red
    $('#signUpEmailInput').css('border-color', 'red');
        }else if (data.status == 'available')
            {
                // Do something
                $('#signUpEmailInput').css('border-color', '');
            }
      },
      "json"
    );
  });

});




function userSignUp(){


  var name = $('#signUpNameInput').val();
  var email = $('#signUpEmailInput').val();
  var phone = $('#signUpPhoneInput').val();
  var password = $('#signUpPasswordInput').val();
  var confirm = $('#signUpConfirmInput').val();

  var nameValidate = true;
  var emailValidate = true;
  var phoneValidate = true;
  var passwordValidate = true;

  //Check if passwords match
  if(password != confirm){
    passwordValidate = false;
    alert = $('<div class="alert"> Error: Password and Confirm must match! </div>');

    //add the alert
    $('#alertContainer2').prepend(alert);
    $(alert).fadeOut(2500);

    //make email input border red
    $('#signUpPasswordInput').css('border-color', 'red');
    $('#signUpConfirmInput').css('border-color', 'red');


  }

  //Check if one of the fields are empty
  if (password == '' || confirm == ''){
    passwordValidate = false;
    alert = $('<div class="alert"> Error: Please fill both password fields </div>');

    //add the alert
    $('#alertContainer2').prepend(alert);
    $(alert).fadeOut(2500);

    //make email input border red
    $('#signUpPasswordInput').css('border-color', 'red');
    $('#signUpConfirmInput').css('border-color', 'red');


  }


  //Check if phone input has letter and correct length
  if (phone.match(/[a-z]/i) || phone.length != 10){
    phoneValidate = false;
    alert = $('<div class="alert"> Error: Please enter a valid Phone Number!</div>');

    //add the alert
    $('#alertContainer2').prepend(alert);
    $(alert).fadeOut(2500);

    //make email input border red
    $('#signUpPhoneInput').css('border-color', 'red');


  }

  //Check email input
  if(email == '' ||email.indexOf('@') == -1 || ((email.substring(email.lastIndexOf(".")+1)).length !== 3 &&
   (email.substring(email.lastIndexOf(".")+1)).length !== 2)){
    emailValidate = false;
    alert = $('<div class="alert"> Error: Please enter a valid Email Address!</div>');

    //add the alert
    $('#alertContainer2').prepend(alert);
    $(alert).fadeOut(2500);

    //make email input border red
    $('#signUpEmailInput').css('border-color', 'red');


  }

  //Check name input
  if (name == ''){
    nameValidate = false;
    alert = $('<div class="alert"> Error: Please enter your name </div>');
    //add the alert
    $('#alertContainer2').prepend(alert);
    $(alert).fadeOut(2500);
    //make password input border red
    $('#signUpNameInput').css('border-color', 'red');


  }

  //If one of the fields are focused remove red border color
  $('#signUpNameInput').focus(function() {
    $('#signUpNameInput').css('border-color', '');
    $('#signUpEmailInput').css('border-color', '');
    $('#signUpPhoneInput').css('border-color', '');
    $('#signUpPasswordInput').css('border-color', '');
    $('#signUpConfirmInput').css('border-color', '');
  });
  $('#signUpEmailInput').focus(function() {
    $('#signUpNameInput').css('border-color', '');
    $('#signUpEmailInput').css('border-color', '');
    $('#signUpPhoneInput').css('border-color', '');
    $('#signUpPasswordInput').css('border-color', '');
    $('#signUpConfirmInput').css('border-color', '');
  });
  $('#signUpPhoneInput').focus(function() {
    $('#signUpNameInput').css('border-color', '');
    $('#signUpEmailInput').css('border-color', '');
    $('#signUpPhoneInput').css('border-color', '');
    $('#signUpPasswordInput').css('border-color', '');
    $('#signUpConfirmInput').css('border-color', '');
  });
  $('#signUpPasswordInput').focus(function() {
    $('#signUpNameInput').css('border-color', '');
    $('#signUpEmailInput').css('border-color', '');
    $('#signUpPhoneInput').css('border-color', '');
    $('#signUpPasswordInput').css('border-color', '');
    $('#signUpConfirmInput').css('border-color', '');
  });
  $('#signUpConfirmInput').focus(function() {
    $('#signUpNameInput').css('border-color', '');
    $('#signUpEmailInput').css('border-color', '');
    $('#signUpPhoneInput').css('border-color', '');
    $('#signUpPasswordInput').css('border-color', '');
    $('#signUpConfirmInput').css('border-color', '');
  });

  if(nameValidate && emailValidate && phoneValidate && passwordValidate){
    return true;
  }
  else{
    return false;
  }

}
