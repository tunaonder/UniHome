<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a PostController and route it
$pc = new PostController();
$pc->route($action);


class PostController {

	// route us to the appropriate class method for this action
	public function route($action) {
		switch($action) {


			case 'postItem':
			$this->postItem();
			break;

			case 'viewPost':
			$postId = $_GET['pid'];
			$this->viewPost($postId);
			break;

			case 'displayPostDetails':
			$postId = $_GET['pid'];
			$this->displayPostDetails($postId);
			break;

			case 'editPost':
			$postId = $_GET['pid'];
			$this->editPost($postId);
			break;

			case 'deletePost':
			$postId = $_GET['pid'];
			$this->deletePost($postId);
			break;

			// redirect to home page if all else fails
			default:
			header('Location: '.BASE_URL);
			exit();


		}
	}

	public function postItem(){

		//Upload Photo and Return File Name
		$file_name = $this->uploadPhoto();

		$category = $_POST['category'];
		$type = $_POST['type'];
		$title = $_POST['title'];
		$description = $_POST['description'];
		$price = $_POST['price'];
		$condition = $_POST['conditionInfo'];
		$photoInfo = $file_name;
		//Get the Creator Id from the Session
		session_start();
		if (isset($_SESSION['user'])){
			$creator_id = $_SESSION['userId'];
		}


		$post = new Post();

		$post->set('category', $category);
		$post->set('type', $type);
		$post->set('title', $title);
		$post->set('description', $description);
		$post->set('price', $price);
		$post->set('conditionInfo', $condition);
		$post->set('photoInfo', $photoInfo);
		$post->set('creator_id', $creator_id);

		$post->save();
		//Redirect user
		header('Location: '.BASE_URL.'/yourPosts');



	}

	//Function Resource: https://davidwalsh.name/basic-file-uploading-php
	//Code is copied from given url and modified
	public function uploadPhoto(){

		if(isset($_POST['submit']))
		{

			if($_FILES['fileInfo']['name'] == null){
				return "";
			}

			//Change file Name. So that files uploaded with the same name will have different names
			$file = rand(1000,100000)."-".$_FILES['fileInfo']['name'];
			$file_loc = $_FILES['fileInfo']['tmp_name'];
			$file_size = $_FILES['fileInfo']['size'];
			$file_type = $_FILES['fileInfo']['type'];

			$folder = SYSTEM_PATH.'/uploads/';

			// new file size in KB
			$new_size = $file_size/1024;
			// new file size in KB

			// make file name in lower case
			$new_file_name = strtolower($file);
			// make file name in lower case

			$final_file=str_replace(' ','-',$new_file_name);

			move_uploaded_file($file_loc,$folder.$final_file);

			return $final_file;


		}
	}

	public function viewPost($pid){


		$p = Post::loadById($pid);

		$pageName = $p->get('title');

		$post = array();

		$post['category'] = $p->get('category');
		$post['type'] = $p->get('type');
		$post['title'] = $p->get('title');
		$post['description'] = $p->get('description');
		$post['conditionInfo'] = $p->get('conditionInfo');
		$post['price'] = $p->get('price');
		$post['photoInfo'] = $p->get('photoInfo');



		$contactInfo = array();

		if (session_status() == PHP_SESSION_NONE) {
			session_start();
		}
		//If Session is started get Item owner info
		if(isset($_SESSION['user'])) {
			$itemOwnerId = $p->get('creator_id');
			$user = User::loadById($itemOwnerId);
			$contactInfo['name'] = "Name: " .$user->get('name');
			$contactInfo['email'] = "Email: " .$user->get('email');
			$contactInfo['phone'] = "Phone: " .$user->get('phone_number');
		}
		else{
			$contactInfo['name'] = "You must Login to View Contact Information";
			$contactInfo['email'] = "";
			$contactInfo['phone'] = "";
		}



		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/navigator.tpl';
		include_once SYSTEM_PATH.'/view/itemView.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';

	}

	public function displayPostDetails($pid){

		$pageName = 'Edit';

		$p = Post::loadById($pid);

		$post = array();

		$post['id'] = $p->get('id');
		$post['category'] = $p->get('category');
		$post['type'] = $p->get('type');
		$post['title'] = $p->get('title');
		$post['description'] = $p->get('description');
		$post['conditionInfo'] = $p->get('conditionInfo');
		$post['price'] = $p->get('price');
		$post['photoInfo'] = $p->get('photoInfo');



		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/editView.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';

	}

	public function editPost($pid){

		$file_name = $this->uploadPhoto();

		$p = Post::loadById($pid);

		$title = $_POST['editTitle'];
		$description = $_POST['editDescription'];
		$price = $_POST['editPrice'];


		$p->set('title', $title);
		$p->set('description', $description);
		$p->set('price', $price);
		if($file_name != ""){
			$p->set('photoInfo', $file_name);

		}

		$p->save();

		//Redirect user
		header('Location: '.BASE_URL.'/yourPosts');

	}

	public function deletePost($pid){

		$result = Post::deleteById($pid);

		if($result){
			//Redirect user
			header('Location: '.BASE_URL.'/yourPosts');
		}






	}



}
