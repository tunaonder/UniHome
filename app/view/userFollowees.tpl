<div class = "wrapper">
  <!-- Main Content -->
  <div id="listContent">
    <h2 id="follow-title"> You're Following these Users: </h2>
    <!-- Fetch each row from the result and create div and its components for each post in the database -->
    <?php
      if (!$result) {
        echo('Your Followee List is Empty.');
      } else {
      while($row = mysql_fetch_assoc($result)):
    ?>
    <table id="users-table">
      <tr>
        <th><?= $row['name'] ?></th>
        <th><?= $row['email'] ?></th>
        <th>
          <div class = "listItemInfo">
            <form action="<?= BASE_URL ?>/yourFollowees/delete/<?= $row['id'] ?>" method="POST" onsubmit="return deleteConfirmation();">
              <button  class ="modifyItemButton clickable" type="submit" > Remove</button>
            </form>
          </div>
        </th>
      </tr>
    </table>
    <?php  endwhile;} ?>
  </div>
</div>
