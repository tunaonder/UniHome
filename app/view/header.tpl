
<!-- According to user status(Signed In Or Not), displayed information and components
are either visible or hidden -->
<?php

$loginInformation = "Login to Post an Item";
$userLoggedInButtonStyle = "none";
$userLoggedInButtonStyle2 = "inline";
$welcomeInfo = "Welcome to UniHome";
$userId = 0;
$userType = '';
$favButtonStyle = "none";

if (session_status() == PHP_SESSION_NONE) {
  session_start();
}

if(isset($_SESSION['user'])) {


  $loginInformation = 'Logged in as '.$_SESSION['userEmail'].'';
  $userLoggedInButtonStyle = "block";
  $userLoggedInButtonStyle2 = "none";
  $welcomeInfo = 'Welcome '.$_SESSION['userName'].'';
  $userId = $_SESSION['userId'];
  $userType = $_SESSION['userType'];
  $userName = $_SESSION['userName'];
  $userEmail = $_SESSION['userEmail'];
  $favButtonStyle = "block";



}

?>


<!DOCTYPE html>
<html  lang="en">
<head>

  <title>UniHome | <?= $pageName ?></title>

  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery-3.1.0.min.js"></script>
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/uniHome.js"></script>
  <!-- Get baseURL info to use in ajax requests in home.js -->
  <script type="text/javascript">
		var baseURL = '<?= BASE_URL ?>';
	</script>

  <?php if($pageName == 'Home'): ?>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/home.js"></script>
  <?php endif; ?>
  <?php if($pageName == 'Login'): ?>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/login.js"></script>
  <?php endif; ?>
  <?php if($pageName == 'Sign Up'): ?>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/signUp.js"></script>
  <?php endif; ?>
  <?php if($pageName == 'Post' || $pageName == 'Edit'): ?>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/post.js"></script>
  <?php endif; ?>
  <?php if($pageName == 'View'): ?>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/view.js"></script>
  <?php endif; ?>
  <?php if($pageName == 'Your Posts'): ?>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/userPosts.js"></script>
  <?php endif; ?>
  <?php if($pageName == 'Your Favorites'): ?>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/userFavs.js"></script>
  <?php endif; ?>
  <?php if($pageName == 'View Users'): ?>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/viewUsers.js"></script>
  <?php endif; ?>
  <?php if($pageName == 'Profile'): ?>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/userProfile.js"></script>
  <?php endif; ?>
  <?php if($pageName == 'Edit Profile'): ?>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/editProfile.js"></script>
  <?php endif; ?>
  <?php if ($pageName == 'For Sale'): ?>
	<script type="text/javascript" src="<?= BASE_URL ?>/public/js/d3.min.js"></script>
	<script type="text/javascript" src="<?= BASE_URL ?>/public/js/userPosts.js"></script>
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/list.js"></script>
<?php endif; ?>


</head>
<body>

  <!-- Header Section Of Page -->
  <div>



    <!-- Hidden HTML VALUES TO USE IN home.js(for ajax requests) -->
    <input type="hidden" id="welcomeInfo" value="<?= $welcomeInfo ?>">
    <input type="hidden" id="userId" value="<?= $userId ?>">
    <input type="hidden" id="userType" value="<?= $userType ?>">




  </div>

</body>


</html>
