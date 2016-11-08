<?php
class Favorite extends DbObject {
  // name of database table
  const DB_TABLE = 'Favorite';

  // database fields
  protected $id;
  protected $userId;
  protected $postId;



  // constructor
  public function __construct($args = array()) {
    $defaultArgs = array(
      'id' => null,
      'user_id' => 0,
      'post_id' => 0
    );

    $args += $defaultArgs;

    $this->id = $args['id'];
    $this->userId = $args['user_id'];
    $this->postId = $args['post_id'];

  }

  // save changes to object
  public function save() {


    $db = Db::instance();
    // omit id and any timestamps
    $db_properties = array(
      'post_id' => $this->postId,
      'user_id' => $this->userId
    );
    $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
  }

  // load object by ID
  public static function loadById($id) {
    $db = Db::instance();
    $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
    return $obj;
  }

  public static function getFavoriteId($userId, $postId){
    $db = Db::instance();

    $result = $db->getFavoriteId($userId, $postId, __CLASS__, self::DB_TABLE);
    return $result;
  }


  public static function deleteById($id) {
    $db = Db::instance();
    $result = $db->deleteById($id, __CLASS__, self::DB_TABLE);
    return $result;
  }

  public static function getUserFavoritesById($id){
    $db = Db::instance();
    $result = $db->getUserFavoritesById($id, __CLASS__, self::DB_TABLE);
    return $result;

  }



}
