DROP TABLE IF EXISTS Post, Users, Favorite, Follow;

CREATE TABLE Users
(
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR (64) NOT NULL,
  email VARCHAR(64) NOT NULL,
  phone_number VARCHAR(32),
  university VARCHAR(64) NOT NULL,
  password VARCHAR (128) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  type ENUM('User', 'Admin') NOT NULL DEFAULT 'User',
  PRIMARY KEY (id)
);

CREATE TABLE Post
(
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(128) NOT NULL,
  description VARCHAR(2048),
  price INT NOT NULL,
  photoInfo VARCHAR(128),
  conditionInfo ENUM('New', 'Used') NOT NULL,
  category ENUM('For Sale', 'Roommate') NOT NULL,
  type ENUM('Furniture', 'Electronic', 'Clothing', 'Misc', 'Household') NOT NULL,
  address VARCHAR(128) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_by INT,
  -- FOREIGN KEY (created_by) REFERENCES Users(id) ON DELETE CASCADE,
  PRIMARY KEY (id)
);

CREATE TABLE Favorite(
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  post_id INT NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE Follow (
  id INT NOT NULL AUTO_INCREMENT,
  follower_id INT NOT NULL,
  followee_id INT NOT NULL,
  date_created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY(id)
);

INSERT INTO Users (name, email, phone_number, university, password, type) VALUES
('Sait Onder', 'saito@vt.edu', '5401112233', 'Virginia Tech', '1234', 'Admin'),
('Zahra Ghaed', 'ghaed@vt.edu', '1234567890', 'Virginia Tech', '1234', 'Admin');
INSERT INTO Users (name, email, phone_number, university, password) VALUES
('Deniz Sahici', 'deniz@radford.edu', '4445551313', 'Radford University', '1234'),
('Mehmet Aslan', 'metmet@vt.edu', '3503506666', 'Virginia Tech', '1234'),
('Metin Kaya', 'metin@nrc.edu', '3503506666', 'New River College', '1234'),
('Raziye Eraydin', 'raziye@vt.edu', '3503506666', 'Roanoke College', '1234');

INSERT INTO Post (title, description, price, photoInfo, conditionInfo, category, type, created_by, address) VALUES
('Iphone 5s, has no problem!', 'This Phone works perfectly without any problems!. There are just a few scratches, but it is perfectly normal for 2 years old phone! It has been generally used with a case and screen protector', 200, 'iphone.jpg', 'Used', 'For Sale', 'Electronic', 1, 'Blacksburg, VA'),
('Brand New VT shirt','Brand New VIRGINIA TECH FROM NIKE! %100 Cotton. Price is negotiable! You can text me a message!',35 ,'vtshirt.jpg','New','For Sale','Clothing',1, 'Blacksburg, VA'),
('PS 4 Refurbished. Good Condition','This ps4 is only 3 months old! Bought refurbished, but couldnt find enough time to play. Three games will be given with the console for free(GTA 5, FIFA 2016, Witcher 3). If you dont want the games, price can be $150!', 250 ,'ps4.jpg','Used','For Sale','Electronic',2, 'Roanoke, VA'),
('Coffe Machine, less than 1 year old!','Perfect quality German Product! Almost 1 year old, but looks like brand new! If you like coffee, Bosch Tossimo is for you! Less than half price of a brand new one.', 30 ,'coffemachine.jpg','Used','For Sale','Household',2, 'Radford, VA'),
('High Quality Drawer!','Only reason I sell this drawer is I graduated and going to leave Blacksburg in a week! Must be picked up ASAP. Price can be negotiable.', 220 ,'drawer.jpg','Used','For Sale','Furniture',1, 'Blacksburg, VA'),
('Adidas Outdoor for cheap price!','After I bought these nice pair of shoes, I realized that they dont fit well to me. Its size is 9 US. I am selling this $50 cheaper than the original price. Call me!', 75,'shoe.jpg','Used','For Sale','Clothing',3, 'Roanoke, VA');

INSERT INTO Follow (follower_id,followee_id) VALUES
('1','2'),
('2','1');
