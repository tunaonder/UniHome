<div class = "wrapper">

  <!-- Main Content -->
  <div id="listContent">

    <!-- Fetch each row from the result and create div and its components for each post in the database -->
    <?php

    if (!$result) {
      echo('Your Favorite List is Empty.');

    }
    else{

      while($row = mysql_fetch_assoc($result)):

      ?>

      <div class="col-1">

        <div class = "listItemInfo">
          <label class="yourItemsList"><?= $row['title'] ?></label>
        </div>
        <img src="<?= BASE_URL ?>/app/uploads/<?= $row['photoInfo'] ?>" alt="<?= $row['title'] ?>" />

        <div class = "listItemInfo">
          <form action="<?= BASE_URL ?>/yourFavorites/delete/<?= $row['id'] ?>" method="POST" onsubmit="return deleteConfirmation();">
            <button  class ="modifyItemButton clickable" type="submit" > Remove From Favorites </button>
          </form>

      </div>

    </div>

  <?php  endwhile;} ?>


</div>

</div>
