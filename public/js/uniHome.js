//PS4 IMAGE SOURCE: http://money.cnn.com/video/technology/2013/12/06/t-sony-playstation-4-ps4-review.cnnmoney/
//VTTSHIRT IMAGE SOURCE: http://basketballchoices.com/?cat=40
//IPHONE IMAGE SOURCE: http://truza.com/technology
//Coffe Machine Image Source: http://arbtalk.co.uk/forum/general-chat/51766-what-s-best-home-coffee-machine-8.html
//Drawer Image Source: http://home.50kz.com/second-hand-furniture-cork/
//Shoe Image Source: http://winnischneider.com/textil-recycling/blog/shoes-grade-a/

//CREATE ITEM INFORMATION
var itemImageArray = ["iphone.jpg", "vtshirt.jpg", "ps4.jpg", "coffemachine.jpg", "drawer.jpg", "shoe.jpg"];
var itemTitleArray = ["Iphone 5s, has no problem!", "Brand New VT shirt", "PS 4 Refurbished. Good Condition", "Coffe Machine, less than 1 year old!", "High Quality Drawer!", "Adidas Outdoor for cheap price!"];
var itemPriceArray = ["$120", "$29", "$200", "$30", "$220", "$75"];
var itemConditionArray = ["Used", "New", "Used", "Used", "Used", "Used"];
var itemDeliveryArray = ["Pick Up Only", "Cargo/Pick Up", "Cargo", "Pick Up Only", "Pick Up Only", "Cargo/Pick Up"];
var itemDescription1 = "This Phone works perfectly without any problems!. There are just a few scratches, but it is perfectly normal for 2 years old phone! It has been generally used with a case and screen protector";
var itemDescription2 = "Brand New VIRGINIA TECH FROM NIKE! %100 Cotton. Price is negotiable! You can text me a message!"
var itemDescription3 = "This ps4 is only 3 months old! Bought refurbished, but couldnt find enough time to play. Three games will be given with the console for free(GTA 5, FIFA 2016, Witcher 3). If you dont want the games, price can be $150!"
var itemDescription4 = "Perfect quality German Product! Almost 1 year old, but looks like brand new! If you like coffee, Bosch Tossimo is for you! Less than half price of a brand new one."
var itemDescription5 = "Only reason I sell this drawer is I graduated and going to leave Blacksburg in a week! Must be picked up ASAP. Price can be negotiable."
var itemDescription6 = "After I bought these nice pair of shoes, I realized that they dont fit well to me. Its size is 9 US. I am selling this $50 cheaper than the original price. Call me!"

var itemDescriptionArray = [];
itemDescriptionArray.push(itemDescription1);
itemDescriptionArray.push(itemDescription2);
itemDescriptionArray.push(itemDescription3);
itemDescriptionArray.push(itemDescription4);
itemDescriptionArray.push(itemDescription5);
itemDescriptionArray.push(itemDescription6);


// Variables to display page title and details
//Their values are assigned according to user state(logged in or not logged in)
var title;
var st1;
var st2;
var st3;
var st4;


// Run When page is ready
$(document).ready(function () {
  // Add header template to the div with header id
  $(function(){

    //If user is logged in, create content accordingly
    if (sessionStorage.getItem('userLoggedIn') == 1){
      //If user logged in display logged in header
      $("#header").load("templates/header2.html");
      //Following Image source is:
      //https://www.theodysseyonline.com/an-open-letter-to-virginia-tech
      $('#mainImage').attr('src', "./images/vt.jpg");

      title = "Welcome Kurt Luther! -"
      $('#featuresTitle').append(title);


      st1 = "There are 39 students from Virgina Tech using UniHome! ";
      st2 = "There are 6 items for sale!";
      st3 = "0 students from Virgina Tech are looking for roommates!";
      st4 = "0 Virginia Tech students are subleasing their place!";

      $('#featuresLabel1').append(st1);
      $('#featuresLabel2').append(st2);
      $('#featuresLabel3').append(st3);
      $('#featuresLabel4').append(st4);


    }
    else{
      $("#header").load("templates/header.html");
      $('#mainImage').attr('src', "./images/student-house.jpg");

      title = "Explore UniHome Features! -";
      $('#featuresTitle').append(title);


      st1 = "Meet all of your housing needs by connecting other university students!";
      st2 = "Find Roommates from your university!";
      st3 = "Buy and Sell your goods in a fast way!";
      st4 = "Sublease your rooms!";

      $('#featuresLabel1').append(st1);
      $('#featuresLabel2').append(st2);
      $('#featuresLabel3').append(st3);
      $('#featuresLabel4').append(st4);
    }

    //Display navigator and footer in all pages
    $("#footer").load("templates/footer.html");
    $("#navigator").load("templates/navigator.html");

  });
});

function userLogin(){
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
    //Direct user to the home page with the login information which is 1
    sessionStorage.setItem('userLoggedIn',1);
    changePage('home');
  }


  //When email or password inputs are focused remove red border color
  $('#emailInput').focus(function() {
    $('#passwordInput').css('border-color', '');
    $('#emailInput').css('border-color', '');
  });
  $('#passwordInput').focus(function() {
    $('#passwordInput').css('border-color', '');
    $('#emailInput').css('border-color', '');
  });

}

function userSignUp(){

  //User automatically logs in
  sessionStorage.setItem('userLoggedIn',1);

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
  if(email == '' ||email.indexOf('@') == -1 || (email.substring(email.lastIndexOf(".")+1)).length !== 3){
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

  if(nameValidate && emailValidate && phoneValidate && passwordValidate){
    //Direct user to the home page with the login information which is 1
    sessionStorage.setItem('userLoggedIn',1);
    changePage('home');
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




}


function userLogOut(){
  //User not logged in anymore
  sessionStorage.setItem('userLoggedIn',0);

  var myUrl = document.location.href;
  var userPageName = myUrl.substring(myUrl.lastIndexOf("/")+1);

  //If User is already in the index page change the header
  if (userPageName == 'index.html'){
    //If already in the home page refresh it.
    location.reload();
  }
  //If user in another page go to home page
  else{
    changePage('home');
  };

}

//Directs users to another page with the information of userLoggedIn
function changePage(page){
  if (page == 'post'){
    window.location.href = './postItem.html';
  }
  else if (page == 'home'){
    window.location.href = './index.html';
  }
  else if(page == 'forSale'){
    window.location.href = './forSale.html';
  }
  else if(page == 'roommates'){
    window.location.href = './roommates.html';
  }
  else if(page == 'sublease'){
    window.location.href = './sublease.html' + '#';
  }
  else if(page == 'item'){
    window.location.href = './item.html';
  }
  else{
    alert("Currently this page does not exist. Sorry for the inconvenience!");
  }
}

//Currently cannot post item
function postItem(){
  alert("Oopss something is wrong! You cannot create new post right now.");

}
