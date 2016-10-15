<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SiteController and route it
$pc = new SiteController();
$pc->route($action);

class SiteController {

	// route us to the appropriate class method for this action
	public function route($action) {
		switch($action) {
			case 'home':
			$this->home();
			break;

			case 'login':
			$this->login();
			break;

			case 'signUp':
			$this->signUp();
			break;

			case 'processLogin':
			$userEmail = $_POST['uEmail'];
			$password = $_POST['uPw'];
			$this->processLogin($userEmail, $password);
			break;

			case 'processLogout':
			$this->processLogout();

			case 'post':
			$this->post();





			break;



			// redirect to home page if all else fails
			default:
			header('Location: '.BASE_URL);
			exit();

		}

	}

	public function home() {
		$pageName = 'Home';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/navigator.tpl';
		include_once SYSTEM_PATH.'/view/home.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';

	}

	public function login() {
		$pageName = 'Login';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/login.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function signUp() {
		$pageName = 'Sign Up';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/signUp.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function post() {
		$pageName = 'Post';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/post.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function processLogin($u, $p) {

		//Get User Object From DB
		$user = User::loadByEmail($u);

		//If it is null go back
		if ($user == null){

			header('Location: '.BASE_URL);
			exit();
		}
		//Get User password
		else{
			$password = $user->get('password');
		}

		//If password matches with db password start session
		if( $password == $p) {
			session_start();
			$_SESSION['user'] = $u;
			$_SESSION['userId'] = $user->get('id');
			header('Location: '.BASE_URL);
			exit();

		} else {
			// send them back
			header('Location: '.BASE_URL);
			exit();
		}

	}

	public function processLogout() {

		//Clean Session Cookies
		$_SESSION = Array();
		//Delete Session
		session_start();
		session_destroy();
		// send them back
		header('Location: '.BASE_URL);
		exit();


	}




}
