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
			header('Location: '.BASE_URL.'/');



		}

		//Function Resource: https://davidwalsh.name/basic-file-uploading-php
		//Code is copied from given url and modified
		public function uploadPhoto(){

			if(isset($_POST['submit']))
			{
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




	}
