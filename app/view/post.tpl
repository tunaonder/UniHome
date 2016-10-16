<div class = "wrapper">
  <!-- Main Content -->
  <div class="mainContent">
    <div class="postItemContent">

      <!-- enctype defines form submits a file -->
      <form id="post-item" action="<?= BASE_URL ?>/post/postItem" method="POST" onSubmit="return postItem();" enctype="multipart/form-data">
        <div class="postItemLineContainer">
          <label>Category: </label>
          <select name ="category">
            <!-- <option value="vt">Roommates</option> -->
            <option value="For Sale">For Sale</option>
            <!-- <option value="nrc">Sublease</option> -->
          </select>
        </div>

        <div class="postItemLineContainer">
          <label>Type: </label>
          <select name="type">
            <option value="Furniture">Furniture</option>
            <option value="Electronic">Electronic</option>
            <option value="Clothing">Clothing</option>
            <option value="Misc">Misc</option>
          </select>
        </div>

        <div class="postItemLineContainer">
          <label>Title: </label>
          <input id="titleInput" name="title" type="text">
        </div>

        <div class="postItemLineContainer">
          <label>Description: </label>
          <textarea id="descriptionInput" name="description"rows="10" cols="30">

          </textarea>
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


        <div class="postItemLineContainer">
          <button class="contentButton" name="submit" type="submit" >Post!</button>
          <button class="contentButton" type="button" onClick="changePage('home');">Cancel</button>
        </div>

      </form>



      <div id="alertContainer3" ></div>

    </div>


  </div>
</div>
