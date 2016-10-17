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




}
