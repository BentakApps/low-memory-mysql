CREATE TABLE comment (
	id int NOT NULL AUTO_INCREMENT,
	user_id int NOT NULL,
	station_id int NOT NULL,
	message text NOT NULL,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP(),
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
	PRIMARY KEY (id)
) ENGINE InnoDB,
  CHARSET utf8mb3,
  COLLATE utf8mb3_bin;

CREATE TABLE fuel (
	id int NOT NULL AUTO_INCREMENT,
	type varchar(30) NOT NULL,
	symbol varchar(3) NOT NULL DEFAULT '',
	color varchar(6) NOT NULL DEFAULT '',
	name varchar(30) NOT NULL DEFAULT '',
	PRIMARY KEY (id)
) ENGINE InnoDB,
  CHARSET utf8mb3,
  COLLATE utf8mb3_bin;
  
CREATE TABLE payment (
	id int NOT NULL AUTO_INCREMENT,
	name varchar(50) NOT NULL,
	PRIMARY KEY (id)
) ENGINE InnoDB,
  CHARSET utf8mb3,
  COLLATE utf8mb3_bin;

CREATE TABLE rating (
	id int NOT NULL AUTO_INCREMENT,
	user_id int NOT NULL,
	station_id int NOT NULL,
	rating tinyint NOT NULL,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP(),
	updated_at datetime DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
	PRIMARY KEY (id)
) ENGINE InnoDB,
  CHARSET utf8mb3,
  COLLATE utf8mb3_bin;

CREATE TABLE station (
	id int NOT NULL AUTO_INCREMENT,
	place_id varchar(1024) NOT NULL,
	pano_id varchar(1024) NOT NULL,
	name varchar(256) NOT NULL,
	address varchar(256) NOT NULL,
	lat decimal(10,7) NOT NULL,
	lng decimal(10,7) NOT NULL,
	heading decimal(10,7) NOT NULL,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP(),
	updated_at datetime DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
	user_id int NOT NULL,
	route varchar(256),
	number varchar(16),
	neighborhood varchar(64),
	city varchar(64),
	state varchar(64),
	country varchar(64),
	postal_code varchar(16),
	PRIMARY KEY (id),
	UNIQUE KEY place_id (place_id)
) ENGINE InnoDB,
  CHARSET utf8mb3,
  COLLATE utf8mb3_bin;

CREATE TABLE stationexception (
	id int NOT NULL AUTO_INCREMENT,
	place_id varchar(1024) NOT NULL,
	pano_id varchar(1024),
	name varchar(256),
	address varchar(256),
	lat decimal(10,7),
	lng decimal(10,7),
	heading decimal(10,7),
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP(),
	updated_at datetime DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
	user_id int,
	route varchar(256),
	number varchar(16),
	neighborhood varchar(64),
	city varchar(64),
	state varchar(64),
	country varchar(64),
	postal_code varchar(16),
	PRIMARY KEY (id),
	UNIQUE KEY place_id (place_id)
) ENGINE InnoDB,
  CHARSET utf8mb3,
  COLLATE utf8mb3_bin;

CREATE TABLE stationprice (
	station_id int NOT NULL,
	fuel_id int NOT NULL,
	payment_id int NOT NULL,
	price int NOT NULL,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP(),
	updated_at datetime DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
	user_id int NOT NULL,
	PRIMARY KEY (station_id, fuel_id, payment_id)
) ENGINE InnoDB,
  CHARSET utf8mb3,
  COLLATE utf8mb3_bin;

CREATE TABLE user (
	id_provider varchar(16) NOT NULL,
	user_id varchar(64) NOT NULL,
	name varchar(128),
	first_name varchar(128),
	last_name varchar(128),
	email varchar(128),
	photo varchar(255),
	status varchar(64),
	reputation tinyint unsigned NOT NULL,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP(),
	updated_at datetime DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
	PRIMARY KEY (id_provider, user_id)
) ENGINE InnoDB,
  CHARSET utf8mb3,
  COLLATE utf8mb3_bin;
