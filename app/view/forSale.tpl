<!-- PS4 IMAGE SOURCE: http://money.cnn.com/video/technology/2013/12/06/t-sony-playstation-4-ps4-review.cnnmoney/
VTTSHIRT IMAGE SOURCE: http://basketballchoices.com/?cat=40
IPHONE IMAGE SOURCE: http://truza.com/technology
Coffe Machine Image Source: http://arbtalk.co.uk/forum/general-chat/51766-what-s-best-home-coffee-machine-8.html
Drawer Image Source: http://home.50kz.com/second-hand-furniture-cork/
Shoe Image Source: http://winnischneider.com/textil-recycling/blog/shoes-grade-a/ -->


<div class = "wrapper item-list">

  <!-- Main Content -->


<?php if($pageName == 'For Sale' && $userType =='Admin'): ?>
    <div id="createContainer">
        <button id="createButton" class="clickable" type="button" name="create" >Create</button>
        <form id="post-item" method="POST" enctype="multipart/form-data">

            <div class="createItemContainer">
              <label>Title: </label>
              <input  id="category" type="hidden" name="category" value="For Sale">
              <input id="createTitle" name="title" type="text">
            </div>

            <div class="createItemContainer">
              <label class="newLine">Description: </label>
              <textarea id="createDescription" name="description"rows="10" cols="30"></textarea>
            </div>

            <div class="createItemContainer">
              <label>Type: </label>
              <select id="createItemType" name="type">
                <option value="Furniture">Furniture</option>
                <option value="Electronic">Electronic</option>
                <option value="Clothing">Clothing</option>
                <option value="Household">Household</option>
                <option value="Misc">Misc</option>
              </select>
            </div>

            <div class="createItemContainer">
              <label>Price: </label>
              <input id="createPrice" name="price" type="text">
            </div>



            <div class="createItemContainer">
              <label>Condition: </label>
              <select id="condition" name="conditionInfo">
                <option value="New">New</option>
                <option value="Used">Used</option>
              </select>
            </div>

            <div class="createItemContainer">
              <button class="contentButton" name="submit" type="submit" >Submit</button>
            </div>
        </form>
    </div>

    <div id="editContainer">
        <form id="editItemForm" method="POST" action="<?= BASE_URL ?>/post/editTitle/">
      <label>Title: <input type="text" id="editTitle" class="disabled" name="title" value=""></label>

      <div class="postItemLineContainer pad disabled">
          <label>Description: </label>
          <textarea id="descriptionInput" class="disabled" name="description"rows="10" cols="30" value=""></textarea>
       </div>

        <div class="postItemLineContainer pad disabled">
          <label>Type: </label>
          <select id="postItemType" name="type" class="disabled">
            <option value="Furniture">Furniture</option>
            <option value="Electronic">Electronic</option>
            <option value="Clothing">Clothing</option>
            <option value="Household">Household</option>
            <option value="Misc">Misc</option>
          </select>
        </div>

        <div class="postItemLineContainer pad disabled">
          <label>Price: </label>
          <input id="priceInput" name="price" class="disabled" type="text">
         </div>

      <input  type="hidden" id="editID" name="postID" value="">
        <button  id="editButton" class="clickable pad" type="button" name="edit">Edit</button>

            <button id="saveEdit" class="clickable hidden-item pad" type="submit" name="save">Save</button>

      </form>
      <form id="deleteItemForm" method="POST" >
      <button id ="deleteButton" class="clickable pad" type="submit" name="delete">Delete</button>
     </form>
    </div>

       <div class="dataViz-container">
         <script type="text/javascript" src="<?= BASE_URL ?>/public/js/vizData.js"></script>
      </div>


  <?php endif; ?>

  <div id="listContent" >


    <hr>
    <div id="forSaleSelectsDiv">
      <label class="forSaleLabel">Sort By: </label>
      <select id="selectSortBy" class="forSaleSelect" name="selectSortBy" onchange="sortByPrice(this.value);">
        <option value="recentFirst"> Date </option>
        <option value="lowToHigh">Price Low To High</option>
        <option value="highToLow">Price High To Low</option>

      </select>
      <label class="forSaleLabel">Select Category: </label>
      <select id="selectCategoryForSale" class="forSaleSelect" name="selectCategoryForSale" onchange="selectType(this.value);">
        <option value="All Posts"> All </option>
        <option value="Furniture">Furniture</option>
        <option value="Electronic">Electronic</option>
        <option value="Clothing">Clothing</option>
        <option value="Misc">Misc</option>
        <option value="Household">Household</option>
      </select>

      <label class="forSaleLabel">Select University: </label>
      <select id="selectUniversityForSale" class="forSaleSelect" name="selectUniversityForSale" onchange="selectUniversity(this.value);">
        <option value="All"> All </option>
        <option value="Virginia Tech">Virginia Tech</option>
        <option value="Radford University">Radford University</option>
        <option value="Roanoke College">Roanoke College</option>
        <option value="New River College">New River College</option>
      </select>
    </div>
    <hr>

    <div id="forSaleItemList">
      <!-- Fetch each row from the result and create div and its components for each post in the database -->
      <?php while($row = mysql_fetch_assoc($result)): ?>


        <a href="<?= BASE_URL ?>/forSale/view/<?= $row['id'] ?>">
          <div class="col-1">
            <img src="<?= BASE_URL ?>/app/uploads/<?= $row['photoInfo'] ?>" alt="<?= $row['title'] ?>" />

            <div class = "listItemInfo">
              <label class="listItemTitle clickable"><?= $row['title'] ?></label>
              <label class="listItemPrice clickable">$<?= $row['price'] ?></label>
            </div>
          </a>

        </div>

      <?php endwhile; ?>
    </div>

  </div>

</div>
