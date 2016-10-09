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



}
