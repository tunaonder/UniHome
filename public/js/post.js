


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
  var check3 = true;


  if( title.length <= 5){
    alert = $('<div class="alert"> Title Is Too Short! </div>');


    //add the alert
    $('#alertContainer3').prepend(alert);
    $(alert).fadeOut(2500);


    //make email input border red
    $('#titleInput').css('border-color', 'red');
    check1 = false;

  }

  if (description.length <= 20){
    alert = $('<div class="alert"> Description Is Too Short! </div>');

    //add the alert
    $('#alertContainer3').prepend(alert);
    $(alert).fadeOut(2500);

    //make password input border red
    $('#descriptionInput').css('border-color', 'red');
    check2 = false;

  }

  if (price == "" || (price.match(/[a-z]/i))){
    alert = $('<div class="alert"> Please Enter A Valid Price </div>');

    //add the alert
    $('#alertContainer3').prepend(alert);
    $(alert).fadeOut(2500);

    //make password input border red
    $('#priceInput').css('border-color', 'red');
    check3 = false;

  }


  if(check1 && check2 && check3){

    return true;
  }
  else {
    return false;
  }




}


function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 8,
    center: {lat: -34.397, lng: 150.644}
  });
  var geocoder = new google.maps.Geocoder();

  document.getElementById('submit').addEventListener('click', function() {
    geocodeAddress(geocoder, map);
  });
}

function geocodeAddress(geocoder, resultsMap) {
  var address = document.getElementById('address').value;
  geocoder.geocode({'address': address}, function(results, status) {
    if (status === 'OK') {
      resultsMap.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
        map: resultsMap,
        position: results[0].geometry.location
      });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}
