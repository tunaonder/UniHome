<div class = "wrapper">
  <!-- Main Content -->
  <div class="mainContent">

    <div class="centeredContent2">



        <div class="lineContainer">
          <label>Name: <?= $userName ?></label>

        </div>

        <div class="lineContainer">
          <label>Email: <?= $userEmail ?></label>
        </div>

        <div class="lineContainer">
          <label>Phone: <?= $userPhone ?> </label>
        </div>

        <div class="lineContainer">
          <label>Univeristy: <?= $userUniversity ?></label>

        </div>

        <div class="lineContainer">
          <button class="editProfileButton" type="submit" >Edit Profile</button>
          <button class="editProfileButton" value="<?= $userId ?>" onClick="deleteConfirmation(this.value);" type="submit" >Delete Account</button>

        </div>



    </div>



  </div>
</div>
