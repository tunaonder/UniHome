<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a UserController and route it
$pc = new UserController();
$pc->route($action);

class UserController {

	// route us to the appropriate class method for this action
	public function route($action) {
		switch($action) {

			case 'saveUser':
			$this->saveUser();
			break;


			case 'checkEmail':

			$userEmail = $_GET['email'];
			$this->checkUserEmail($userEmail);
			break;

			case 'deleteUser':
			$userId = $_POST['userId'];
			$this->deleteUser($userId);
			break;

			// redirect to home page if all else fails
			default:
			header('Location: '.BASE_URL);
			exit();
		}

	}

	public function saveUser(){


		$name = $_POST['userName'];
		$email = $_POST['userEmail'];
		$phone_number = $_POST['userPhone'];
		$university = $_POST['userUniversity'];
		$password = $_POST['userPassword'];

		$user = new User();

		$user->set('name', $name);
		$user->set('email', $email);
		$user->set('phone_number', $phone_number);
		$user->set('university', $university);
		$user->set('password', $password);

		$user->save();
		//Redirect user
		header('Location: '.BASE_URL.'/login');

	}

	public function checkUserEmail($userEmail) {
		$user = User::loadByEmail($userEmail);
		if($user == null) {
			// user doesn't exist; username is available
			$json = array( 'status' => 'available' );
		} else {
			// username not available
			$json = array( 'status' => 'unavailable' );
		}

		header('Content-Type: application/json');
		echo json_encode($json);
	}

	public function deleteUser($id){
		$result = User::deleteById($id);

		if ($result == true){
			$json = array( 'userDeleted' => 'true' );

		}
		else{
			$json = array( 'userDeleted' => 'false' );
		}

		header('Content-Type: application/json');
		echo json_encode($json);


	}



}
