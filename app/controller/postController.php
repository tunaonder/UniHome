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

			// redirect to home page if all else fails
			default:
			header('Location: '.BASE_URL);
			exit();


		}
	}

		public function postItem(){
			$this->uploadPhoto();


			// $category = $_POST['category'];
			// $type = $_POST['type'];
			// $title = $_POST['title'];
			// $description = $_POST['description'];
			// $price = $_POST['price'];
			// $condition = $_POST['condition'];
			// $file $_POST['file'];
			//
			// $user = new User();
			//
			// $user->set('name', $name);
			// $user->set('email', $email);
			// $user->set('phone_number', $phone_number);
			// $user->set('university', $university);
			// $user->set('password', $password);
			//
			// $user->save();
			// //Redirect user
			// header('Location: '.BASE_URL.'/');



		}

		//Function Resource: https://davidwalsh.name/basic-file-uploading-php
		//Code is copied from given url and modified
		public function uploadPhoto(){

			if(isset($_POST['submit']))
			{
				//Change file Name. So that files uploaded with the same name will have different names
				$file = rand(1000,100000)."-".$_FILES['file']['name'];
				$file_loc = $_FILES['file']['tmp_name'];
				$file_size = $_FILES['file']['size'];
				$file_type = $_FILES['file']['type'];

				 $folder = SYSTEM_PATH.'/uploads/';

				// new file size in KB
				$new_size = $file_size/1024;
				// new file size in KB

				// make file name in lower case
				$new_file_name = strtolower($file);
				// make file name in lower case

				$final_file=str_replace(' ','-',$new_file_name);

				move_uploaded_file($file_loc,$folder.$final_file);


			}
		}




	}
