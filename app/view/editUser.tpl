<form id="save-user" action="<?= BASE_URL ?>/signUp/saveUser" method="POST">

  <div class="lineContainer">
    <label>Name: </label>
    <!-- <input id="signUpNameInput" type="text"> -->
    <input type="text" name="userName" value="<?= $user['name'] ?>">
  </div>

  <div class="lineContainer">
    <label>Email: </label>
    <!-- <input id="signUpEmailInput" type="text"> -->
    <input type="text" name="userEmail" value="<?= $user['email'] ?>">
  </div>

  <div class="lineContainer">
    <label>Phone: </label>
    <!-- <input id="signUpPhoneInput" type="text"> -->
    <input type="text" name="userPhone" value="<?= $user['phone_number'] ?>">
  </div>

  <div class="lineContainer">
    <label>Univeristy: </label>
    <select name="userUniversity" value="<?= $user['university'] ?>">
      <option value="Virginia Tech">Virginia Tech</option>
      <option value="Radford University">Radford University</option>
      <option value="New River College">New River College</option>
      <option value="Roanoke College">Roanoke College</option>
    </select>
  </div>

  <div class="lineContainer">
    <label>Password: </label>
    <!-- <input id="signUpPasswordInput" type="password"> -->
    <input type="text" name="userPassword" value="<?= $user['pw'] ?>">
  </div>

  <div class="lineContainer">
    <label>Confirm: </label>
    <input id="signUpConfirmInput" type="password">
  </div>

  <div class="lineContainer">
    <button class="contentButton" type="submit">Sign Up!</button>
    <button class="contentButton" type="button" onClick="changePage('home');">Cancel</button>

  </div>



</form>
