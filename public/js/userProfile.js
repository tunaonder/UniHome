function deleteUser(id){



  $.post(
    baseURL+'/userProfile/deleteUserOwnAccount',
    { 'userId': id },
    function(data) {


      if(data.userDeleted == 'true') {
        window.location.href = './';
      }
      else if(data.userDeleted == 'false') {
          alert("User deletion is failed");
      }

    },
    "json"
  );

}

function deleteConfirmation(id){

  if (confirm("Are you sure you want to delete your account?") ) {
    deleteUser(id);
  }




}
