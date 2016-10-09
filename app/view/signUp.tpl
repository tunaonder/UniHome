<!DOCTYPE html>
<html  lang="en">
<head>

  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery-3.1.0.min.js"></script>
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/uniHome.js"></script>


</head>
<body>

  <!-- Main Content -->
  <div class="mainContent">

    <div class="centeredContent">

      <div class="lineContainer">
        <label>Name: </label>
        <input id="signUpNameInput" type="text">
      </div>

      <div class="lineContainer">
        <label>Email: </label>
        <input id="signUpEmailInput" type="text">
      </div>

      <div class="lineContainer">
        <label>Phone: </label>
        <input id="signUpPhoneInput" type="text">
      </div>

      <div class="lineContainer">
        <label>Univeristy: </label>
        <select>
          <option value="vt">Virginia Tech</option>
          <option value="ru">Radford University</option>
          <option value="nrc">New River College</option>
          <option value="rc">Roanoke College</option>
        </select>
      </div>


      <div class="lineContainer">
        <label>Year: </label>
        <select>
          <option value="fr">Freshman</option>
          <option value="so">Sophomore</option>
          <option value="ju">Junior</option>
          <option value="se">Senior</option>
          <option value="gs">Graduate Student</option>
        </select>
      </div>
      <div class="lineContainer">
        <label>Password: </label>
        <input id="signUpPasswordInput" type="password">
      </div>

      <div class="lineContainer">
        <label>Confirm: </label>
        <input id="signUpConfirmInput" type="password">
      </div>

      <div class="lineContainer">
        <button class="contentButton" type="button" onClick="userSignUp();">Sign Up!</button>
        <button class="contentButton" type="button" onClick="changePage('home');">Cancel</button>
      </div>


    </div>


    <div id="alertContainer2" ></div>
  </div>




</body>
</html>
