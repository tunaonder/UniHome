<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a PostController and route it
$pc = new FolloweeController();
$pc->route($action);


class FolloweeController {

	// route us to the appropriate class method for this action
	public function route($action) {
		switch($action) {

			case 'deleteFollowee':

				$followeeEmail = $_GET['followeeEmail'];

				$this->deleteFollowee($followeeEmail);
				break;

			case 'checkFollowee':
				$followeeEmail = $_GET['followeeEmail'];
				$this->checkFollowee($followerEmail, $followeeEmail);
				break;

			// redirect to home page if all else fails
			default:
				header('Location: '.BASE_URL);
				exit();

		}
	}



	public function deleteFollowee($followeeEmail){

		if (session_status() == PHP_SESSION_NONE) {
			session_start();
		}

		if(isset($_SESSION['user'])) {

			$followerEmail = $_SESSION['userEmail'];

		}

		 $result = Follow::deleteFolloweeById($followerEmail,$followeeEmail);

 		if($result){
 			//Redirect user
 			header('Location: '.BASE_URL.'/yourFollowee');
 		}

	}

	public function checkFollowee($followeeEmail){

    if (session_status() == PHP_SESSION_NONE) {
			session_start();
		}

		if(isset($_SESSION['user'])) {

			$followerEmail = $_SESSION['userEmail'];

		}

		$res = Follow::loadByUsernames($followerEmail, $followeeEmail);

    if($res != null) {
      // follow already happened!
      $json = array('status' => 'followed');
    }
		else{
			$json = array( 'status' => 'unfollowed' );
		}

		header('Content-Type: application/json');
		echo json_encode($json);
	}


}
