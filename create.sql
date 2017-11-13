/*This table includes all the Bidder details*/
CREATE TABLE IF NOT EXISTS `vender` (
  `vender_id` int NOT NULL,
  `firm` varchar(200) NOT NULL,
  `firm_name` varchar(100) NOT NULL,
  `firm_url` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `user_fname` varchar(100) NOT NULL,
  `user_add` varchar(200) NOT NULL,
  `mobile_no` varchar(12) NOT NULL,
  `pan_no` varchar(100) NOT NULL,
  `tan_no` varchar(100) NOT NULL,
  `vat_no` varchar(100) NOT NULL,
  PRIMARY KEY (`vender_id`)
);

CREATE TABLE IF NOT EXISTS `admin` (
	`admin_id` int NOT NULL,
	`username` varchar(50) NOT NULL,
	`password` varchar(50) NOT NULL,
	PRIMARY KEY (`admin_id`)
);

/*This table includes all the Bidder details*/

CREATE TABLE IF NOT EXISTS `tender` (
    `tender_id` int NOT NULL,
    `title` varchar(200) NOT NULL,
    `tender_category_id` varchar(200) NOT NULL,
    `tender_ref` varchar(200) NOT NULL,
    `tender_type` varchar(200) NOT NULL,
    `tender_fees` int(10) NOT NULL,
    `tender_process_fee` int(10) NOT NULL,
    `est_amt` int(10) NOT NULL,
    `tender_pub_date` DATE NOT NULL,
    `bid_start_date` DATE NOT NULL,
    `bid_end_date` DATE NOT NULL,
    `tender_last_date` DATE NOT NULL,
    `dep_id` int NOT NULL,
    `emd_amount` int NOT NULL,
    `emd_payable` varchar(200) NOT NULL,
    `tender_time` int NOT NULL,
    `tender_active` ENUM('y','n') NOT NULL,
    `tender_desc` varchar(200) NOT NULL,
    `tender_file` varchar(200) NOT NULL,
    PRIMARY KEY (`tender_id`)
);

/*Display Bid’s details.*/

CREATE TABLE IF NOT EXISTS `bidding`(
   `bid_id` int NOT NULL,
   `vender_id` int NOT NULL,
   `tender_id` int NOT NULL,
   `cost` int NOT NULL,
   `desc` varchar(200) NOT NULL,
   `date` DATE NOT NULL,
   PRIMARY KEY(`bid_id`)
);

/*Tender categories are stored in this table*/
 
CREATE TABLE IF NOT EXISTS `tender_category`(
	`tender_category_id` int NOT NULL,
	`tender_category_name` varchar(200) NOT NULL,
	PRIMARY KEY(`tender_category_id`)
);

/*Display only conatact details*/

CREATE TABLE IF NOT EXISTS `contact`(
	`id` int NOT NULL,
	`name` varchar(20) NOT NULL,
	`email` varchar(50) NOT NULL,
	`mobile` int NOT NULL,
	`message` varchar(200) NOT NULL,
	PRIMARY KEY(`id`)
);

/*Display dept details like acc,purchase,sales etc.*/

CREATE TABLE IF NOT EXISTS `dept`(
	`dep_id` int NOT NULL,
	`dep_name` varchar(200) NOT NULL,
	PRIMARY KEY(`dep_id`) 
);

/*Display latest news details*/

CREATE TABLE IF NOT EXISTS `news`(
	`news_id` int NOT NULL,
	`news_title` varchar(200) NOT NULL,
	`news_desc` varchar(200) NOT NULL,
	`desc` varchar(200) NOT NULL,
	`active` ENUM('y','n') NOT NULL,
	`date` date NOT NULL,
	PRIMARY KEY(`news_id`)
);

ALTER TABLE `tender`
   ADD FOREIGN KEY (`tender_id`) REFERENCES `tender_category` (`tender_category_id`);
ALTER TABLE `tender`
   ADD FOREIGN KEY (`dep_id`) REFERENCES `dept` (`dep_id`);

ALTER TABLE `bidding`
      ADD FOREIGN KEY (`vender_id`) REFERENCES `vender` (`vender_id`);
ALTER TABLE `bidding`
     ADD FOREIGN KEY (`tender_id`) REFERENCES `tender` (`tender_id`);

CREATE OR REPLACE VIEW login AS SELECT vender_id, username, password FROM vender UNION ALL SELECT admin_id, username, password FROM admin;
