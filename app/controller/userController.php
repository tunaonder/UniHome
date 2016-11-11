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

			case 'deleteUserOwnAccount':
			$userId = $_POST['userId'];
			$this->deleteUserOwnAccount($userId);
			break;

			case 'changeUserRole':
			$userId = $_POST['userId'];
			$userType = $_POST['userType'];
			$this->changeUserRole($userId, $userType);
			break;

			case 'displayUserProfile':
			$userId = $_GET['userId'];
			$this->displayUserProfile($userId);
			break;

			case 'displayEditProfile':
			$userId = $_GET['userId'];
			$this->displayEditProfile($userId);
			break;

			case 'editUserProfile':
			$userId = $_GET['userId'];
			$this->editProfile($userId);
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

	public function displayUserProfile($userId) {
		$pageName = 'Profile';

		$p = User::loadById($userId);

		$user = array();

		$user['name'] = $p->get('name');
		$user['email'] = $p->get('email');
		$user['phone'] = $p->get('phone_number');
		$user['university'] = $p->get('university');
		$user['id'] = $p->get('id');


		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/userProfile.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function displayEditProfile($userId){
		$pageName = 'Edit Profile';

		$p = User::loadById($userId);

		$user = array();

		$user['name'] = $p->get('name');
		$user['email'] = $p->get('email');
		$user['phone'] = $p->get('phone_number');
		$user['university'] = $p->get('university');
		$user['password'] = $p->get('password');
		$user['id'] = $p->get('id');


		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/editProfile.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';

	}

	public function editProfile($userId){

		$pageName = 'Edit Profile';

		$p = User::loadById($userId);

		$name = $_POST['editUserName'];
		$phone= $_POST['editUserPhone'];
		$password = $_POST['editUserPassword'];
		$university = $_POST['editUserUniversity'];


		$p->set('name', $name);
		$p->set('phone_number', $phone);
		$p->set('password', $password);
		$p->set('university', $university);


		$p->save();


		//Redirect user
		header('Location: '.BASE_URL.'');

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
		//Delete Posts posted by a user
		$result = Post::deletePostByUserId($id);

		if ($result == true){
			$result2 = User::deleteById($id);


			if($result2){
				$json = array( 'userDeleted' => 'true' );
			}
			else{
				$json = array( 'userDeleted' => 'false' );
			}



		}
		else{
			$json = array( 'userDeleted' => 'false' );
		}

		header('Content-Type: application/json');
		echo json_encode($json);


	}

	public function deleteUserOwnAccount($id){
		//Delete Posts posted by a user
		$result = Post::deletePostByUserId($id);

		if ($result == true){
			$result2 = User::deleteById($id);

			//Clean Session Cookies
			$_SESSION = Array();
			//Delete Session
			session_start();
			session_destroy();

			if($result2){
				$json = array( 'userDeleted' => 'true' );
			}
			else{
				$json = array( 'userDeleted' => 'false' );
			}



		}
		else{
			$json = array( 'userDeleted' => 'false' );
		}

		header('Content-Type: application/json');
		echo json_encode($json);


	}

	public function changeUserRole($id, $type){

		 $result = User::changeUserRole($id, $type);

		if($result){
			$json = array( 'userRoleChange' => 'true' );
		}
		else{
			$json = array( 'userRoleChange' => 'false' );
		}


		header('Content-Type: application/json');
		echo json_encode($json);


	}



}
