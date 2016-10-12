<!DOCTYPE html>
<html  lang="en">
<head>

  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery-3.1.0.min.js"></script>
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/uniHome.js"></script>
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/signUp.js"></script>


</head>
<body>

  <!-- Main Content -->
  <div class="mainContent">

    <div class="centeredContent">

      <form id="save-user" action="<?= BASE_URL ?>/signUp/saveUser" method="POST" onSubmit="return userSignUp();">

        <div class="lineContainer">
          <label>Name: </label>
          <!-- <input id="signUpNameInput" type="text"> -->
          <input id="signUpNameInput" type="text" name="userName" >
        </div>

        <div class="lineContainer">
          <label>Email: </label>
          <!-- <input id="signUpEmailInput" type="text"> -->
          <input id="signUpEmailInput" type="text" name="userEmail">
        </div>

        <div class="lineContainer">
          <label>Phone: </label>
          <!-- <input id="signUpPhoneInput" type="text"> -->
          <input id="signUpPhoneInput" type="text" name="userPhone">
        </div>

        <div class="lineContainer">
          <label>Univeristy: </label>
          <select name="userUniversity">
            <option value="Virginia Tech">Virginia Tech</option>
            <option value="Radford University">Radford University</option>
            <option value="New River College">New River College</option>
            <option value="Roanoke College">Roanoke College</option>
          </select>
        </div>

        <div class="lineContainer">
          <label>Password: </label>
          <!-- <input id="signUpPasswordInput" type="password"> -->
          <input id="signUpPasswordInput" type="password" name="userPassword">
        </div>

        <div class="lineContainer">
          <label>Confirm: </label>
          <input id="signUpConfirmInput" type="password">
        </div>

        <div class="lineContainer">
          <button class="contentButton" type="submit" >Sign Up!</button>
          <button class="contentButton" type="button" onClick="changePage('home');">Cancel</button>

        </div>



      </form>




    </div>


    <div id="alertContainer2" ></div>
  </div>




</body>
</html>
