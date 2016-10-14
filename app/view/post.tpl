
<!-- Main Content -->
<div class="mainContent">
  <div class="postItemContent">

    <form id="post-item" action="<?= BASE_URL ?>/post/postItem" method="POST" onSubmit="return postItem();">
      <div class="postItemLineContainer">
        <label>Category: </label>
        <select name ="category">
          <!-- <option value="vt">Roommates</option> -->
          <option value="ru">For Sale</option>
          <!-- <option value="nrc">Sublease</option> -->
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
        <select name="condition">
          <option value="New">New</option>
          <option value="Used">Used</option>
        </select>
      </div>


      <div class="postItemLineContainer">
        <label>Upload Photo: </label>
        <input type='file' onchange="readURL(this);" />

      </div>

      <div class="postItemLineContainer">
        <button class="contentButton" type="button" onClick="postItem();">Post!</button>
        <button class="contentButton" type="button" onClick="changePage('home');">Cancel</button>
      </div>

    </form>





  </div>




</div>
