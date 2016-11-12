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

			case 'follow':
				$username = $_POST['username'];
				$this->follow($username);
				break;

			case 'forSale':
				$this->forSale();
				break;

			case 'processLogin':
				$userEmail = $_POST['uEmail'];
				$password = $_POST['uPw'];
				$this->processLogin($userEmail, $password);
				break;

			case 'processLogout':
				$this->processLogout();
				break;

			case 'post':
				$this->post();
				break;

			case 'displayUserPosts':
				$this->displayUserPosts();
				break;

			case 'displayUserFavorites':
				$this->displayUserFavorites();
				break;

			case 'displayUserFollowees':
				$this->displayUserFollowees();
				break;

			case 'check':
				$userId = $_GET['userId'];
				$this->checkUserData($userId);
				break;

			case 'checkForAdmin':
				$userId = $_GET['userId'];
				$this->getInfoForAdmin($userId);
				break;

			case 'checkUser':
				$userEmail = $_GET['userEmail'];
				$this->checkUserEmail($userEmail);
				break;

			case 'viewUsers':
				$this->viewUsers();
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

            if(isset($_SESSION['user'])) {
            $id = $_SESSION['userId'];

			$events = Event::getEventsByUserId($id,8);
		}
			include_once SYSTEM_PATH.'/view/eventHelper.php';
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



		//Return all Posts From Database in descending order
		public function forSale() {
			$pageName = 'For Sale';

			$result = Post::getPosts();


			include_once SYSTEM_PATH.'/view/header.tpl';
			include_once SYSTEM_PATH.'/view/navigator.tpl';
			include_once SYSTEM_PATH.'/view/forSale.tpl';
			include_once SYSTEM_PATH.'/view/footer.tpl';
		}

		public function viewUsers(){
			$pageName = 'View Users';

			$result = User::getAllUsers();

			include_once SYSTEM_PATH.'/view/header.tpl';
			include_once SYSTEM_PATH.'/view/navigator.tpl';
			include_once SYSTEM_PATH.'/view/viewUsers.tpl';
			include_once SYSTEM_PATH.'/view/footer.tpl';

		}



		//Login User
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
				$_SESSION['userName'] = $user->get('name');
				$_SESSION['userType'] = $user->get('type');
				$_SESSION['userEmail'] = $user->get('email');
				$_SESSION['userUniversity'] = $user->get('university');
				$_SESSION['userPhone'] = $user->get('phone_number');
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

		public function displayUserPosts() {
			$pageName = 'Your Posts';


			//If session is not already started, start it
			if (session_status() == PHP_SESSION_NONE) {
				session_start();
			}
			//If user is set get its id
			if(isset($_SESSION['user'])){

				$id = $_SESSION['userId'];

			}
			//If there is no such id delete session
			if($id == null){
				//Delete Session
				session_start();
				session_destroy();
				// send them back
				header('Location: '.BASE_URL);
				exit();

			}

			//Get All User Items By User Id
			$result = Post::getUserItemsById($id);

			include_once SYSTEM_PATH.'/view/header.tpl';
			include_once SYSTEM_PATH.'/view/navigator.tpl';
			include_once SYSTEM_PATH.'/view/userPosts.tpl';
			include_once SYSTEM_PATH.'/view/footer.tpl';
		}

		//Collect data related to particular user to display in the main page
		public function checkUserData($id){

			$user = User::loadById($id);

			//If there is such user
			if($user != null) {
				//Get his university
				$university = $user->get('university');

				//Find number of students from particular university
				$numberOfStudents = User::getStudentCountFromUniversity($university);
				//Find number of posts posted by students from particular university
				$postCount = User::getPostCountFromUniversity($university);

				//Create json data with all this info
				$json = array( 'status' => 'available', 'university' => $university,
				'studentCount' => $numberOfStudents, 'postCount' => $postCount);

			} else {

				$json = array( 'status' => 'unavailable' );

			}

			header('Content-Type: application/json');
			echo json_encode($json);

		}

		public function displayUserFavorites() {
			$pageName = 'Your Favorites';

			//If session is not already started, start it
			if (session_status() == PHP_SESSION_NONE) {
				session_start();
			}
			//If user is set get its id
			if(isset($_SESSION['user'])){

				$id = $_SESSION['userId'];

			}
			//If there is no such id delete session
			if($id == null){
				//Delete Session
				session_start();
				session_destroy();
				// send them back
				header('Location: '.BASE_URL);
				exit();

			}


			//Get User Favorite Post Ids
			$favs = Favorite::getUserFavoritesById($id);


			$postIdArray = array();
			while($row = mysql_fetch_assoc($favs)):
				array_push($postIdArray, $row['post_id']);
			endwhile;

			//Prepare Array For SQL Query
			$formattedArray = implode(", ", $postIdArray);

			//Get all Posts created by current user
			$result = Post::getPostsByPostIds($formattedArray);



			include_once SYSTEM_PATH.'/view/header.tpl';
			include_once SYSTEM_PATH.'/view/navigator.tpl';
			include_once SYSTEM_PATH.'/view/userFavs.tpl';
			include_once SYSTEM_PATH.'/view/footer.tpl';
		}

		public function displayUserFollowees() {
			$pageName = 'Your Followees';

			//If session is not already started, start it
			if (session_status() == PHP_SESSION_NONE) {
				session_start();
			}
			//If user is set get its id
			if(isset($_SESSION['user'])){

				$id = $_SESSION['userId'];

			}
			//If there is no such id delete session
			if($id == null){
				//Delete Session
				session_start();
				session_destroy();
				// send them back
				header('Location: '.BASE_URL);
				exit();

			}

			//Get User Favorite Post Ids
			$followees = Follow::getUserFolloweesById($id);


			$postIdArray = array();
			while($row = mysql_fetch_assoc($followees)):
				array_push($postIdArray, $row['followee_id']);
			endwhile;

			//Prepare Array For SQL Query
			$formattedArray = implode(", ", $postIdArray);

			//Get all Posts created by current user
			$result = User::getUsersByUserIds($formattedArray);



			include_once SYSTEM_PATH.'/view/header.tpl';
			include_once SYSTEM_PATH.'/view/navigator.tpl';
			include_once SYSTEM_PATH.'/view/userFollowees.tpl';
			include_once SYSTEM_PATH.'/view/footer.tpl';
		}

		public function getInfoForAdmin($id){

			$user = User::loadById($id);

			//If there is such user and user is an Admin
			if($user != null && $user->get('type') == 'Admin') {
				//Get his university
				// $university = $user->get('university');

				//Find number of students from particular university
				$numberOfStudents = User::getTotalStudentCount();
				//Find number of posts posted by students from particular university
				$postCount = Post::getTotalPostCount();

				//Create json data with all this info
				$json = array( 'status' => 'available', 'studentCount' => $numberOfStudents, 'postCount' => $postCount);

			} else {

				$json = array( 'status' => 'unavailable' );

			}

			header('Content-Type: application/json');
			echo json_encode($json);

		}

		public function follow($followeeEmail) {
			if (session_status() == PHP_SESSION_NONE) {
				session_start();
			}

			if(isset($_SESSION['user'])) {


				// user is logged in
				// get user ID for followee
				$followee = User::loadByEmail($followeeEmail);

				// does this follow already exist?
				$f = Follow::loadByUsernames($_SESSION['userEmail'], $followeeEmail);
				if($f != null) {
					// follow already happened!
					$json = array('error' => 'You already followed this user.');
					echo json_encode($json);
				}


                // log the event
			$e = new Event(array(
					'event_type_id' => EventType::getIdByName('follow_user'),
					'user_1_id' => $_SESSION['userId'],
					'user_2_id' => $followee->get('id'),
                    'user_1_name' => $_SESSION['userName'],
                    'user_2_name' => $followee->get('name')
			));
			$e->save();


				// save the new follow
				$f = new Follow(array(
					'follower_id' => $_SESSION['userId'],
					'followee_id' => $followee->get('id')
					));
				$f->save();
				// we're done
				$json = array('success' => 'success');
				echo json_encode($json);
				} else {
					// user isn't logged in, so can't follow anyone
					$json = array('error' => 'You are not logged in.');
					echo json_encode($json);
				}

		}


	}
