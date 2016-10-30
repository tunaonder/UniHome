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
    //blacksburg,VA lat and lng for default location
    center: {lat: 37.23, lng: -80.41},
    zoom: 6
  });
  var infoWindow = new google.maps.InfoWindow({map: map});

  //geolocation
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      infoWindow.setPosition(pos);
      infoWindow.setContent('Your Location!');
      getAddressFromLatLang(pos.lat, pos.lng);

      map.setCenter(pos);
    }, function() {
      handleLocationError(true, infoWindow, map.getCenter());
    });
  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  }
  var geocoder = new google.maps.Geocoder();

  document.getElementById('submit').addEventListener('click', function() {
    geoResult = geocodeAddress(geocoder, map);
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

function getAddressFromLatLang(lat,lng, result){
  var geocoder = new google.maps.Geocoder();
    var latLng = new google.maps.LatLng(lat, lng);
    geocoder.geocode( { 'latLng': latLng}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      if (results[1]) {
        document.getElementById('address').value = results[1].formatted_address;
      }
    }else{
        alert("Geocode was not successful for the following reason: " + status);
    }
    });
}
