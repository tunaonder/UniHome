// LOAD ALL ITEM CONTENT FROM THE DATA STORED IN uniHome.js
$(document).ready(function () {
  //Get Item ID from local storage
  var itemId = localStorage.getItem('itemId');

  // Get Item Title
  $('#itemPageItemTitle').append(' > ' +itemTitleArray[itemId]);
  $('h2').append(itemTitleArray[itemId] + " -");

  //GET IMAGE NAME and show its directory
  var imageName = "./images/".concat(itemImageArray[itemId]);
  $('#itemImage').attr('src', imageName);
  $('#itemImage').attr('alt', imageName + 'Image');

  //Get other item data
  $('#itemPrice').append(itemPriceArray[itemId]);
  $('#itemCondition').append(itemConditionArray[itemId]);
  $('#itemDelivery').append(itemDeliveryArray[itemId]);
  $('#itemDescription').append(itemDescriptionArray[itemId]);

  //If user is logged in display contact information.
  if (sessionStorage.getItem('userLoggedIn') == 1){
    var contactInfo1 = "Name: Sait Onder";
    var contactInfo2 = "Email: saito@vt.edu";
    var contactInfo3 =  "Phone: 5054141363";
    $('#itemContactPerson1').append(contactInfo1);
    $('#itemContactPerson2').append(contactInfo2);
    $('#itemContactPerson3').append(contactInfo3);


  }
  else{
    var contactInfo = "You must login to view the contact information!"
    $('#itemContactPerson1').append(contactInfo);

  }
});

function addToFavs(){
  console.log('test');

}
