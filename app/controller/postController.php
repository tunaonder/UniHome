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
		$address = $_POST['address'];
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
		$post->set('address', $address);

		$post->save();
        
    
        
        // log the event
        $e = new Event(array(
                'event_type_id' => EventType::getIdByName('add_item'),
                'user_1_id' => $_SESSION['userId'],
                'user_1_name' => $_SESSION['userName'],
                'product_1_name' => $title
        ));
        $e->save();

        
        
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

	//Get Post Information from id and display accordingly
	public function viewPost($pid){


		$p = Post::loadById($pid);

		$pageName = 'View';

		$post = array();

		$post['id'] = $pid;
		$post['category'] = $p->get('category');
		$post['type'] = $p->get('type');
		$post['title'] = $p->get('title');
		$post['description'] = $p->get('description');
		$post['conditionInfo'] = $p->get('conditionInfo');
		$post['price'] = $p->get('price');
		$post['photoInfo'] = $p->get('photoInfo');
		$post['address'] = $p->get('address');

		$contactInfo = array();

		if (session_status() == PHP_SESSION_NONE) {
			session_start();
		}
		//If Session is started get Item owner info (Users who are not signed in cannot display contact info)
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

		include_once SYSTEM_PATH.'/view/followButtonHelper.php';
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
		$post['address'] = $p->get('address');

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
		$address = $_POST['editAddress'];

        // get the old data
        $currTitle = $p->get('title');
        $currDescription = $p->get('description');
        $currPrice = $p->get('price');
        $currAddress = $p->get('address');
		
        $p->set('title', $title);
		$p->set('description', $description);
		$p->set('price', $price);
		$p->set('address', $address);

        
        
		//If new Photo is uploaded set new photo data, otherwise do not change it
		if($file_name != ""){
			$p->set('photoInfo', $file_name);

		}

		$p->save();

        $isChanged = false;
        $data='';
        
        if (($currTitle != $title) )
            {
                $isChanged=true;
                $data .=", title";
            }
        
        if (($currDescription != $description))
            {
                $isChanged=true;
                $data .=", description";
            }
        
        if (($currPrice != $price))
            {
                $isChanged=true;
                $data .=", price";
            }
        
        if (($currAddress != $address))
            {
                $isChanged=true;
                $data .=", address";
            }
        
        if ( $isChanged)
        {
            postController::logEditPost($pid,$data);
        }
		//Redirect user
		header('Location: '.BASE_URL.'/yourPosts');

	}

	public function deletePost($pid){

        // log the event
        if (session_status() == PHP_SESSION_NONE) {
				session_start();
			}
        $p = Post::loadById($pid);
        $title = $p->get('title');
        
        $e = new Event(array(
                'event_type_id' => EventType::getIdByName('delete_item'),
                'user_1_id' => $_SESSION['userId'],
                'user_1_name' => $_SESSION['userName'],
                'product_1_name' => $title
        ));
        $e->save();
        
        
		$result = Post::deleteById($pid);
        
		if($result){
			//Redirect user
			header('Location: '.BASE_URL.'/yourPosts');
		}
	}

    private function logEditPost($pid,$data)
    {
                         //log the event
                if (session_status() == PHP_SESSION_NONE) {
				    session_start();
			     }
                $p = Post::loadById($pid);
                $title = $p->get('title');
        
                $e = new Event(array(
                'event_type_id' => EventType::getIdByName('edit_item'),
                'user_1_id' => $_SESSION['userId'],
                'user_1_name' => $_SESSION['userName'],
                'product_1_name' => $title,
                'data_1' => $data
        ));
        $e->save();
    }


}
