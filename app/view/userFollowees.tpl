<div class = "wrapper">

  <!-- Main Content -->
  <div id="listContent">

    <!-- Fetch each row from the result and create div and its components for each post in the database -->
    <?php

    if (!$result) {
      echo('Your Followee List is Empty.');

    }
    else{

      while($row = mysql_fetch_assoc($result)):

      ?>

      <div class="col-1">

        <div class = "listItemInfo">
          <label class="yourItemsList"><?= $row['email'] ?></label>
        </div>

        <div class = "listItemInfo">
          <form action="<?= BASE_URL ?>/yourFavorites/delete/<?= $row['email'] ?>" method="POST" onsubmit="return deleteConfirmation();">
            <button  class ="modifyItemButton clickable" type="submit" > Remove From Followees </button>
          </form>

      </div>

    </div>

  <?php  endwhile;} ?>


</div>

</div>
