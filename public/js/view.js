// Run When page is ready
$(document).ready(function () {

  //This function Checks if User follows the current item
  $(function(){

    var userId = $('#userId').val();


    //If user did not login, do not do any user control
    if(userId == 0){
      return;
    }

      var postId = $('#postId').val();

      $.get(
        baseURL+'/forSale/view/'+postId+'/checkFav',
        { 'userId': userId, 'pid': postId },
        function(data) {

          //If User is signed in display information fetched from json request accordingly
          if(data.status == 'followed') {
            $('#favInfo').css('display', 'block');
            $('#favButton').css('display', 'none');


          }

          //If User is NOT Signed In Display General Info
          else if(data.status == 'unfollowed') {
            $('#favInfo').css('display', 'none');
            $('#favButton').css('display', 'block');
          }

        },
        "json"
      );

  });
});


function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    //blacksburg,VA lat and lng for default location
    center: {lat: 37.23, lng: -80.41},
    zoom: 6
  });

  var geocoder = new google.maps.Geocoder();

  geocodeAddress(geocoder, map);
}

function geocodeAddress(geocoder, resultsMap) {
  var address = document.getElementById('itemAddress').innerHTML;
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

function addToFavs(){
  //Get Used Id From HTML hidden value to set as a json request parameter
  var userId = $('#userId').val();
  var postId = $('#postId').val();


  $.post(
    baseURL+'/forSale/view/'+postId+'/addToFavs',
    { 'userId': userId, 'pid': postId },
    function(data) {

      //If User is signed in display information fetched from json request accordingly
      if(data.status == 'available') {
        $('#favInfo').css('display', 'block');
        $('#favButton').css('display', 'none');
      }

      //If User is NOT Signed In Display General Info
      else if(data.status == 'unavailable') {
        $('#favInfo').css('display', 'none');
        $('#favButton').css('display', 'block');
      }

    },
    "json"
  );


}
