<!DOCTYPE html>
<html  lang="en">
<head>

  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery-3.1.0.min.js"></script>
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/uniHome.js"></script>


</head>
<body>

  <!-- All content is wrapped in a div -->
  <div class="mainContent">


      <div class="centeredContent" >

        <form id="login" action="<?= BASE_URL ?>/login/process" method="POST">

          <div class="lineContainer">
            <label>Email: </label>
            <input id="emailInput" type="text" name="un">
          </div>

          <div class="lineContainer">
            <label>Password: </label>
            <input id="passwordInput" type="password" name="pw">
          </div>


          <button class="contentButton" type="submit" >Login!</button>
          <button class="contentButton" type="button" onClick="changePage('home');">Cancel</button>

        </form>





      </div>

      <div id="alertContainer" ></div>




  </div>


</body>


</html>
