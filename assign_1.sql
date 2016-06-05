/* SELECT DATABASE */
USE mmanson;

/* 1) Display all tweets of people that you follow */

SELECT a.follower_id, b.username, c.tweet_content FROM follower_following a, user b, tweet c WHERE a.follower_id = b.user_id AND a.follower_id = c.user_key AND a.followee_id = "1";

/* 2) Add Hashtag Table */

CREATE TABLE `hashtag` (
  `hashtag_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hashtag` varchar(139) NOT NULL DEFAULT '',
  PRIMARY KEY (`hashtag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/* 3) Add Hashtag Relationship Table */

CREATE TABLE `hashtag_tweet` (
  `rel_key` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hashtag_id` int(11) unsigned NOT NULL,
  `tweet_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`rel_key`),
  KEY `hashtag` (`hashtag_id`),
  KEY `tweets` (`tweet_id`),
  CONSTRAINT `tweets` FOREIGN KEY (`tweet_id`) REFERENCES `tweet` (`tweet_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hashtag` FOREIGN KEY (`hashtag_id`) REFERENCES `hashtag` (`hashtag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* 4) Insert Hashtag(s) */

INSERT INTO hashtag (`hashtag_content`) VALUES("gotwitter");

/* 5) Insert New User */

INSERT INTO user (email, full_name, phone_number, password, username) values("susan29plus@sprynet.com","Susan Stern", "2125852406", "thisismymom", "sstern");

/* 6) Total Tweets for a given user */

SELECT b.username, COUNT(*) FROM tweet a, user b WHERE a.user_key = '1' AND b.user_id=a.user_key;

/* 7) Total Followers for a given user */

SELECT b.username, COUNT(*) FROM follower_following a, user b WHERE a.followee_id = b.user_id AND b.user_id = "3";

/* 8) Total Followees for a given user */

SELECT b.username, COUNT(*) FROM follower_following a, user b WHERE a.follower_id = b.user_id AND b.user_id = "3";

/* 9) Retrieve Primary key using ID/Password */

SELECT user_id FROM user WHERE username = "mmanson" AND password = "test";

/* 10) Retrieve multiple Hashtags per Tweet */

SELECT a.hashtag_id, b.hashtag_content FROM hashtag_tweet a, hashtag b WHERE a.hashtag_id = b.hashtag_id AND a.tweet_id = "29";

