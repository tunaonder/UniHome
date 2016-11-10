function updateUser(){

  var  pass = $('#pass1').val();
  var confirm = $('#pass2').val();
  var  name = $('#editName').val();
  var phone = $('#editPhone').val();

  if(pass.length < 4){
    alert('Password is too short!');
    return false;
  }
  else if(pass != confirm){
    alert('Passwords should match');
    return false;
  }
  else if(name == ''){
    alert('Please Enter a Name');
    return false;
  }
  else if(phone.length < 9){
    alert('Please Enter a Valid Phone number');
    return false;
  }
  else{
    return true;
  }




}
