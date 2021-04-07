/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : 127.0.0.1:3306
 Source Schema         : dx3906

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 07/04/2021 14:37:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for challengers
-- ----------------------------
DROP TABLE IF EXISTS `challengers`;
CREATE TABLE `challengers`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `challenge_id` int(10) UNSIGNED NOT NULL COMMENT '活动id',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '参与者用户id',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '挑战内容',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态，默认0：待审核，1：通过审核，2：不通过',
  `result` tinyint(4) NOT NULL DEFAULT 0 COMMENT '结果，默认0：待公布，1：成功，2：失败',
  `like_num` int(11) NOT NULL DEFAULT 0 COMMENT '点赞数，来自parti',
  `comment_num` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评论数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '挑战参与表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for challenges
-- ----------------------------
DROP TABLE IF EXISTS `challenges`;
CREATE TABLE `challenges`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `begin_date` datetime(0) NOT NULL COMMENT '开始时间',
  `end_date` datetime(0) NOT NULL COMMENT '结束时间',
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '0：平台，>0：群组',
  `subject_id` int(10) UNSIGNED NOT NULL COMMENT '主题，0：普通，>0：专属，例如戒烟、跑步',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '活动描述',
  `num` int(10) UNSIGNED NOT NULL COMMENT '第几期，根据group_id和subject_id计算自增',
  `create_user_id` int(10) UNSIGNED NOT NULL COMMENT '创建人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '挑战表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `challenge_id` int(10) UNSIGNED NOT NULL COMMENT '挑战id',
  `challenger_id` int(11) NOT NULL DEFAULT 0 COMMENT '参与id，0：挑战的评论，>0：参与的评论',
  `from_user_id` int(10) UNSIGNED NOT NULL COMMENT '评论人id',
  `to_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '回复用户id，0：无回复人，>0：有回复人',
  `content` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `status` tinyint(255) UNSIGNED NOT NULL COMMENT '状态，0：未审核，1：通过，2：不通过，3：删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '群组名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for likes
-- ----------------------------
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `challenge_id` int(10) UNSIGNED NOT NULL COMMENT '挑战id',
  `challenger_id` int(10) UNSIGNED NOT NULL COMMENT '参与id，0：挑战的点赞，>0：参与的点赞',
  `liked_user_id` int(10) UNSIGNED NOT NULL COMMENT '点赞人id',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参与点赞表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `account` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '账号，字母、数字、下划线',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码，6-18位',
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '盐',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT 0 COMMENT '性别：1男，2女，0未知',
  `head_img` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `mobile` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '用户状态：0:禁用、1:正常、2:待审核',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `last_login_at` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '令牌' COMMENT '登录令牌',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_login_key`(`account`) USING BTREE,
  INDEX `user_email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (0, 'root', 'root', 'root', 'root', 0, '', '', 'root@dx3906.love', 0, '2021-03-15 20:22:39', '2021-04-07 11:34:30', NULL, '');

SET FOREIGN_KEY_CHECKS = 1;
