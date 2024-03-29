/*
 Navicat Premium Data Transfer

 Source Server         : and
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : db_movie

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 29/03/2024 13:39:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cinemas
-- ----------------------------
DROP TABLE IF EXISTS `cinemas`;
CREATE TABLE `cinemas`  (
  `cinema_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影院ID',
  `cinema_image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '影院图片URL',
  `cinema_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '影院名称',
  `cinema_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '影院地址',
  `cinema_services` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '影院服务',
  `hotline_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '热线电话',
  PRIMARY KEY (`cinema_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cinemas
-- ----------------------------
INSERT INTO `cinemas` VALUES ('1', 'https://p0.meituan.net/mmdb/fd146c7848a0ebca36eb869dfef7c9331034607.png@292w_292h_1e_1c', '1929嘉莱电影公园(武汉光谷店)', '洪山区珞喻路889号融众国际6层', '退/改签/3D眼镜免押金', '19986951929');
INSERT INTO `cinemas` VALUES ('2', 'https://p0.meituan.net/mmdb/fd146c7848a0ebca36eb869dfef7c9331034607.png@292w_292h_1e_1c', '\r\nCGV影城（凯德西城IMAX店）', '硚口区解放大道十八号凯德广场05层。古田二路入口（古田二路生活一村公交站，古田小学斜对面...', '改签/3D眼镜免押金/儿童优惠/WiFi /可停车', '18502749332');
INSERT INTO `cinemas` VALUES ('3', 'https://p0.meituan.net/mmdb/fd146c7848a0ebca36eb869dfef7c9331034607.png@292w_292h_1e_1c', 'TLV影城（永旺金桥IMAX店）', '江岸区塔子湖街道金桥大道15号永旺梦乐城金桥店3层', '改签/3D眼镜免押金/儿童优惠/可停车', '17771856224');

-- ----------------------------
-- Table structure for movies
-- ----------------------------
DROP TABLE IF EXISTS `movies`;
CREATE TABLE `movies`  (
  `movie_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电影ID',
  `movie_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '电影名称',
  `movie_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '电影类型',
  `director` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '导演',
  `actors` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '演员',
  `poster_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '海报URL',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '地址',
  `synopsis` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '简介',
  `release_date` date NULL DEFAULT NULL COMMENT '上映日期',
  `is_deleted` int NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`movie_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of movies
-- ----------------------------
INSERT INTO `movies` VALUES ('1', '哥斯拉大战金刚2：帝国崛起', '动作,冒险,科幻', '亚当：温加德', '金刚/哥斯拉', 'https://p0.pipi.cn/mmdb/54ecde9a8d351b2c95d23c10d9b9fe0e83a1d.jpg?https://p0.pipi.cn/mmdb/54ecde9a8d351b2c95d23c10d9b9fe0e83a1d.jpg?imageView2/1/w/464/h/644', '中国大陆', '继上一次的怪兽高燃对战之后，金刚和哥斯拉将再度联手对抗一个潜伏在世界中的巨大威胁，并逐步探索这些巨兽们的起源以及骷髅岛等地的奥秘。同时，上古之战的面纱也将会被揭晓，而正是那场战斗创造出了这些超凡的生物，并深刻影响了人类世界的命运。', '2024-03-29', 0);
INSERT INTO `movies` VALUES ('2', '灿烂的她', '剧情,家庭', '徐伟', '惠英红,刘浩存,张子贤/刘欢', 'https://p0.pipi.cn/mmdb/54ecde9a5bf0fa50c806d6be52dbfd4ee06ab.jpg?https://p0.pipi.cn/mmdb/54ecde9a5bf0fa50c806d6be52dbfd4ee06ab.jpg?imageView2/1/w/464/h/644', '中国大陆', '慈祥宽容的奶奶（惠英红 饰）与十二年前意外走失的孙女（刘浩存 饰）重逢，祖孙二人从生疏到彼此依偎。相处期间，她们身上的秘密也逐渐被揭开。最终奶奶拯救了这个本对人生不抱希望的“孙女”。', '2024-03-15', 0);
INSERT INTO `movies` VALUES ('3', '你想活出怎样的人生', '剧情,奇幻,动画', '宫崎骏', '山时聪真', 'https://p0.pipi.cn/mmdb/54ecde9a5bf51b8d33cf3e48ab67a6ff1840e.jpg?imageView2/1/w/464/h/644', '中国大陆', '电影讲述了少年牧真人的母亲葬身火海后，他随父亲与继母组成新家庭。深陷悲伤的真人阴郁孤僻，难以融入新环境。一次意外，他跟随一只会说话的苍鹭闯入废弃的神秘塔楼，却不料进入了奇幻的“亡灵世界”，开始了一场不可思议的冒险……', '2024-04-03', 0);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单ID',
  `movie_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '电影名称',
  `venue_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '场馆地址',
  `ticket_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '票价',
  `payment_status` int NULL DEFAULT 0 COMMENT '支付状态(0-未支付 1-已支付)',
  `payment_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `screen_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影厅ID',
  `seat_row` int NULL DEFAULT 0 COMMENT '座位行号',
  `seat_column` int NULL DEFAULT 0 COMMENT '座位列号',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `fk_orders_screens`(`screen_id` ASC) USING BTREE,
  CONSTRAINT `fk_orders_screens` FOREIGN KEY (`screen_id`) REFERENCES `screens` (`screen_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '送你一朵小红花', '万福国际影城/四号厅', 53.00, 0, '2024-03-27 14:26:24', '1', '1', 5, 6);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `role_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '角色名称',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', '管理员');
INSERT INTO `roles` VALUES ('2', '普通用户');

-- ----------------------------
-- Table structure for screens
-- ----------------------------
DROP TABLE IF EXISTS `screens`;
CREATE TABLE `screens`  (
  `screen_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影厅ID',
  `cinema_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影院ID',
  `row_s` int NULL DEFAULT 0 COMMENT '行数',
  `col_s` int NULL DEFAULT 0 COMMENT '列数',
  `movie_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '电影ID',
  `start_time` time NULL DEFAULT '00:00:00' COMMENT '开始时间',
  `end_time` time NULL DEFAULT '00:00:00' COMMENT '结束时间',
  `show_date` date NULL DEFAULT NULL COMMENT '放映日期',
  `screen_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影厅名称',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '票价',
  PRIMARY KEY (`screen_id`) USING BTREE,
  INDEX `cinema_id`(`cinema_id` ASC) USING BTREE,
  INDEX `movie_id`(`movie_id` ASC) USING BTREE,
  CONSTRAINT `screens_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `cinemas` (`cinema_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `screens_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of screens
-- ----------------------------
INSERT INTO `screens` VALUES ('1', '1', 12, 14, '1', '09:00:00', '14:00:00', '2024-03-27', '一号厅', 56.00);
INSERT INTO `screens` VALUES ('2', '1', 10, 12, '1', '11:00:00', '17:00:00', '2024-03-31', '二号厅', 56.00);
INSERT INTO `screens` VALUES ('3', '2', 13, 14, '1', '12:00:00', '20:00:00', '2024-03-12', '一号厅', 56.00);
INSERT INTO `screens` VALUES ('4', '3', 15, 15, '2', '08:00:00', '19:00:00', '2024-03-05', '三号厅', 56.00);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'user' COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '123456' COMMENT '密码',
  `role_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '角色ID',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `role_id`(`role_id` ASC) USING BTREE,
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'user', '123456', '2');
INSERT INTO `users` VALUES ('2', 'admin', '123456', '1');
INSERT INTO `users` VALUES ('2b0fdff1a9e026eba2f9c7f74c49b409', 'user1', '123456', '1');

SET FOREIGN_KEY_CHECKS = 1;
