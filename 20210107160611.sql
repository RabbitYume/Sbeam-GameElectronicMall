/*
MySQL Backup
Database: game
Backup Time: 2021-01-07 16:06:12
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `game`.`game`;
DROP TABLE IF EXISTS `game`.`gameimg`;
DROP TABLE IF EXISTS `game`.`gamekey`;
DROP TABLE IF EXISTS `game`.`gameorder`;
DROP TABLE IF EXISTS `game`.`shopcar`;
DROP TABLE IF EXISTS `game`.`supplier`;
DROP TABLE IF EXISTS `game`.`type`;
DROP TABLE IF EXISTS `game`.`user`;
CREATE TABLE `game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gamename` varchar(255) NOT NULL,
  `price` double(10,2) DEFAULT NULL,
  `supplierid` int(11) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`gamename`) USING BTREE,
  KEY `price` (`price`),
  KEY `supplierid` (`supplierid`),
  KEY `gamename` (`gamename`),
  CONSTRAINT `supplierid` FOREIGN KEY (`supplierid`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
CREATE TABLE `gameimg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gamename` varchar(255) NOT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`gamename`) USING BTREE,
  KEY `gamename` (`gamename`),
  CONSTRAINT `gamename` FOREIGN KEY (`gamename`) REFERENCES `game` (`gamename`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
CREATE TABLE `gamekey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) NOT NULL,
  `gameid` int(11) NOT NULL,
  `gamekey` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`orderid`,`gameid`) USING BTREE,
  KEY `orderid` (`orderid`),
  CONSTRAINT `orderid` FOREIGN KEY (`orderid`) REFERENCES `gameorder` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
CREATE TABLE `gameorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) DEFAULT NULL,
  `gameid` int(11) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `pay` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderid` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
CREATE TABLE `shopcar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gameid` int(11) DEFAULT NULL,
  `gameprice` double(10,2) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gameid` (`gameid`),
  KEY `userid` (`username`),
  KEY `gameprice` (`gameprice`),
  CONSTRAINT `gameid` FOREIGN KEY (`gameid`) REFERENCES `game` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gameprice` FOREIGN KEY (`gameprice`) REFERENCES `game` (`price`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userid` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suppliername` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `userpwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
BEGIN;
LOCK TABLES `game`.`game` WRITE;
DELETE FROM `game`.`game`;
INSERT INTO `game`.`game` (`id`,`gamename`,`price`,`supplierid`,`typeid`) VALUES (1, '赛博朋克2077', 298.00, 3, 1),(2, '巫师3：狂猎', 127.00, 3, 1),(3, 'Heavy Rain', 68.00, 4, 2),(4, 'Beyond:Two Souls', 68.00, 4, 2),(5, 'Detroit: Become Human', 128.00, 4, 2),(6, 'Overcooked!2', 98.00, 5, 3),(7, 'Overcooked', 68.00, 5, 3),(8, 'Moving Out', 98.00, 5, 3),(9, '疑案追声', 38.00, 6, 4),(10, '只只大冒险', 58.00, 6, 3),(11, '彩虹坠入', 48.00, 6, 4),(12, 'BattleBlock Theater', 48.00, 7, 3),(13, 'Pit People', 70.00, 7, 5),(14, 'Castle Crashers', 48.00, 7, 2),(15, 'Beholder 2', 49.00, 8, 5),(16, 'Beholder', 36.00, 8, 5),(17, '失落城堡', 33.00, 9, 6),(18, 'Dead by Daylight', 82.00, 10, 7),(19, 'The Forest', 70.00, 11, 7),(20, 'Monster Hunter: World', 203.00, 12, 1),(21, 'PLAYERUNKNOWN\'S BATTLEGROUNDS', 98.00, 13, 8),(22, 'Grand Theft Auto V', 119.00, 14, 6),(23, 'Red Dead Redemption 2', 249.00, 14, 2),(24, 'Sekiro:Shadows Die Twice', 268.00, 16, 6),(25, 'NieR:Automata', 274.00, 15, 6),(26, 'DARK SOULS 3', 268.00, 17, 1),(27, 'DEATH STRANDING', 298.00, 18, 9),(28, 'Stardew Valley', 48.00, 19, 1),(29, 'Mirror', 11.00, 20, 10),(31, 'Cute Honey2', 11.00, 21, 10),(36, '测试', 25.00, 2, 11),(37, 'Sid Meier’s Civilization VI', 199.00, 24, 5),(38, '三色绘恋', 11.00, 26, 10),(39, 'Cities: Skylines', 88.00, 27, 5),(40, '战地风云5', 298.00, 28, 8),(41, 'Portal2', 37.00, 29, 4),(42, 'asdasd', 110.00, 1, 11);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `game`.`gameimg` WRITE;
DELETE FROM `game`.`gameimg`;
INSERT INTO `game`.`gameimg` (`id`,`gamename`,`imgurl`) VALUES (1, '赛博朋克2077', 'img/game/2077.png'),(2, '巫师3：狂猎', 'img/game/theWitcher3.png'),(3, 'Heavy Rain', 'img/game/heavrRain.png'),(4, 'Beyond:Two Souls', 'img/game/beyond.png'),(5, 'Detroit: Become Human', 'img/game/detroit.png'),(6, 'Overcooked!2', 'img/game/overcooked2.png'),(7, 'Overcooked', 'img/game/overcooked.png'),(8, 'Moving Out', 'img/game/movingout.png'),(9, '疑案追声', 'img/game/unheard.png'),(10, '只只大冒险', 'img/game/biped.png'),(11, '彩虹坠入', 'img/game/irisfall.png'),(12, 'BattleBlock Theater', 'img/game/battleblock.png'),(13, 'Pit People', 'img/game/pitpeople.png'),(14, 'Castle Crashers', 'img/game/castlecrashers.png'),(15, 'Beholder 2', NULL),(16, 'Beholder', NULL),(17, '失落城堡', 'img/game/lostcastle.png'),(18, 'Dead by Daylight', 'img/game/deadbydaylight.png'),(19, 'The Forest', 'img/game/theforest.png'),(20, 'Monster Hunter: World', 'img/game/MHW.png'),(21, 'PLAYERUNKNOWN\'S BATTLEGROUNDS', 'img/game/PUBG.png'),(22, 'Grand Theft Auto V', 'img/game/GTA5.png'),(23, 'Red Dead Redemption 2', 'img/game/reddeadredemption2.png'),(24, 'Sekiro:Shadows Die Twice', 'img/game/sekiro.png'),(25, 'NieR:Automata', 'img/game/nieR.png'),(26, 'DARK SOULS 3', 'img/game/darksouls3.png'),(27, 'DEATH STRANDING', 'img/game/deathstranding.png'),(28, 'Stardew Valley', 'img/game/stardewValley.png'),(29, 'Mirror', 'img/game/mirror.png'),(31, 'Cute Honey2', 'img/game/cuteHoney2.png'),(37, 'Sid Meier’s Civilization VI', 'img/game/sidMeiers6.png'),(38, '三色绘恋', 'img/game/tircolourLovestory.png'),(39, 'Cities: Skylines', 'img/game/cityskylines.png'),(40, '战地风云5', 'img/game/battlefield5.png'),(41, 'Portal2', 'img/game/portal2.png'),(42, 'asdasd', 'img/game/751ca203a4a041348cb38b2e0bf84c62.png');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `game`.`gamekey` WRITE;
DELETE FROM `game`.`gamekey`;
INSERT INTO `game`.`gamekey` (`id`,`orderid`,`gameid`,`gamekey`) VALUES (1, 123456, 1, 'FAB0I-C5E5D-FM75Z'),(2, 456789, 2, 'V93AX-0XVYT-9LFDI'),(3, 147963, 1, 'FAB0I-C5E5D-FM75Z'),(4, 267843, 2, 'P7yj6-300aa-EfXou'),(5, 267843, 4, '2zdRD-n3579-0n68c'),(6, 800818, 7, '92Q0Q-vmg9W-5QZ2v'),(7, 353152, 41, '82YnH-75028-4CK7b'),(8, 564022, 17, '1KQld-QX9P5-M6G8B'),(9, 376901, 18, 'VE2tg-80XjK-Qnt14'),(10, 376901, 19, 'm6881-61H42-G8922'),(11, 863463, 19, 've33K-X0Q5W-27806'),(12, 381795, 19, '4VRH4-28E85-861bg'),(13, 315464, 19, '99N86-s2fUc-5Na64'),(14, 456750, 17, 'TEF3S-Q337i-s85Yt'),(15, 481832, 18, '4vk2E-7z65K-h14gT'),(16, 390209, 17, 'oRyNf-7839w-kiy1w'),(19, 943341, 20, 'Q166J-K1zPB-P22S2'),(20, 738207, 28, '1nEO5-712j7-Ojx6R'),(21, 831768, 7, 'w6875-fR8YU-6tkLc'),(22, 269708, 17, '2o47Q-2xs1L-g4AUA'),(23, 269708, 4, '341V2-XUnuC-63C5k');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `game`.`gameorder` WRITE;
DELETE FROM `game`.`gameorder`;
INSERT INTO `game`.`gameorder` (`id`,`orderid`,`gameid`,`price`,`time`,`pay`,`username`) VALUES (1, 123456, 1, 298.00, '2020-12-25 14:53:20', '是', 'test1'),(2, 456789, 2, 127.00, '2020-12-25 14:54:18', '是', 'user2'),(3, 852369, 7, 68.00, '2020-12-25 14:55:36', '否', 'user3'),(4, 852369, 6, 98.00, '2020-12-25 14:55:36', '否', 'user3'),(8, 111, 17, 11.10, NULL, '否', NULL),(9, 147963, 1, 298.00, '2020-12-30 09:26:12', '是', 'user3'),(10, 732157, 2, 127.00, '2020-12-30 17:01:42', '是', 'user3'),(11, 644935, 2, 127.00, '2020-12-30 17:05:29', '是', 'user3'),(12, 117602, 2, 127.00, '2020-12-30 17:10:46', '是', 'user3'),(13, 267843, 2, 127.00, '2020-12-30 17:17:15', '是', 'user3'),(14, 267843, 4, 68.00, '2020-12-30 17:17:15', '是', 'user3'),(15, 800818, 7, 68.00, '2020-12-30 19:11:05', '是', 'user3'),(16, 353152, 41, 37.00, '2021-01-04 09:42:33', '是', 'user3'),(17, 564022, 17, 33.00, '2021-01-04 14:25:38', '是', 'user3'),(18, 376901, 18, 82.00, '2021-01-04 14:26:30', '是', 'user3'),(19, 376901, 19, 70.00, '2021-01-04 14:26:30', '是', 'user3'),(20, 863463, 19, 70.00, '2021-01-06 14:46:52', '是', 'test1'),(21, 381795, 19, 70.00, '2021-01-06 14:58:34', '是', 'test1'),(22, 315464, 19, 70.00, '2021-01-06 15:03:00', '是', 'test1'),(23, 456750, 17, 33.00, '2021-01-06 15:31:36', '是', 'test1'),(24, 481832, 18, 82.00, '2021-01-06 15:32:24', '是', 'test1'),(25, 390209, 17, 33.00, '2021-01-06 16:09:06', '是', 'test1'),(26, 647162, 18, 82.00, '2021-01-06 17:24:56', '否', 'test1'),(27, 762134, 18, 82.00, '2021-01-06 17:29:23', '否', 'test1'),(28, 370036, 2, 127.00, '2021-01-06 18:16:09', '否', 'test1'),(29, 952115, 2, 127.00, '2021-01-06 18:19:02', '否', 'test1'),(30, 416548, 1, 298.00, '2021-01-06 18:23:52', '否', 'test1'),(31, 461719, 5, 128.00, '2021-01-06 18:26:48', '否', 'test1'),(32, 129189, 8, 98.00, '2021-01-06 18:32:59', '否', 'test1'),(33, 727812, 3, 68.00, '2021-01-07 09:43:48', '否', 'test2'),(34, 433180, 3, 68.00, '2021-01-07 09:54:14', '否', 'test2'),(35, 378067, 4, 68.00, '2021-01-07 09:56:53', '否', 'test2'),(36, 504794, 7, 68.00, '2021-01-07 10:02:36', '否', 'test2'),(37, 498530, 7, 68.00, '2021-01-07 10:03:48', '否', 'test2'),(38, 308317, 38, 11.00, '2021-01-07 10:04:45', '否', 'test2'),(39, 162970, 17, 33.00, '2021-01-07 10:25:46', '否', 'test2'),(40, 938659, 17, 33.00, '2021-01-07 10:29:43', '否', 'test1'),(41, 162560, 17, 33.00, '2021-01-07 10:39:30', '否', 'test1'),(42, 740334, 17, 33.00, '2021-01-07 10:40:07', '否', 'test1'),(43, 888135, 17, 33.00, '2021-01-07 10:40:25', '否', 'test1'),(44, 308429, 17, 33.00, '2021-01-07 10:42:26', '否', 'test1'),(45, 681972, 12, 48.00, '2021-01-07 10:46:07', '否', 'test1'),(46, 936356, 12, 48.00, '2021-01-07 10:53:33', '否', 'test1'),(47, 686185, 17, 33.00, '2021-01-07 10:53:56', '否', 'test1'),(48, 916872, 2, 127.00, '2021-01-07 10:59:36', '否', 'test1'),(49, 371161, 2, 127.00, '2021-01-07 11:21:32', '否', 'test1'),(50, 290524, 1, 298.00, '2021-01-07 11:23:08', '否', 'test1'),(51, 746615, 8, 98.00, '2021-01-07 11:32:01', '否', 'test1'),(52, 431391, 8, 98.00, '2021-01-07 11:33:15', '否', 'test1'),(53, 296868, 6, 98.00, '2021-01-07 14:21:24', '否', 'user3'),(54, 541944, 1, 298.00, '2021-01-07 14:26:12', '否', 'test1'),(55, 197298, 5, 128.00, '2021-01-07 14:27:47', '否', 'test1'),(56, 413217, 38, 11.00, '2021-01-07 14:39:27', '否', 'test1'),(57, 618846, 41, 37.00, '2021-01-07 14:41:07', '否', 'test1'),(58, 307007, 17, 33.00, '2021-01-07 14:45:38', '否', 'test1'),(60, 943341, 20, 203.00, '2021-01-07 14:59:13', '是', 'test1'),(61, 738207, 28, 48.00, '2021-01-07 15:01:51', '是', 'test1'),(62, 831768, 7, 68.00, '2021-01-07 15:03:58', '是', 'test1'),(63, 269708, 17, 33.00, '2021-01-07 15:08:47', '是', 'user3'),(64, 269708, 4, 68.00, '2021-01-07 15:08:47', '是', 'user3');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `game`.`shopcar` WRITE;
DELETE FROM `game`.`shopcar`;
INSERT INTO `game`.`shopcar` (`id`,`gameid`,`gameprice`,`username`) VALUES (15, 12, 48.00, 'user1');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `game`.`supplier` WRITE;
DELETE FROM `game`.`supplier`;
INSERT INTO `game`.`supplier` (`id`,`suppliername`) VALUES (1, 'test1'),(2, 'test2'),(3, '\r\nCD PROJEKT RED'),(4, 'Quantic Dream'),(5, '\r\nTeam17 Digital'),(6, 'NEXT Studios'),(7, 'The Behemoth'),(8, 'Alawar Premium'),(9, 'Hunter Studio'),(10, 'Behaviour Interactive Inc.'),(11, '\r\nEndnight Games Ltd'),(12, '\r\nCAPCOM Co., Ltd.'),(13, '\r\nKRAFTON, Inc.'),(14, 'Rockstar Games'),(15, 'Square Enix'),(16, 'FromSoftware'),(17, '\r\nFromSoftware, Inc.'),(18, 'KOJIMA PRODUCTIONS'),(19, 'ConcernedApe'),(20, 'KAGAMI WORKs'),(21, 'Lovely Games'),(23, 'test3'),(24, '2K'),(26, 'HL-Galgame'),(27, '\r\nColossal Order Ltd.'),(28, '\r\nDICE'),(29, '\r\nValve'),(30, 'test4');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `game`.`type` WRITE;
DELETE FROM `game`.`type`;
INSERT INTO `game`.`type` (`id`,`type`) VALUES (1, '角色扮演'),(2, '冒险'),(3, '合作'),(4, '解谜'),(5, '策略'),(6, '动作'),(7, '恐怖'),(8, '射击'),(9, '开放世界'),(10, '动漫'),(11, 'test');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `game`.`user` WRITE;
DELETE FROM `game`.`user`;
INSERT INTO `game`.`user` (`id`,`username`,`userpwd`) VALUES (1, 'test1', '123'),(2, 'test2', '456'),(3, 'user1', '789'),(4, 'user2', 'qwedf'),(5, 'user3', 'asd'),(8, 'user5', 'sagf'),(9, '测试', 'fghfgh'),(10, 'user7', 'asgwea'),(11, 'user8', 'sgrwg'),(12, 'user9', 'sadgr'),(13, '测试3', '123456'),(14, '测试4', '123456'),(15, '测试5', '123456'),(16, '测试6', '456789'),(17, '测试7', '123789'),(18, 'test5', 'qwewqe'),(19, 'test3', 'afgerg'),(20, 'test4', 'asget'),(21, '测试1', 'zxczxc'),(22, 'test6', 'sdfgersg'),(23, 'user10', 'agerg'),(24, 'user11', 'regerg'),(25, 'user12', 'ergerg'),(26, 'user13', 'erhrh'),(27, 'user14', 'fghr5t'),(28, 'user15', 'fghr'),(29, 'user16', 'rthvd'),(30, 'user17', '153rger'),(31, 'user18', 'eh51erg'),(32, 'user19', 'erger55'),(33, 'user20', 'esgsre36'),(34, 'user21', 'erge215'),(35, 'user22', 'egher51'),(36, 'user23', 'erg1re53'),(37, 'user24', 'rsg5r65'),(38, 'user25', 'rg1r53'),(39, '张三', '123456');
UNLOCK TABLES;
COMMIT;
