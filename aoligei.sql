CREATE DATABASE aoligei DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE aoligei;
CREATE TABLE IF NOT EXISTS `outter_tribune`(  
   `id` INT UNSIGNED AUTO_INCREMENT,
   `tid` INT NOT NULL,
   `uname` VARCHAR(60) ,
   `uip` VARCHAR(60) ,
   `uagent` VARCHAR(40) ,
   `created_time` VARCHAR(100) ,
    `comment` VARCHAR(254) ,
   PRIMARY KEY ( `id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_user`(  
   `id` INT UNSIGNED AUTO_INCREMENT,
   `usename` VARCHAR(40) NOT NULL,
   `pasword` VARCHAR(254) NOT NULL,
   `createduser_time` DATE ,
   `rank` INT NOT NULL, 
   PRIMARY KEY ( `id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `inner_tribune`(
   `id` INT UNSIGNED AUTO_INCREMENT,
   `oid` INT NOT NULL,
   `iuname` VARCHAR(60) ,
   `iuip` VARCHAR(60) ,
   `iuagent` VARCHAR(40) ,
   `created_time_inner` VARCHAR(100) ,
    `icomment` VARCHAR(254) ,
   PRIMARY KEY ( `id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;