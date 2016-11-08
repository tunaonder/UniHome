<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a PostController and route it
$pc = new FavoriteController();
$pc->route($action);


class FavoriteController {

	// route us to the appropriate class method for this action
	public function route($action) {
		switch($action) {

			case 'deleteFavorite':

			$postId = $_GET['pid'];

			$this->deleteFavorite($postId);
			break;

			case 'addToFavs':
			$userId = $_POST['userId'];
			$postId = $_POST['pid'];
			$this->addToFavs($userId, $postId);
			break;

			case 'checkFav':
			$userId = $_GET['userId'];
			$postId = $_GET['pid'];
			$this->checkFav($userId, $postId);
			break;

			// redirect to home page if all else fails
			default:
			header('Location: '.BASE_URL);
			exit();

		}
	}



	public function deleteFavorite($postId){

		if (session_status() == PHP_SESSION_NONE) {
			session_start();
		}

		if(isset($_SESSION['user'])) {

			$userId = $_SESSION['userId'];

		}
		 $favId = Favorite::getFavoriteId($userId, $postId);

		 $result = Favorite::deleteById($favId);

 		if($result){
 			//Redirect user
 			header('Location: '.BASE_URL.'/yourFavorites');
 		}

	}

	public function addToFavs($userId, $postId){

		$favorite = new Favorite();

		$favorite->set('userId', $userId);
		$favorite->set('postId', $postId);

		$favorite->save();

		$json = array( 'status' => 'available' );

		header('Content-Type: application/json');
		echo json_encode($json);
	}
	public function checkFav($userId, $postId){

		$favId = Favorite::getFavoriteId($userId, $postId);

		if($favId != 0){
			$json = array( 'status' => 'followed' );
		}
		else{
			$json = array( 'status' => 'unfollowed' );
		}

		header('Content-Type: application/json');
		echo json_encode($json);
	}


}
