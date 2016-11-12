<?php

class EventType extends DbObject {
  // name of database table
  const DB_TABLE = 'event_type';

  // database fields
  protected $id;
  protected $name;

  // constructor
  public function __construct($args = array()) {
      $defaultArgs = array(
          'id' => null,
          'name' => null
          );

      $args += $defaultArgs;

      $this->id = $args['id'];
      $this->name = $args['name'];
  }

  // save changes to object
  public function save() {
      $db = Db::instance();
      // omit id and any timestamps
      $db_properties = array(
          'name' => $this->name
          );
      $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
  }

  // load object by ID
  public static function loadById($id) {
      $db = Db::instance();
      $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
      return $obj;
  }

  public static function getIdByName($name) {
    $db = Db::instance();
    $q = sprintf("SELECT * FROM %s WHERE `name` = '%s' ",
      self::DB_TABLE,
      $name
      );
    $result = $db->lookup($q);
    if(mysql_num_rows($result) == 0) {
      return null;
    } else {
      $row = mysql_fetch_assoc($result);
      return ($row['id']);
    }
  }

}
