<?php

class Post extends DbObject {
  // name of database table
  const DB_TABLE = 'Post';

  // database fields
  protected $id;
  protected $category;
  protected $type;
  protected $title;
  protected $description;
  protected $price;
  protected $conditionInfo;
  protected $photoInfo;
  protected $creator_id;
  protected $address;


  // constructor
  public function __construct($args = array()) {
    $defaultArgs = array(
      'id' => null,
      'category' => '',
      'type' => '',
      'title' => '',
      'description' => '',
      'price' => 0,
      'conditionInfo' => '',
      'photoInfo' => '',
      'created_by' => 0,
      'address' => ''
    );

    $args += $defaultArgs;

    $this->id = $args['id'];
    $this->category = $args['category'];
    $this->type= $args['type'];
    $this->title = $args['title'];
    $this->description = $args['description'];
    $this->price = $args['price'];
    $this->conditionInfo = $args['conditionInfo'];
    $this->photoInfo = $args['photoInfo'];
    $this->creator_id = $args['created_by'];
    $this->address = $args['address'];
  }

  // save changes to object
  public function save() {


    $db = Db::instance();
    // omit id and any timestamps
    $db_properties = array(
      'category' => $this->category,
      'type' => $this->type,
      'title' => $this->title,
      'description' => $this->description,
      'price' => $this->price,
      'conditionInfo' => $this->conditionInfo,
      'photoInfo' => $this->photoInfo,
      'created_by' => $this->creator_id,
      'address' => $this->address
    );
    $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
  }

  // load object by ID
  public static function loadById($id) {
    $db = Db::instance();
    $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
    return $obj;
  }

  // load all Posts
  // public static function getAllPosts($limit=null) {
  //   $query = sprintf(" SELECT id FROM %s ORDER BY date_created DESC ",
  //   self::DB_TABLE
  //   );
  //   $db = Db::instance();
  //   $result = $db->lookup($query);
  //   if(!mysql_num_rows($result))
  //   return null;
  //   else {
  //     $objects = array();
  //     while($row = mysql_fetch_assoc($result)) {
  //       $objects[] = self::loadById($row['id']);
  //     }
  //     return ($objects);
  //   }
  // }

  public static function deleteById($id) {
    $db = Db::instance();
    $result = $db->deleteById($id, __CLASS__, self::DB_TABLE);
    return $result;
  }

  public static function getUserItemsById($id){
    $db = Db::instance();
    $result = $db->getUserItemsById($id, __CLASS__, self::DB_TABLE);
    return $result;


  }

  public static function getPostsByPostIds($list){
    $db = Db::instance();
    $result = $db->getPostsByPostIds($list, __CLASS__, self::DB_TABLE);
    return $result;

  }

  public static function getPosts(){
    $db = Db::instance();
    $result = $db->getPosts(__CLASS__, self::DB_TABLE);
    return $result;
  }

  public static function getPostsSortByPrice($type){
    $db = Db::instance();
    $result = $db->getPostsSortByPrice($type);
    return $result;
  }

  public static function getTotalPostCount(){
    $db = Db::instance();
    $result = $db->getTotalPostCount();
    return $result;

  }

  public static function deletePostByUserId($id){
    $db = Db::instance();
    $result = $db->deletePostByUserId($id);
    return $result;
  }


  public static function getAllPosts(){
    $db = Db::instance();
    $result = $db->getAllPosts(__CLASS__, self::DB_TABLE);
    return $result;
  }

  public static function getAllTypes(){
    $db = Db::instance();
    $result = $db->getAllTypes(__CLASS__, self::DB_TABLE);
    return $result;
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

   public static function getPostsByType($type){
     $db = Db::instance();
     $result = $db->getPostsByType($type);
     return $result;
   }

   public static function getPostsByUniversity($uni){
     $db = Db::instance();
     $result = $db->getPostsByUniversity($uni);
     return $result;
   }

}
