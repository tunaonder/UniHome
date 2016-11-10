<div class = "wrapper">
  <!-- Main Content -->
  <div class="mainContent">

    <div class="centeredContent3">

      <form  action="<?= BASE_URL ?>/userProfile/<?= $user['id'] ?>/edit/saveChanges" method="POST" onSubmit="return updateUser();" enctype="multipart/form-data">
        <div class="lineContainer">
          <label>Email: </label>
          <label id="rightComponent"> <?= $user['email'] ?> </label>
        </div>

        <div class="lineContainer">
          <label>Name: </label>
          <input id="editName" value="<?= $user['name'] ?>" name="editUserName" type="text">

        </div>

        <div class="lineContainer">
          <label>Phone: </label>
          <input id="editPhone" value="<?= $user['phone'] ?>" name="editUserPhone" type="text">
        </div>

        <div class="lineContainer">
          <label>Change Password: </label>
          <input id="pass1" value="<?= $user['password'] ?>" name="editUserPassword" type="password">
        </div>

        <div class="lineContainer">
          <label>Confirm Password: </label>
          <input  id="pass2" value="<?= $user['password'] ?>" name="editUserPasswordConfirm" type="password">
        </div>

        <div class="lineContainer">
          <label>Univeristy: </label>
          <select name="editUserUniversity" >
            <option <?php if ($user['university'] == 'Virginia Tech') echo 'selected' ; ?> value="Virginia Tech"> Virginia Tech </option>
            <option <?php if ($user['university'] == 'Radford University') echo 'selected' ; ?> value="Radford University">Radford University</option>
            <option <?php if ($user['university']== 'New River College') echo 'selected' ; ?> value="New River College">New River College</option>
            <option <?php if ($user['university']== 'Roanoke College') echo 'selected' ; ?> value="Roanoke College">Roanoke College</option>
          </select>

        </div>

        <div class="lineContainer">
          <button class="contentButton" type="submit" >Save Changes</button>
          <button class="contentButton" type="button" onClick="document.location.href='<?= BASE_URL ?>'">Cancel</button>

        </div>


      </form>


    </div>



  </div>
</div>
