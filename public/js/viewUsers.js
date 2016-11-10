function deleteUser(id){
  $.post(
    baseURL+'/viewUsers/deleteUser',
    { 'userId': id },
    function(data) {


      if(data.userDeleted == 'true') {



         window.location.href = './viewUsers';


      }


      else if(data.userDeleted == 'false') {

      }


    },
    "json"
  );

}

function deleteConfirmation(id){

  if (confirm("Are you sure you want to delete this user?") ) {
    deleteUser(id);
  }




}
