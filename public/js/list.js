
function sortByPrice(val){

  //Sort Items BY PRICE: Type 1: Low To High, Type 2: High To Low
  if(val == 'lowToHigh'){
    var type = 1;
  }
  else if(val == 'highToLow'){
    var type = 2;
  }
  else{
    return;
  }


  $.get(
    baseURL+'/forSale/sortPosts',
    { 'type': type },
    function(data) {

      //If User is signed in display information fetched from json request accordingly
      if(data.status == 'available') {

        //CHECK IF STUDENT AND POST COUNTS ARE PLURAL OR NOT. SET CORRECT GRAMMER ACCORDINGLY
        if(data.studentCount < 2){
          $('#featuresLabel1').append('There is ' + data.studentCount + ' student from ' + data.university);
        }
        else{
          $('#featuresLabel1').append('There are ' + data.studentCount + ' students from ' + data.university);
        }

        if(data.postCount < 2){
          $('#featuresLabel2').append(data.postCount + ' item is for sale by students from ' + data.university);
        }
        else{
          $('#featuresLabel2').append(data.postCount + ' items are for sale by students from ' + data.university);
        }

        //http://wvns.images.worldnow.com/images/9386068_G.jpg
        //http://www.universityprimetime.com/wp-content/uploads/2015/08/radford-picture.jpg
        //https://www.theodysseyonline.com/an-open-letter-to-virginia-tech
        //http://www.owlguru.com/schools/wp-content/plugins/autoGrid/gallery/Roanoke-College-campus-pictures/image_20151115_090600.jpg
        $('#mainImage').attr('src', baseURL+'/public/images/'+data.university+'.jpg');
      }

      //If User is NOT Signed In Display General Info
      else if(data.status == 'unavailable') {
        setGuestInterface();

      }

    },
    "json"
  );





  $('#forSaleItemList').load(document.URL +  ' #forSaleItemList');
}
