CREATE TABLE `friends` (
  `user` int(11) NOT NULL,
  `friend` int(11) NOT NULL,
  UNIQUE KEY `user_friend` (`user`,`friend`),
  KEY `user` (`user`),
  KEY `friend` (`friend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `friends2` (
  `user1` int(11) NOT NULL,
  `user2` int(11) NOT NULL,
  `friend1` enum('0','1') NOT NULL DEFAULT '0',
  `friend2` enum('0','1') NOT NULL DEFAULT '0',
  KEY `user1` (`user1`),
  KEY `user2` (`user2`),
  KEY `friend1` (`friend1`),
  KEY `friend2` (`friend2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;