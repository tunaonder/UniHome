<!DOCTYPE html>
<html  lang="en">
<head>

<title>UniHome | <?= $pageName ?></title>

  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery-3.1.0.min.js"></script>
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/uniHome.js"></script>


</head>
<body>

    <!-- Header Section Of Page -->
    <div class="header">

      <!-- Application Logo or Name -->
      <!-- <label id="appName">UniHome </label> -->
        <a id="appName" href="./">UniHome</a>

      <!-- Header Navigators -->
      <div >
        <button id="signUpButton" type="button" onClick="changePage('signUp');">Sign Up</button>
        <button type="button" onClick="changePage('login');">Login</button>
        <label style="color: white"> Login To Post An Item: </label>
      </div>


    </div>

</body>


</html>
