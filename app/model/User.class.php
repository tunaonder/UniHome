<?php

class User extends DbObject {
    // name of database table
    const DB_TABLE = 'Users';

    // database fields
    protected $id;
    protected $name;
    protected $email;
    protected $phone_number;
    protected $password;
    protected $university;


    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'email' => '',
            'password' => '',
            'university' => null,
            'name' => null,
            'phone_number' => null
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->email = $args['email'];
        $this->password = $args['password'];
        $this->university = $args['university'];
        $this->name = $args['name'];
        $this->phone_number = $args['phone_number'];
    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'email' => $this->email,
            'password' => $this->password,
            'university' => $this->university,
            'name' => $this->name,
            'phone_number' => $this->phone_number
            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }

    // load user by email
    public static function loadByEmail($email=null) {
        if($email === null)
            return null;

        $query = sprintf(" SELECT id FROM %s WHERE email = '%s' ",
            self::DB_TABLE,
            $email
            );
        $db = Db::instance();
        $result = $db->lookup($query);
        if(!mysql_num_rows($result))
            return null;
        else {
            $row = mysql_fetch_assoc($result);
            $obj = self::loadById($row['id']);
            return ($obj);
        }
    }


}
