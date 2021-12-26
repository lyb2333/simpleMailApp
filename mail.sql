/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : mail

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 26/12/2021 09:32:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mail_list
-- ----------------------------
DROP TABLE IF EXISTS `mail_list`;
CREATE TABLE `mail_list`  (
  `id` int(100) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `followers` int(100) NOT NULL COMMENT '被关注数',
  `stars` int(100) NOT NULL COMMENT '关注数',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `bio` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人简介',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像图片',
  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mail_list
-- ----------------------------
INSERT INTO `mail_list` VALUES (1, 'Jermy liu', 0, 0, '15162702523@163.com', 'amateur singer', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', '2021-12-24 14:36:11', NULL);
INSERT INTO `mail_list` VALUES (2, 'John snow', 15324, 22, 'john@gamepower.com', 'dragon father', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', '2021-12-25 09:45:51', NULL);
INSERT INTO `mail_list` VALUES (3, 'Adele Adkins', 10000, 24, 'adele@someonelikeyou.com', 'singer', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', '2021-12-25 09:44:07', NULL);
INSERT INTO `mail_list` VALUES (4, 'Bella', 1000, 20, 'bella@unkown.com', 'dancer', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', '2021-12-25 09:45:09', NULL);
INSERT INTO `mail_list` VALUES (5, 'Caroline', 100, 200, 'Caroline@vamparediaries.com', 'girl', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', '2021-12-25 09:50:39', NULL);
INSERT INTO `mail_list` VALUES (6, 'Damon Salvatore', 100, 200, 'damen@vamparediaries.com', 'vampare', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', '2021-12-25 09:51:20', NULL);
INSERT INTO `mail_list` VALUES (7, 'Elena Gilbert', 100, 200, 'elena@vamparediaries.com', 'main character', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', '2021-12-25 09:52:29', NULL);
INSERT INTO `mail_list` VALUES (8, 'Franke', 10, 2000, 'frank@unkown.com', 'doctor', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', '2021-12-25 09:54:44', NULL);
INSERT INTO `mail_list` VALUES (9, 'Gary', 10, 2000, 'Gary@unkown.com', 'programmer', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', '2021-12-25 19:31:05', NULL);
INSERT INTO `mail_list` VALUES (10, 'Helen', 10, 2000, 'Helen@unkown.com', 'programmer', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', '2021-12-25 19:31:43', NULL);
INSERT INTO `mail_list` VALUES (11, 'Karl', 10, 2000, 'Helen@unkown.com', 'programmer', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', '2021-12-25 19:32:10', NULL);
INSERT INTO `mail_list` VALUES (12, 'Linda', 10, 2000, 'Linda@unkown.com', 'programmer', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', '2021-12-25 19:32:25', NULL);
INSERT INTO `mail_list` VALUES (13, 'Michael Jackson', 10, 2000, 'Michael@unkown.com', 'programmer', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', '2021-12-25 19:33:00', NULL);
INSERT INTO `mail_list` VALUES (14, 'Robert', 10, 2000, 'Robert@unkown.com', 'programmer', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', '2021-12-25 19:33:40', NULL);
INSERT INTO `mail_list` VALUES (15, 'Nekelous', 10, 2000, 'Nekelous@unkown.com', 'programmer', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', '2021-12-25 19:33:59', NULL);
INSERT INTO `mail_list` VALUES (16, 'Peter', 10, 2000, 'Peter@unkown.com', 'spider man', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', '2021-12-25 19:34:26', NULL);
INSERT INTO `mail_list` VALUES (17, 'Shelly', 10, 2000, 'Shelly@unkown.com', 'programmer', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', '2021-12-25 19:35:00', NULL);
INSERT INTO `mail_list` VALUES (18, 'Evan You', 10, 2000, 'Evanyou@vuejs.com', 'programmer', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', '2021-12-25 19:36:17', NULL);
INSERT INTO `mail_list` VALUES (19, 'whitney', 10, 2000, 'whitney@vuejs.com', 'programmer', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', '2021-12-25 19:37:31', NULL);

-- ----------------------------
-- Table structure for mail_search_record
-- ----------------------------
DROP TABLE IF EXISTS `mail_search_record`;
CREATE TABLE `mail_search_record`  (
  `id` int(100) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `mail_id` int(100) NULL DEFAULT NULL COMMENT '外键关联mail',
  `search_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '搜索时间',
  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mail_search_record
-- ----------------------------
INSERT INTO `mail_search_record` VALUES (1, 1, '2021-12-24 14:51:16', '2021-12-24 14:51:19');
INSERT INTO `mail_search_record` VALUES (9, 2, '2021-12-24 18:18:33', NULL);
INSERT INTO `mail_search_record` VALUES (11, 7, '2021-12-25 20:43:33', NULL);
INSERT INTO `mail_search_record` VALUES (12, 14, '2021-12-25 20:43:33', NULL);
INSERT INTO `mail_search_record` VALUES (14, 4, '2021-12-25 20:48:35', NULL);

SET FOREIGN_KEY_CHECKS = 1;
