
function sortByPrice(val){

  //Sort Items BY PRICE: Type 1: Low To High, Type 2: High To Low
  if(val == 'lowToHigh'){
    var type = 1;
  }
  else if(val == 'highToLow'){
    var type = 2;
  }
  else if(val == 'recentFirst'){
    var type = 3;
  }
  else{
    return;
  }


  $.post(
    baseURL+'/app/model/sortList.class.php', // location of php script
    { type: type },
    function( data ){
        $( "#forSaleItemList" ).empty(); // Delete previos content
        $( '#forSaleItemList').append( data );
        //Change value of other select box
        $( '#selectCategoryForSale').val('All Posts');


    });

}

function selectType(type){
  $.post(
    baseURL+'/app/model/selectPostType.class.php', // location of php script
    { type: type },
    function( data ){
        $( "#forSaleItemList" ).empty(); // Delete previos content
        $( '#forSaleItemList').append( data );
        //Change value of other select box
        $( '#selectSortBy').val('recentFirst');

    });
}
