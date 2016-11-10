<div class = "wrapper">
  <!-- Main Content -->
  <div class="mainContent">

    <div class="centeredContent2">



        <div class="lineContainer">
          <label>Name: </label>
          <label id="rightComponent"><?= $user['name'] ?></label>

        </div>

        <div class="lineContainer">
          <label>Email: </label>
          <label id="rightComponent"><?= $user['email'] ?></label>
        </div>

        <div class="lineContainer">
          <label>Phone:  </label>
          <label id="rightComponent"> <?= $user['phone'] ?> </label>
        </div>

        <div class="lineContainer">
          <label>Univeristy: </label>
          <label id="rightComponent"> <?= $user['university'] ?> </label>

        </div>

        <div class="lineContainer">

          <form action="<?= BASE_URL ?>/userProfile/<?=$userId?>/edit" method="GET">
            <button class="contentButton" type="submit" >Edit Profile</button>
          </form>
          <button class="contentButton" value="<?= $userId ?>" onClick="deleteConfirmation(this.value);" type="submit" >Delete Account</button>

        </div>



    </div>



  </div>
</div>
