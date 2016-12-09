<?php

class Db {

  private static $_instance = null;
  private $conn;

  private function __construct() {
    $host     = DB_HOST;
    $database = DB_DATABASE;
    $username = DB_USER;
    $password = DB_PASS;



    $conn = mysql_connect($host, $username, $password)
    or die ('Error: Could not connect to MySql database');


    mysql_select_db($database);


  }

  public static function instance() {
    if (self::$_instance === null) {
      self::$_instance = new Db();
    }
    return self::$_instance;
  }

  public function fetchById($id, $class_name, $db_table) {
    if ($id === null) {
      return null;
    }

    $query = sprintf("SELECT * FROM `%s` WHERE id = '%s';",
    $db_table,
    $id
  );
  //echo $query;
  $result = $this->lookup($query);

  if(!mysql_num_rows($result)) {
    return null;
  } else {
    $row = mysql_fetch_assoc($result);
    $obj = new $class_name($row);
    return $obj;
  }
}

public function store(&$obj, $class_name, $db_table, $data)
{
  // find out if this item already exists so we know to use INSERT or UPDATE
  if($obj->getId() === null) {
    // ID would only be null for a new item, so let's use INSERT
    $query = $this->buildInsertQuery($db_table, $data);
    //echo $query;
    $this->execute($query); // execute the query we've built
    $obj->setId($this->getLastInsertID()); //get back the ID for the new item
  } else {
    // item ID exists, so let's use UPDATE
    // only hit the database if the instance has been modified
    if($obj->getModified()) {
      $query = $this->buildUpdateQuery($db_table, $data, $obj->getId());
      //echo $query;
      $this->execute($query); // execute the query we've built
    }
  }
  //echo $query; // print the query
  $obj->setModified(false); // reset the flag
}

// Formats a string for use in SQL queries.
// Use this on ANY string that comes from external sources (i.e. the user).
public function quoteString($s) {
  return "'" . mysql_real_escape_string($s) . "'";
}

// Formats a date (i.e. UNIX timestamp) for use in SQL queries.
public function quoteDate($d) {
  return date("'Y-m-d H:i:s'", $d);
}

//Query the database for information
public function lookup($query) {
  $result = mysql_query($query);
  if(!$result)
  die('Invalid query: ' . $query);
  return ($result);
}

//Execute operations like UPDATE or INSERT
public function execute($query) {
  $ex = mysql_query($query);
  if(!$ex)
  die ('Query failed:' . mysql_error());
}

//Build an INSERT query.  Mostly here to make things neater elsewhere.
//$table  -> Name of the table to insert into
//$fields -> List of attributes to populate
//$values -> Values that will populate the new row
//RETURN  -> A mysql insert query in the form of:
//					 "INSERT INTO <table> (<fields>) VALUES (<values>)"
//NOTE: This function DOES NOT actually EXECUTE the query, only gives a
//			string to be used elsewhere.
public function buildInsertQuery($table = '', $data = array()) {
  $fields = '';
  $values = '';

  foreach ($data as $field => $value) {
    if($value !== null) { // skip unset fields
      $fields .= "`".$field . "`, ";
      $values .= $this->quoteString($value) . ", ";
    }
  }

  // cut off the last ', ' for each
  $fields = substr($fields, 0, -2);
  $values = substr($values, 0, -2);

  $query = sprintf("INSERT INTO `%s` (%s) VALUES (%s);",
  $table,
  $fields,
  $values
);

return ($query);
}

public function buildUpdateQuery($table = '', $data = array(), $id=0) {
  $all_null = true;
  $query = "UPDATE `" . $table . "` SET `";

  foreach ($data as $field => $value) {
    if($value === null) {
      $query .= $field . "` = NULL, `";
    } else {
      $query .= $field . "` = " . $this->quoteString($value) . ", `";
      $all_null = false;
    }
  }

  $query = substr($query, 0, -3); // cut off the last ', `'
  $query .= " WHERE id = '" . $id . "';";

  // only return a real query if there's something to update
  if($all_null)
  return '';
  else
  return ($query);
}

//Get the ID of the last row inserted into the database.  Useful for getting
//the id of a new object inserted using AUTO_INCREMENT in the db.
//RETURN -> The ID of the last inserted row
public function getLastInsertID() {
  $query = "SELECT LAST_INSERT_ID() AS id";
  $result = mysql_query($query);
  if(!$result)
  die('Invalid query.');

  $row = mysql_fetch_assoc($result);
  return ($row['id']);
}

//Delete Item
public function deleteById($id, $class_name, $db_table) {
  if ($id === null) {
    return false;
  }

  $query = sprintf("DELETE FROM `%s` WHERE id = '%s';",
  $db_table,
  $id
);
//echo $query;
$result = $this->lookup($query);

return true;
}

//Delete followee
public function deleteFolloweeById($id, $follower_id, $class_name, $db_table) {
  if ($id === null) {
    return false;
  }

  $query = sprintf("DELETE FROM `%s` WHERE followee_id = '%s' and follower_id = '%s';",
  $db_table,
  $id,
  $follower_id
);
//echo $query;
$result = $this->lookup($query);

return true;
}

//Get Student Count From Selected University
public function getStudentCount($university, $class_name, $db_table){

  if ($university === null) {
    return 0;
  }

  $result = mysql_query("SELECT * FROM Users WHERE university='$university';");
  $num_rows = mysql_num_rows($result);

  return $num_rows;

}

//Get Total Student Count
public function getTotalStudentCount($class_name, $db_table){

  $result = mysql_query("SELECT * FROM Users;");

  $num_rows = mysql_num_rows($result);

  return $num_rows;

}

//Find number of posts posted by students from particular university
public function getPostCountFromUniversity($university, $class_name, $db_table){

  //If university is not set retrun 0
  if ($university === null) {
    return 0;
  }

  $result = mysql_query("SELECT * FROM Post WHERE created_by IN (SELECT id FROM Users WHERE university='$university');");
  $num_rows = mysql_num_rows($result);

  return $num_rows;

}

public function getFavoriteId($userId, $postId, $class_name, $db_table){
  if ($userId === 0 || $postId === 0) {
    return 0;
  }
  $query = sprintf("SELECT id FROM `%s` WHERE user_id = '%s' AND post_id = '%s';" ,
  $db_table,
  $userId,
  $postId);
  $result = $this->lookup($query);

  if(!mysql_num_rows($result)) {
    return 0;
  } else {
    $row = mysql_fetch_assoc($result);
    $id = $row['id'];
    return $id;
  }

}

public function getUserItemsById($id){

  //Get all Posts created by current user
  $q = "SELECT * FROM Post WHERE created_by=$id ORDER BY created_at DESC;";
  $result = mysql_query($q);

  return $result;

}

public function getUserFavoritesById($id){


  $favQuery = "SELECT post_id FROM Favorite WHERE user_id=$id;";
  $favs = mysql_query($favQuery);

  return $favs;


}

public function getPostsByPostIds($list){
  $q = "SELECT * FROM Post WHERE id in ($list)";
  $result = mysql_query($q);
  return $result;
}
public function getUsersByUserIds($list){
  $q = "SELECT * FROM Users WHERE id in ($list)";
  $result = mysql_query($q);
  return $result;
}

public function getUserFolloweesById($id){
  $favQuery = "SELECT followee_id FROM Follow WHERE follower_id=$id;";
  $favs = mysql_query($favQuery);

  return $favs;
}


public function getPosts(){
  $q = "SELECT * FROM Post";
  $result = mysql_query($q);

  return $result;
}

public function getPostsByType($type){

  if($type == 'All Posts'){

    $q = "SELECT * FROM Post";
    $result = mysql_query($q);
    if (!$result){
     throw new My_Db_Exception('Database error: ' . mysql_error());
   }
    return $result;
  }


  $q = "SELECT * FROM Post WHERE type = '$type';";
  $result = mysql_query($q);
  if (!$result){
   throw new My_Db_Exception('Database error: ' . mysql_error());
 }
  return $result;
}

public function getPostsByUniversity($uni){

  if($uni == 'All'){

    $q = "SELECT * FROM Post";
    $result = mysql_query($q);
    if (!$result){
     throw new My_Db_Exception('Database error: ' . mysql_error());
   }
    return $result;
  }


  $q = "SELECT * FROM Post WHERE created_by IN (SELECT id FROM Users WHERE university='$uni');";
  $result = mysql_query($q);
  if (!$result){
   throw new My_Db_Exception('Database error: ' . mysql_error());
 }
  return $result;
}

public function getPostsSortByPrice($type){
  if ($type == 1){
    $q = "SELECT * FROM Post ORDER BY price ASC;";
  }
  else if($type == 2){
    $q = "SELECT * FROM Post ORDER BY price DESC;";
  }
  else{
    $q = "SELECT * FROM Post";
  }

  $result = mysql_query($q);

  return $result;
}

public function getTotalPostCount(){
  $result = mysql_query("SELECT * FROM Post;");
  $num_rows = mysql_num_rows($result);

  return $num_rows;

}

public function getAllUsers(){
  $q = "SELECT * FROM Users;";
  $result = mysql_query($q);
  return $result;

}

public function deletePostByUserId($id){
  $q = "DELETE FROM Post WHERE created_by=$id;";
  $result = mysql_query($q);
  return $result;


}

public function changeUserRole($id, $type){

  $q = "UPDATE Users SET type='Admin' WHERE id=$id;";

  if($type == 'Admin'){
    $q = "UPDATE Users SET type='User' WHERE id=$id;";
  }


  $result = mysql_query($q);
  return $result;


}

public function getAllPosts(){
  $q = "SELECT * FROM Post";
  $sql = mysql_query($q);
  $result = mysql_fetch_array($sql);
  return $result;
}


function get_enum_values()
{
    $type = mysql_query("SHOW COLUMNS FROM Post WHERE Field = 'type'");
    $val = mysql_fetch_assoc($type);
    print_r($val);
    preg_match("/^enum\(\'(.*)\'\)$/", $val, $matches);
    $enum = explode("','", $matches[1]);

    return $enum;
}


public function getAllTypes(){
    $sql = "SELECT type FROM Post";
    $row = mysql_query($sql);

    $results = array();
    while ($result = mysql_fetch_assoc($row)) {
    $type = $result['type'];
    $results[] = $type;
    }

//    foreach($results as $result)
//    {
//        echo $result['type'];
//    }
//    print_r($results);
//    echo '<br/>';
    return $results;

}

      // load all Posts
   public static function getArrayPosts($limit=null) {
     $query = sprintf(" SELECT id FROM %s ",
     self::DB_TABLE
     );
     $db = Db::instance();
     $result = $db->lookup($query);
     if(!mysql_num_rows($result))
     return null;
     else {
       $objects = array();
       while($row = mysql_fetch_assoc($result)) {
         $objects[] = self::loadById($row['id']);
       }
       return ($objects);
     }
   }

}
