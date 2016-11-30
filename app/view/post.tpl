<div class = "wrapper">
  <!-- Main Content -->
  <div class="mainContent">
    <div class="postItemContent">

      <!-- enctype defines form submits a file -->
      <form id="post-item" action="<?= BASE_URL ?>/post/postItem" method="POST" onSubmit="return postItem();" enctype="multipart/form-data">
        <!-- <div class="postItemLineContainer">
          <label>Category: </label>
          <select name ="category"  onclick="alert('Currently only avaiable category is For Sale');">

            <option value="For Sale">For Sale</option>
          </select>
        </div> -->

        <div class="postItemLineContainer">
          <label>Type: </label>
          <select name="type" style="font-size: 16px;">
            <option value="Furniture">Furniture</option>
            <option value="Electronic">Electronic</option>
            <option value="Clothing">Clothing</option>
            <option value="Misc">Misc</option>
            <option value="Household">Household</option>
          </select>
        </div>

        <div class="postItemLineContainer">
          <label>Title: </label>
          <input id="titleInput" name="title" type="text">
        </div>

        <div class="postItemLineContainer">
          <label>Description: </label>
          <textarea id="descriptionInput" name="description"rows="10" cols="30"></textarea>
        </div>

        <div class="postItemLineContainer">
          <label>Price: </label>
          <input id="priceInput" name="price" type="text">
        </div>



        <div class="postItemLineContainer">
          <label>Condition: </label>
          <select name="conditionInfo">
            <option value="New">New</option>
            <option value="Used">Used</option>
          </select>
        </div>


        <div class="postItemLineContainer">
          <label>Upload Photo: </label>
          <input type="file" name="fileInfo" size="25" />

        </div>

        <!-- <div class="postItemLineContainer" id="floating-panel"> -->
        <div class="postItemLineContainer">
          <label>Address: </label>
          <textarea id="address" name="address" rows="3" cols="30"></textarea>
          <input id="submit" type="button" value="Find on Map">
        </div>
        <div id="map"></div>
        <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvzbGNUXp2lX_QOiX8LjIW144pggtYcQ8&callback=initMap">
        </script>


        <div class="postItemLineContainer">
          <button class="contentButton" name="submit" type="submit" >Post</button>
          <button class="contentButton" type="button" onClick="document.location.href='<?= BASE_URL ?>'">Cancel</button>
        </div>

      </form>



      <div id="alertContainer3" ></div>

    </div>


  </div>
</div>
