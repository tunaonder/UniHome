
<div class = "wrapper">

  <!-- Main Content -->
  <div id="listContent">
    <table>

      <?php while($row = mysql_fetch_assoc($result)): ?>

        <tr>
          <th><?= $row['name'] ?></th>
          <th><?= $row['email'] ?></th>

          <?php if($row['type'] == 'Admin'): ?>
            <th style="color: red;"><?= $row['type'] ?></th>
          <?php endif; ?>
          <?php if($row['type'] == 'User'): ?>
            <th style="color: green;"><?= $row['type'] ?></th>
          <?php endif; ?>
          <th><button value="<?= $row['id'] ?>" onClick="deleteConfirmation(this.value);" type="submit" >Delete User!</button></th>
          <th><button id="<?= $row['id'] ?>" value="<?= $row['type'] ?>" onClick="changeUserRole(this.id, this.value);" type="submit" >Change Role!</button></th>


        </tr>


      <?php endwhile; ?>
    </table>

    <div id="viewUsersAlert" ></div>

  </div>



</div>
