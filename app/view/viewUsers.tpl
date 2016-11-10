
<div class = "wrapper">

  <!-- Main Content -->
  <div id="listContent">
    <table>
  
    <?php while($row = mysql_fetch_assoc($result)): ?>

        <tr>
          <th><?= $row['name'] ?></th>
          <th><?= $row['email'] ?></th>
          <th><?= $row['type'] ?></th>
          <th><button value="<?= $row['id'] ?>" onClick="deleteConfirmation(this.value);" type="submit" >Delete User!</button></th>
        </tr>


    <?php endwhile; ?>
    </table>



  </div>

  <div id="viewUsersAlert" ></div>

</div>
