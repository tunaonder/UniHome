<div class = "wrapper">
  <!-- Main Content -->
  <div class="mainContent">
    <div class="postItemContent">

      <!-- enctype defines form submits a file -->
      <form id="post-item" action="<?= BASE_URL ?>/yourPosts/edit/<?= $post['id'] ?>/editPost" method="POST" onSubmit="return postItem();" enctype="multipart/form-data">
        <div class="postItemLineContainer">
          <label>Category: </label>
          <div class="fixedInfo">
            <label > <?= $post['category'] ?> </label>
          </div>
        </div>

        <div class="postItemLineContainer">
          <label>Type: </label>
          <div class="fixedInfo">
            <label > <?= $post['type'] ?> </label>
          </div>

        </div>

        <div class="postItemLineContainer">
          <label>Title: </label>
          <input id="titleInput" value="<?= $post['title'] ?>" name="editTitle" type="text">
        </div>

        <div class="postItemLineContainer">
          <label>Description: </label>
          <textarea id="descriptionInput" name="editDescription"rows="10" cols="30"><?= $post['description'] ?></textarea>
        </div>

        <div class="postItemLineContainer">
          <label>Price: </label>
          <input id="priceInput" value="<?= $post['price'] ?>" name="editPrice" type="text">
        </div>



        <div class="postItemLineContainer">
          <label>Condition: </label>
          <div class="fixedInfo">
            <label > <?= $post['conditionInfo'] ?> </label>
          </div>
        </div>


        <div class="postItemLineContainer">
          <label>Upload Photo: </label>
          <input type="file" name="fileInfo" size="25" />

        </div>

        <div class="postItemLineContainer">
          <label>Address: </label>
          <input id="addressInput" value="<?= $post['address'] ?>" name="editAddress" type="text">
        </div>


        <div class="postItemLineContainer">
          <button class="contentButton" name="submit" type="submit" >Edit</button>
          <button class="contentButton" type="button" onClick="document.location.href='<?= BASE_URL ?>/yourPosts'">Cancel</button>
        </div>

      </form>



      <div id="alertContainer3" ></div>

    </div>


  </div>
</div>
