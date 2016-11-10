function deleteUser(id){

  var userId = $('#userId').val();
  if(id == userId){
    alert("Admin account cannot be deleted");
    return;
  }


  $.post(
    baseURL+'/viewUsers/deleteUser',
    { 'userId': id },
    function(data) {


      if(data.userDeleted == 'true') {



         window.location.href = './viewUsers';


      }


      else if(data.userDeleted == 'false') {
          alert("User deletation is failed");
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

function changeUserRole(id, userType){
  var userId = $('#userId').val();
  if(id == userId){
    alert('Your cannot change your role');
    return;
  }

  $.post(

    baseURL+'/viewUsers/changeUserRole',
    { 'userId': id, 'userType': userType },
    function(data) {


      if(data.userRoleChange == 'true') {

         window.location.href = './viewUsers';

      }

      else if(data.userRoleChange == 'false') {

          alert("User deletation is failed");
      }


    },
    "json"
  );




}
