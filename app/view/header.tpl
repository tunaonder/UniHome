<?php

$loginInformation = "Login to Post an Item!";
$userLoggedInButtonStyle = "none";
$userLoggedInButtonStyle2 = "block";


?>

<!DOCTYPE html>
<html  lang="en">
<head>

  <title>UniHome | <?= $pageName ?></title>

  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery-3.1.0.min.js"></script>
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/uniHome.js"></script>



  <?php if($pageName == 'Home'): ?>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/home.js"></script>
  <?php endif; ?>
  <?php if($pageName == 'Login'): ?>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/login.js"></script>
  <?php endif; ?>
  <?php if($pageName == 'Sign Up'): ?>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/signUp.js"></script>
  <?php endif; ?>
  <?php if($pageName == 'Post'): ?>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/post.js"></script>
  <?php endif; ?>



</head>
<body>

  <!-- Header Section Of Page -->
  <div class="header">

    <?php

    session_start();

    if(isset($_SESSION['user'])) {

      $loginInformation = 'Logged in as: '.$_SESSION['user'].'';
      $userLoggedInButtonStyle = "block";
      $userLoggedInButtonStyle2 = "none";

    }

    ?>


    <!-- Application Logo or Name -->
    <a id="appName" href="./">UniHome</a>

    <!-- Header Navigators -->
    <div >
      <form action="<?= BASE_URL ?>/processLogout" method="POST">

        <button id="signUpButton" type="submit" style="display: <?= $userLoggedInButtonStyle ?>">Logout</button>
        <button type="button" onClick="changePage('post');" style="display: <?= $userLoggedInButtonStyle ?>">Post!</button>
        <button type="button" onClick="changePage('signUp');" style="display: <?= $userLoggedInButtonStyle2 ?>">Sign Up</button>
        <button type="button" onClick="changePage('login');" style="display: <?= $userLoggedInButtonStyle2 ?>">Login</button>
        <label id = "userLoggedInLabel "style="color: white"> <?= $loginInformation ?> </label>

      </form>
    </div>


  </div>

</body>


</html>
