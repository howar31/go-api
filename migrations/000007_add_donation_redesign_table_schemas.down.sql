ALTER TABLE `user` DROP `nickname` varchar(50) DEFAULT NULL;
ALTER TABLE `user` DROP `title` varchar(30) DEFAULT NULL;
ALTER TABLE `user` DROP `legal_name` varchar(30) DEFAULT NULL;
ALTER TABLE `user` DROP `age_range` enum(less_than_18, 18_to_24, 25_to_34, 35_to_44, 45_to_54, 55_to_64, above_65) DEFAULT NULL;
ALTER TABLE `user` DROP `read_preference` set(international, cross_straits, human_right, society, environment, education, politics, economy, culture, art, life, health, sport, all) DEFAULT NULL;
ALTER TABLE `user` DROP `words_for_twreporter` varchar(255) DEFAULT NULL;

ALTER TABLE `pay_by_prime_donations` DROP `receipt_security_id` varchar(20) DEFAULT NULL;
ALTER TABLE `pay_by_prime_donations` DROP `receipt_email` varchar(100) DEFAULT NULL;
ALTER TABLE `pay_by_prime_donations` DROP `receipt_address_country` varchar(45) DEFAULT NULL;
ALTER TABLE `pay_by_prime_donations` DROP `receipt_address_state` varchar(45) DEFAULT NULL;
ALTER TABLE `pay_by_prime_donations` DROP `receipt_address_city` varchar(45) DEFAULT NULL;
ALTER TABLE `pay_by_prime_donations` DROP `receipt_address_detail` varchar(255) DEFAULT NULL;
ALTER TABLE `pay_by_prime_donations` DROP `receipt_address_zip_code` varchar(10) DEFAULT NULL;
ALTER TABLE `pay_by_prime_donations` DROP `auto_tax_dedution` tinyint(1) DEFAULT NULL;
ALTER TABLE `pay_by_prime_donations` DROP `cardholder_last_name` varchar(30) DEFAULT NULL;
ALTER TABLE `pay_by_prime_donations` DROP `cardholder_first_name` varchar(30) DEFAULT NULL;
ALTER TABLE `pay_by_prime_donations` DROP `cardholder_security_id` varchar(20) DEFAULT NULL;
ALTER TABLE `pay_by_prime_donations` DROP `cardholder_gender` enum(male, female, other, unreveal) DEFAULT NULL;
ALTER TABLE `pay_by_prime_donations` DROP `cardholder_nickname` varchar(50) DEFAULT NULL;
ALTER TABLE `pay_by_prime_donations` DROP `cardholder_title` varchar(30) DEFAULT NULL;
ALTER TABLE `pay_by_prime_donations` DROP `cardholder_legal_name` varchar(30) DEFAULT NULL;
ALTER TABLE `pay_by_prime_donations` DROP `cardholder_age_range` enum(less_than_18, 18_to_24, 25_to_34, 35_to_44, 45_to_54, 55_to_64, above_65) DEFAULT NULL;
ALTER TABLE `pay_by_prime_donations` DROP `cardholder_read_preference` set(international, cross_straits, human_right, society, environment, education, politics, economy, culture, art, life, health, sport, all) DEFAULT NULL;
ALTER TABLE `pay_by_prime_donations` DROP `cardholder_words_for_twreporter` varchar(255) DEFAULT NULL;

ALTER TABLE `periodic_donations` DROP `pay_method` enum('credit_card', 'line', 'apple', 'google', 'samsung') DEFAULT NULL;
ALTER TABLE `periodic_donations` DROP `receipt_security_id` varchar(20) DEFAULT NULL;
ALTER TABLE `periodic_donations` DROP `receipt_email` varchar(100) DEFAULT NULL;
ALTER TABLE `periodic_donations` DROP `receipt_address_country` varchar(45) DEFAULT NULL;
ALTER TABLE `periodic_donations` DROP `receipt_address_state` varchar(45) DEFAULT NULL;
ALTER TABLE `periodic_donations` DROP `receipt_address_city` varchar(45) DEFAULT NULL;
ALTER TABLE `periodic_donations` DROP `receipt_address_detail` varchar(255) DEFAULT NULL;
ALTER TABLE `periodic_donations` DROP `receipt_address_zip_code` varchar(10) DEFAULT NULL;
ALTER TABLE `periodic_donations` DROP `auto_tax_dedution` tinyint(1) DEFAULT NULL;
ALTER TABLE `periodic_donations` DROP `cardholder_last_name` varchar(30) DEFAULT NULL;
ALTER TABLE `periodic_donations` DROP `cardholder_first_name` varchar(30) DEFAULT NULL;
ALTER TABLE `periodic_donations` DROP `cardholder_security_id` varchar(20) DEFAULT NULL;
ALTER TABLE `periodic_donations` DROP `cardholder_gender` enum(male, female, other, unreveal) DEFAULT NULL;
ALTER TABLE `periodic_donations` DROP `cardholder_nickname` varchar(50) DEFAULT NULL;
ALTER TABLE `periodic_donations` DROP `cardholder_title` varchar(30) DEFAULT NULL;
ALTER TABLE `periodic_donations` DROP `cardholder_legal_name` varchar(30) DEFAULT NULL;
ALTER TABLE `periodic_donations` DROP `cardholder_age_range` enum(less_than_18, 18_to_24, 25_to_34, 35_to_44, 45_to_54, 55_to_64, above_65) DEFAULT NULL;
ALTER TABLE `periodic_donations` DROP `cardholder_read_preference` set(international, cross_straits, human_right, society, environment, education, politics, economy, culture, art, life, health, sport, all) DEFAULT NULL;
ALTER TABLE `periodic_donations` DROP `cardholder_words_for_twreporter` varchar(255) DEFAULT NULL;
