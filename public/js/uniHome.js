$(document).ready(function(){

});

//Directs users to another page with the information of userLoggedIn
function changePage(page){
  if (page == 'login'){
    window.location.href = './login';
  }
  else if (page == 'signUp'){
    window.location.href = './signUp';
  }
  else if (page == 'post'){
    window.location.href = './post';
  }
  else if (page == 'home'){
    window.location.href = './';
  }
  else if(page == 'forSale'){
    window.location.href = './forSale';
  }
  else{
    alert("Currently this page does not exist. Sorry for the inconvenience!");
  }
}

function consoleLog(text){
  console.log(text);
  console.log("asdasdas");
}
