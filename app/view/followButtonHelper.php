<?php
// generate a Follow button (or not) depending on who is logged in
function getFollowButton($username = null) {


  if(!isset($_SESSION['userEmail'])) {
    // user not logged in
    return '';
  } elseif($_SESSION['userEmail'] == $username) {
      // logged-in user is the same as this user
      // so don't let user follow themselves
      return '';
  } else {
    $f = Follow::loadByUsernames($_SESSION['userEmail'], $username);
    if($f != null) {
      // logged-in user already following this user
      return '<p id="followInfo">You\'re following '.$username.'</p>';
    }
  }
  $str = '<button id="follow-button" type="button" class="follow" name="username" value="'.$username.'" onClick="follow();">Follow '.$username.'</button>';
  return ($str);
}
