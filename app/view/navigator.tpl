<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<nav class="navbar navbar-default">
  <div class="container-fluid">
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
        <li><a href="<?= BASE_URL ?>/post" style="display: <?= $userLoggedInButtonStyle ?>"> New Post</li></a>
        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>

      <ul class="nav navbar-nav navbar-right">

        <li><a href="<?= BASE_URL ?>/userProfile/<?=$userId?>"> <label id = "userLoggedInLabel" class="clickable" style="display: <?= $userLoggedInButtonStyle ?>"> <?= $loginInformation ?> </label></a></li>
        <label style="display: <?= $userLoggedInButtonStyle2 ?>" > Login to Post an Item </label>
        <button type="button" class="btn btn-default navbar-btn" onClick="document.location.href='<?= BASE_URL ?>/login'" style="display: <?= $userLoggedInButtonStyle2 ?>">Login</button>
        <button type="button" class="btn btn-default navbar-btn" onClick="document.location.href='<?= BASE_URL ?>/signUp'" style="display: <?= $userLoggedInButtonStyle2 ?>">Sign Up</button>

        <li class="dropdown" style="display: <?= $userLoggedInButtonStyle ?>">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Menu <span class="caret"></span></a>
          <ul class="dropdown-menu">


            <li><a href="<?= BASE_URL ?>/yourPosts" style="display: <?= $userLoggedInButtonStyle ?>">Your Items</button>
            <li><a href="<?= BASE_URL ?>/yourFollowees" style="display: <?= $userLoggedInButtonStyle ?>">Following</a></li>
            <li><a href="<?= BASE_URL ?>/yourFavorites" style="display: <?= $userLoggedInButtonStyle ?>">Your Favorites</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <?php if($userType == 'Admin'): ?>
              <li><a href="#">Separated link</a></li>
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
    <button onclick="changePage('roommates');">Roommates</button>
    <button onclick="changePage('sublease');">Sublease</button>
  </div>

</div>
