<?php
include_once '../global.php';
$type = $_POST['type'];
$result = Post::getPostsSortByPrice($type);
while($row = mysql_fetch_assoc($result)): ?>


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
