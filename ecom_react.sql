/*
 Navicat Premium Data Transfer

 Source Server         : dautubenvung
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36)
 Source Host           : localhost:3306
 Source Schema         : ecom_react

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36)
 File Encoding         : 65001

 Date: 07/12/2024 13:51:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for orderitems
-- ----------------------------
DROP TABLE IF EXISTS `orderitems`;
CREATE TABLE `orderitems`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderid` int NULL DEFAULT NULL,
  `productid` int NULL DEFAULT NULL,
  `productqty` int NULL DEFAULT NULL,
  `productprice` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orderid`(`orderid` ASC) USING BTREE,
  INDEX `productid`(`productid` ASC) USING BTREE,
  CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderitems
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NULL DEFAULT NULL,
  `totalprice` decimal(10, 2) NULL DEFAULT NULL,
  `orderstatus` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `paymentmode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `paymentid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userid`(`userid` ASC) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `price` decimal(10, 2) NOT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `stock` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Snake Plant', 'Also known as Mother-in-laws Tongue, this plant has tall, upright leaves with green bands. Its popular for its air-purifying qualities and easy maintenance, thriving in low light and requiring minimal watering.', 400.00, 'https://imgflip.com/s/meme/Smiling-Cat.jpg', 10);
INSERT INTO `products` VALUES (2, 'Nerve Plant', 'This plant has small, dark green leaves with prominent white or pink veins. It prefers indirect light and requires regular watering, as it enjoys a humid environment.', 200.00, 'https://imgflip.com/s/meme/Smiling-Cat.jpg', 10);
INSERT INTO `products` VALUES (3, 'Spider Plant', 'This plant has long, arching leaves with green and white stripes. Known for its air-purifying properties, it grows quickly and can tolerate various light conditions, though it prefers indirect light.', 300.00, 'https://imgflip.com/s/meme/Smiling-Cat.jpg', 10);
INSERT INTO `products` VALUES (4, 'Rubber Plant', 'This plant features large, glossy, dark green leaves. It thrives in bright, indirect light and needs occasional watering, making it a popular indoor plant choice for improving air quality.', 450.00, 'https://imgflip.com/s/meme/Smiling-Cat.jpg', 10);
INSERT INTO `products` VALUES (5, 'Golden Pothos / Money Plant', 'Known as the Money Plant, this plant has heart-shaped, green leaves with yellow variegation. Its resilient and grows well in low light, making it a great beginner-friendly indoor plant.', 350.00, 'https://imgflip.com/s/meme/Smiling-Cat.jpg', 10);
INSERT INTO `products` VALUES (6, 'Jade Plant', 'The Jade Plant has thick, fleshy, oval-shaped leaves. Its a succulent that stores water in its leaves, requiring minimal watering and doing well in bright, indirect light.', 500.00, 'https://imgflip.com/s/meme/Smiling-Cat.jpg', 10);
INSERT INTO `products` VALUES (7, 'Anthurium', 'This plant has glossy green leaves and vibrant red or pink spathes (flower-like structures). It does best in bright, indirect light and prefers a humid environment.', 600.00, 'https://imgflip.com/s/meme/Smiling-Cat.jpg', 10);
INSERT INTO `products` VALUES (8, 'Golden Money Plant', 'This variety of the Money Plant has bright, lime-green leaves. Like other pothos varieties, it’s easy to care for and can thrive in low to moderate light.', 300.00, 'https://imgflip.com/s/meme/Smiling-Cat.jpg', 10);
INSERT INTO `products` VALUES (9, 'Dracaena', 'This plant has long, green, lance-shaped leaves. Dracaena varieties are popular indoor plants that can tolerate low light and require moderate watering.', 550.00, 'https://imgflip.com/s/meme/Smiling-Cat.jpg', 10);

-- ----------------------------
-- Table structure for user_data
-- ----------------------------
DROP TABLE IF EXISTS `user_data`;
CREATE TABLE `user_data`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `user_data_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_data
-- ----------------------------
INSERT INTO `user_data` VALUES (1, 'Linh Nguyen', 'silinh66@gmail.com', '0819841138', 'O 19 Lo 7 Den Lu 1', 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Linh', 'silinh66@gmail.com', '$2b$10$t8sz6iu/5YNsszFA2zwGV.r3eU/0ixrfzdiJS8vLCS/wsMtVqoPqy');

SET FOREIGN_KEY_CHECKS = 1;
