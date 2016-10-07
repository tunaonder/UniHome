

$(document).ready(function () {


  var newItem;

  for (var i = 0; i < itemTitleArray.length; i++) {
    //initialize new div for every item in the array
    newItem = document.createElement('div');
    //set class to div
    $(newItem).addClass('col-1');
    //add div to the list content div
    $(newItem).appendTo($("#listContent"));
    //add an item number to each div
    $(newItem).attr("itemNumber", i);
    //call itemSelected method every time an item is clicked
    $(newItem).click(function () {


      itemSelected($(this).attr('itemNumber'));
    })
    var price = "<label>".concat(itemPriceArray[i], "</label>");
    var itemPrice = $(price);
    itemPrice.addClass('listItemPrice');
    $(newItem).prepend(itemPrice);

    //Put the item description between label tags
    var title = "<label>".concat(itemTitleArray[i], "</label>");
    var itemTitle = $(title);
    //itemTitle has a class. This necassery for the styling
    itemTitle.addClass('listItemTitle');
    $(newItem).prepend(itemTitle);
    //Create a string for image location
    var imageName = "./images/".concat(itemImageArray[i]);
    //Create an image
    var img = $('<img>');
    img.attr('src', imageName);
    //Add image to the created div
    $(newItem).prepend(img);




  }
});

function itemSelected(item){
  localStorage.setItem('itemId',item);
  changePage('item');
}
