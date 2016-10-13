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
			$username = $_POST['un'];
			$password = $_POST['pw'];
			$this->processLogin($username, $password);
			break;

			case 'processLogout':

			$this->processLogout();


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

	public function processLogin($u, $p) {



		$adminUsername = 'saito@vt.edu';
		$adminPassword = '1234';
		if(($u == $adminUsername) && ($p == $adminPassword)) {
			session_start();
			$_SESSION['user'] = $u;
			header('Location: '.BASE_URL);
			exit();
			// 	echo 'Hooray! Access is granted.';
			// } else {
			// 	echo 'Access denied.';
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
