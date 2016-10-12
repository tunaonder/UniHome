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
		$user->set('pw', $password);

		$user->save();
		//Redirect user
		header('Location: '.BASE_URL.'/');

	}


	public function viewProduct($id) {
		$pageName = 'Product';

    $product = array();
    switch($id) {
      case 1: // maroon t-shirt
        $product['imgURL'] = BASE_URL.'/public/img/tshirt.jpg';
        $product['name'] = 'Maroon T-shirt';
        $product['description'] = 'Some product description would go here.';
        $product['sizes'] = 'Small';
        $product['price'] = '$20';
        break;

      case 2: // football jersey
        $product['imgURL'] = BASE_URL.'/public/img/jersey.jpg';
        $product['name'] = 'Football Jersey';
        $product['description'] = 'Some product description would go here.';
        $product['sizes'] = 'Small, Medium';
        $product['price'] = '$80';
        break;
    }

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/product.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }


	public function editProduct($id) {
		$pageName = 'Edit Product';

		$p = Product::loadById($id);

		// $host     = DB_HOST;
		// $database = DB_DATABASE;
		// $username = DB_USER;
		// $password = DB_PASS;
		//
		// $conn = mysql_connect($host, $username, $password)
		// 	or die ('Error: Could not connect to MySql database');
		//
		// mysql_select_db($database);
		//
		// $q = sprintf("SELECT * FROM product WHERE id = %d ",
		// 	$id
		// );
		// $result = mysql_query($q);

		$product = array();
	//	while($row = mysql_fetch_assoc($result)) {
			$product['title'] = $p->get('title');
			$product['description'] = $p->get('description');
			$product['sizes'] = $p->get('sizes');
			$product['price'] = $p->get('price');
			$product['img_url'] = $p->get('img_url');
	//	}

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/editProduct.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function editProductProcess($id) {
		$title = $_POST['title'];
		$description = $_POST['description'];
		$sizes = $_POST['sizes'];
		$price = $_POST['price'];
		$img_url = $_POST['img_url'];

		$p = Product::loadById($id);
		$p->set('title', $title);
		$p->set('description', $description);
		$p->set('sizes', $sizes);
		$p->set('price', $price);
		$p->set('img_url', $img_url);

		$p->save();

	//
	// 	// connect to the database
	// 	$host     = DB_HOST;
	// 	$database = DB_DATABASE;
	// 	$username = DB_USER;
	// 	$password = DB_PASS;
	//
	// 	$conn = mysql_connect($host, $username, $password)
	// 		or die ('Error: Could not connect to MySql database');
	//
	// 	mysql_select_db($database);
	//
	// 	// update product
	// 	$q = sprintf(" UPDATE product SET title = '%s', description = '%s', sizes = '%s', price = %d, img_url = '%s' WHERE id = %d; ",
	// 		mysql_real_escape_string($title),
	// 		mysql_real_escape_string($description),
	// 		mysql_real_escape_string($sizes),
	// 		mysql_real_escape_string($price),
	// 		mysql_real_escape_string($img_url),
	// 		mysql_real_escape_string($id)
	// 	);
	// //	echo $q;
	// 	mysql_query($q);

		// redirect user
		header('Location: '.BASE_URL.'/shirts/');
	}


}
