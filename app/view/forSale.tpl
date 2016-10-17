<div class = "wrapper">

  <!-- Main Content -->
  <div id="listContent">

    <?php while($row = mysql_fetch_assoc($result)): ?>


      <a href="<?= BASE_URL ?>/forSale/view/<?= $row['id'] ?>">
        <div class="col-1">
          <img src="<?= BASE_URL ?>/app/uploads/<?= $row['photoInfo'] ?>" alt="<?= $row['title'] ?>" />

          <div class = "listItemInfo">
            <label class="listItemTitle"><?= $row['title'] ?></label>
            <label class="listItemPrice">$<?= $row['price'] ?></label>
          </div>
        </a>

      </div>

    <?php endwhile; ?>


  </div>

</div>
