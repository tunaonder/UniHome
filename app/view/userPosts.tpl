<div class = "wrapper">

  <!-- Main Content -->
  <div id="listContent">

    <?php while($row = mysql_fetch_assoc($result)): ?>





      <div class="col-1">

        <div class = "listItemInfo">
          <label class="yourItemsList"><?= $row['title'] ?></label>
        </div>
        <img src="<?= BASE_URL ?>/app/uploads/<?= $row['photoInfo'] ?>" alt="<?= $row['title'] ?>" />

        <div class = "listItemInfo">
          <form action="<?= BASE_URL ?>/yourPosts/edit/<?= $row['id'] ?>" method="POST">
            <button type="submit" > Edit</button>
          </form>
          <form action="<?= BASE_URL ?>/yourPosts/delete/<?= $row['id'] ?>" method="POST">
            <button type="submit" > Delete </button>
          </form>

        </div>




      </div>



    <?php endwhile; ?>


  </div>

</div>
