<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<nav class="navbar navbar-default" id="nav-primary">
  <div class="container-fluid" id="navbar">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" id="appName" href="<?= BASE_URL ?>">UniHome</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">

        <li style="display: <?= $userLoggedInButtonStyle ?>" ><a id="login-info"><?= $loginInformation ?></a></li>
        <button onclick="document.location.href='<?= BASE_URL ?>/post'" class="btn btn-default" style="display: <?= $userLoggedInButtonStyle ?>" id="new-post">New Post</button>


      </ul>
      <form class="navbar-form navbar-right" action="<?= BASE_URL ?>/processLogout" method="POST">
        <button type="submit"  class="btn btn-default" style="display: <?= $userLoggedInButtonStyle ?>">Logout</button>
      </form>

      <ul class="nav navbar-nav navbar-right">

        <label id="login-post" style="display: <?= $userLoggedInButtonStyle2 ?>" > Login to Post an Item </label>
        <button type="button" class="btn btn-success navbar-btn" onClick="document.location.href='<?= BASE_URL ?>/login'" style="display: <?= $userLoggedInButtonStyle2 ?>">Login</button>
        <button type="button" class="btn btn-default navbar-btn" onClick="document.location.href='<?= BASE_URL ?>/signUp'" style="display: <?= $userLoggedInButtonStyle2 ?>">Sign Up</button>

        <li class="dropdown" style="display: <?= $userLoggedInButtonStyle ?>">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" id="menu-dropdown">Menu <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<?= BASE_URL ?>/userProfile/<?=$userId?>" style="display: <?= $userLoggedInButtonStyle ?>"> Your Profile</a></li>
            <li><a href="<?= BASE_URL ?>/yourPosts" style="display: <?= $userLoggedInButtonStyle ?>">Your Items</a></li>
            <li><a href="<?= BASE_URL ?>/yourFollowees" style="display: <?= $userLoggedInButtonStyle ?>">Following</a></li>
            <li><a href="<?= BASE_URL ?>/yourFavorites" style="display: <?= $userLoggedInButtonStyle ?>">Your Favorites</a></li>
            <?php if($userType == 'Admin'): ?>
              <li role="separator" class="divider"></li>
              <li><a href="<?= BASE_URL ?>/viewUsers" style="display: <?= $userLoggedInButtonStyle ?>"> View Users </li></a>
            <?php endif; ?>
          </ul>
        </li>
      </ul>

    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<div id="primary-nav">

  <div id="innerNav">
    <button onclick="document.location.href='<?= BASE_URL ?>'">Home</button>
    <button onclick="document.location.href='<?= BASE_URL ?>/forSale'">For Sale</button>
    <button onclick="document.location.href='<?= BASE_URL ?>/about'">About Us</button>
    <button onclick="document.location.href='<?= BASE_URL ?>/contact'">Contact</button>
  </div>

</div>
