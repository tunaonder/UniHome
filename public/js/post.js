


function postItem(){


  $('#titleInput').focus(function() {
    $('#titleInput').css('border-color', '');
    $('#descriptionInput').css('border-color', '');
    $('#priceInput').css('border-color', '');
  });
  $('#descriptionInput').focus(function() {
    $('#titleInput').css('border-color', '');
    $('#descriptionInput').css('border-color', '');
    $('#priceInput').css('border-color', '');
  });
  $('#priceInput').focus(function() {
    $('#titleInput').css('border-color', '');
    $('#descriptionInput').css('border-color', '');
    $('#priceInput').css('border-color', '');
  });


  var  title= $('#titleInput').val();
  var description = $('#descriptionInput').val();
  var price = $('#priceInput').val();
  var alert;

  var check1 = true;
  var check2 = true;

  //Check if email address contains '@' and ends with .com or .edu(just check if there are three letters after the final dot)
  if( title.length <= 5){
    alert = $('<div class="alert"> Title Is Too Short! </div>');


    //add the alert
    $('#alertContainer').prepend(alert);
    $(alert).fadeOut(2500);


    //make email input border red
    $('#titleInput').css('border-color', 'red');
    check1 = false;

  }
  //Check if password field is filled
  if (description.length <= 20){
    alert = $('<div class="alert"> Description Is Too Short! </div>');

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
