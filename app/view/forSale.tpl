<div class = "wrapper">

<!-- Main Content -->
<div id="listContent">

  <?php while($row = mysql_fetch_assoc($result)): ?>

  <form action="<?= BASE_URL ?>/shirts/edit/<?= $row['id'] ?>" method="POST">


    <a href="<?= BASE_URL ?>/forSale/view/<?= $row['id'] ?>">
      <div class="col-1">
      <img src="<?= BASE_URL ?>/app/uploads/<?= $row['photoInfo'] ?>" alt="<?= $row['title'] ?>" />

      <div class = "listItemInfo">
        <label class="listItemTitle"><?= $row['title'] ?></label>
        <label class="listItemPrice">$<?= $row['price'] ?></label>
      </div>
    </a>



  </div>

  </form>

  <?php endwhile; ?>


</div>

</div>
