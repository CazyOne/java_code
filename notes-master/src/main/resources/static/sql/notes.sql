/*
 Navicat Premium Data Transfer

 Source Server         : cxm
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : notes

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 20/11/2024 21:20:06
*/
DROP DATABASE IF EXISTS `notes`;

CREATE DATABASE `notes`;

USE notes;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_notes
-- ----------------------------
DROP TABLE IF EXISTS `t_notes`;
CREATE TABLE `t_notes`  (
  `notes_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '错题编号',
  `notes_title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '错题标题',
  `promulgator` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '发布者账号',
  `priority` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '优先级',
  `proficiency` int(0) NOT NULL DEFAULT 0 COMMENT '熟练度',
  `subject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '错题内容',
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '标准答案',
  `respond` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '我的答案',
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '错题内容',
  `notes_group` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '错题分组',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `errorbook_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`notes_id`) USING BTREE,
  INDEX `promulgator`(`promulgator`) USING BTREE,
  INDEX `index_notes_id`(`notes_id`) USING BTREE,
  INDEX `t_notes_notes_id_errorbook_name_index`(`notes_id`, `errorbook_name`) USING BTREE COMMENT 'errorbook_fk',
  CONSTRAINT `t_notes_ibfk_1` FOREIGN KEY (`promulgator`) REFERENCES `t_user` (`account`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_notes
-- ----------------------------
INSERT INTO `t_notes` VALUES (1, '字形辨析', 'Seven', '低优先级', 5, '<p>下列词语中，字形正确的一项是：\nA. 准确无误\nB. 向导引领\nC. 百忙之中\nD. 咨询建议</p>', '<p>A</p>', '<p>B</p>', '<ul><li>A 选项“准确无误”是正确的，“准确”没有错别字。</li><li>B 选项“向导引领”错误，“向导”应为“向导”，而不是“向导引领”。应该是“引导”，意思是指导、带领。</li><li>C 选项“百忙之中”是错误的，应为“百忙之中”，常用词组是“百忙之中”，而不是“百忙中”。</li><li>D 选项“咨询建议”错误，“建议”应当是“建议”。</li></ul>', '语文', 0, '2024-11-20 20:00:34', '周考错题');
INSERT INTO `t_notes` VALUES (2, ' 成语使用错误', 'Seven', '中优先级', 0, '<p>下列句子中，成语使用不正确的一项是：\nA. 他临危不惧，表现得非常冷静。\nB. 他面对困难毫不畏惧，勇往直前。\nC. 他一见到困难就愁眉苦脸，真是困惑不解。\nD. 他勇敢地站出来，表示毫不退缩。</p>', '<p>C</p>', '<p>B</p>', '<ul><li>A 选项：“临危不惧”使用正确，意思是面对危难不害怕。</li><li>B 选项：“毫不畏惧”用法正确，表示毫无恐惧。</li><li>C 选项：“困惑不解”错误。正确的成语是“困惑不解”，而不是“困惑不解”。</li><li>D 选项：“毫不退缩”正确，表示没有退缩</li></ul>', '语文', 0, '2024-11-20 20:01:22', '周考错题');
INSERT INTO `t_notes` VALUES (3, '标点符号使用', 'Seven', '中优先级', 0, '<p>下列句子中标点使用正确的一项是：\nA. 他有了一个想法，于是，他去找了老师。\nB. “我知道了。”他微笑着说。\nC. 大家都喜欢听那位老师讲课，老师讲得很有趣。\nD. 今天，我给大家分享了一个故事，大家非常高兴。</p>', '<p>C</p>', '<p>B</p>', '<ul><li>A 选项：“他有了一个想法，于是，他去找了老师。”句子中，逗号和句号的使用有些混乱，应该改为：“他有了一个想法，于是去找了老师。”</li><li>B 选项：“我知道了。”他微笑着说。错误。直接引语结束后需要使用逗号，而不是句号。正确应该是：“我知道了，”他微笑着说。</li><li>C 选项：标点符号使用是正确的，逗号适当，句子结构清晰。</li><li>D 选项：标点符号使用是正确的，适当的逗号和句号。</li></ul>', '语文', 0, '2024-11-20 20:02:09', '周考错题');
INSERT INTO `t_notes` VALUES (4, '词语搭配', 'Seven', '中优先级', 0, '<p>下列词语搭配不当的一项是：\nA. 攻克难关\nB. 发现错误\nC. 强烈怀疑\nD. 庄严失误</p>', '<p>D</p>', '<p>C</p>', '<ul><li>A 选项：“攻克难关”搭配正确，表示攻克困难。</li><li>B 选项：“发现错误”搭配正确，表示发现问题或失误。</li><li>C 选项：“强烈怀疑”搭配正确，表示怀疑某事的强烈感受。</li><li>D 选项：“庄严失误”搭配不当，“庄严”通常形容正式、严肃的场合，不能搭配“失误”，应该换成“严重失误”或“重大的失误”。</li></ul>', '语文', 0, '2024-11-20 20:03:33', '周考错题');
INSERT INTO `t_notes` VALUES (5, '句子修辞', 'Seven', '中优先级', 0, '<p>下列句子运用修辞手法不当的一项是：\nA. 他看上去很不高兴，脸色阴沉沉的。\nB. 窗外的风像刀子一样刮过我的脸颊。\nC. 这是一场充满激情的比赛，双方队员拼尽全力。\nD. 她就像一朵盛开的花，照亮了整个教室。</p>', '<p>C</p>', '<p>D</p>', '<h3><ul><li>A 选项：“脸色阴沉沉的”是正确的，使用了“沉”字加强了脸色不愉快的情感。</li><li>B 选项：“像刀子一样刮过”是比喻手法，形象生动地描写了风的猛烈，使用正确。</li><li>C 选项：“充满激情的比赛”描述比赛的激烈，情感充沛，使用了恰当的形容词，符合语境。</li><li>D 选项：“像一朵盛开的花”是比喻的修辞手法，表达了她的美丽和光彩，使用恰当。<span style=\"font-weight: normal;\"></span></li></ul></h3>', '语文', 0, '2024-11-20 20:04:18', '周考错题');
INSERT INTO `t_notes` VALUES (6, '代数 - 方程求解', 'Seven', '低优先级', 0, '<p>已知方程2x+3=7x−2，则x= _______。</p>', '<p>1</p>', '<p>5</p>', '<ul><li>将方程两边同时减去&nbsp;<math><semantics><mrow><mn>2</mn><mi>�</mi></mrow></semantics></math>2x：<p><math><semantics><mrow><mn>3</mn><mo>=</mo><mn>5</mn><mi>�</mi><mo>−</mo><mn>2</mn></mrow></semantics></math>3=5x−2</p></li><li>然后将方程两边同时加上 2：<p><math><semantics><mrow><mn>5</mn><mo>=</mo><mn>5</mn><mi>�</mi></mrow></semantics></math>5=5x</p></li><li>最后，两边同时除以 5，得到：<p><math><semantics><mrow><mi>�</mi><mo>=</mo><mn>1</mn></mrow></semantics></math>x=1</p></li></ul>', '数学', 0, '2024-11-20 20:05:28', '周考错题');
INSERT INTO `t_notes` VALUES (7, '数列 - 等差数列求和', 'Seven', '高优先级', 0, '<p>已知等差数列的首项 <math><semantics><mrow><msub><mi>a</mi><mn>1</mn></msub><mo>=</mo><mn>3</mn></mrow></semantics></math>，公差 <math><semantics><mrow><mi><br/></mi><mn>2</mn></mrow></semantics></math>d=2，求前 5 项的和。</p>', '<p>35</p>', '<p>30</p>', '<ul><li>等差数列求和公式：<math><semantics><mrow><msub><mi>�</mi><mi>�</mi></msub><mo>=</mo><mfrac><mi>�</mi><mn>2</mn></mfrac><mo>×</mo><mo>(</mo><mn>2</mn><msub><mi>�</mi><mn>1</mn></msub><mo>+</mo><mo>(</mo><mi>�</mi><mo>−</mo><mn>1</mn><mo>)</mo><mi>�</mi><mo>)</mo></mrow></semantics></math>Sn=2n×(2a1+(n−1)d)</li><li>代入数据：<p><math><semantics><mrow><msub><mi>�</mi><mn>5</mn></msub><mo>=</mo><mfrac><mn>5</mn><mn>2</mn></mfrac><mo>×</mo><mo>(</mo><mn>2</mn><mo>×</mo><mn>3</mn><mo>+</mo><mo>(</mo><mn>5</mn><mo>−</mo><mn>1</mn><mo>)</mo><mo>×</mo><mn>2</mn><mo>)</mo><mo>=</mo><mfrac><mn>5</mn><mn>2</mn></mfrac><mo>×</mo><mo>(</mo><mn>6</mn><mo>+</mo><mn>8</mn><mo>)</mo><mo>=</mo><mfrac><mn>5</mn><mn>2</mn></mfrac><mo>×</mo><mn>14</mn><mo>=</mo><mn>35</mn></mrow></semantics></math>S5=25×(2×3+(5−1)×2)=25×(6+8)=25×14=35</p></li></ul>', '数学', 0, '2024-11-20 20:06:49', '周考错题');
INSERT INTO `t_notes` VALUES (8, '比例与应用题', 'Seven', '中优先级', 0, '<p>小明和小刚的身高比为 4:5。如果小明的身高是 160 cm，那么小刚的身高是。</p>', '<p>200cm</p>', '<p>200</p>', '<h3><ul><li>设小刚的身高为&nbsp;<math><semantics><mrow><mi>�</mi></mrow></semantics></math>x，根据比例关系：<p><math><semantics><mrow><mfrac><mn>160</mn><mi>�</mi></mfrac><mo>=</mo><mfrac><mn>4</mn><mn>5</mn></mfrac></mrow></semantics></math>x160=54</p></li><li>交叉相乘解得：<p><math><semantics><mrow><mn>160</mn><mo>×</mo><mn>5</mn><mo>=</mo><mn>4</mn><mo>×</mo><mi>�</mi><mspace></mspace><mo>⇒</mo><mspace></mspace><mn>800</mn><mo>=</mo><mn>4</mn><mi>�</mi><mspace></mspace><mo>⇒</mo><mspace></mspace><mi>�</mi><mo>=</mo><mfrac><mn>800</mn><mn>4</mn></mfrac><mo>=</mo><mn>200</mn></mrow></semantics></math>160×5=4×x⇒800=4x⇒x=4800=200</p></li></ul></h3>', '数学', 0, '2024-11-20 20:07:34', '周考错题');
INSERT INTO `t_notes` VALUES (9, '概率 - 抽奖问题', 'Seven', '高优先级', 0, '<p>一个袋子里有 5 个红球和 3 个蓝球，从中随机抽取 1 个球，求抽到红球的概率。</p>', '<p>5/8</p>', '<p>3/8</p>', '<ul><li></li><li>袋子里总共有 8 个球，其中 5 个红球。</li><li>抽到红球的概率为：<p><math><semantics><mrow><mi>�</mi><mo>(</mo><mtext>红球</mtext><mo>)</mo><mo>=</mo><mfrac><mn>5</mn><mn>8</mn></mfrac></mrow></semantics></math>P(红球)=85</p></li></ul>', '数学', 0, '2024-11-20 20:08:03', '周考错题');
INSERT INTO `t_notes` VALUES (10, '整数与因数', 'Seven', '低优先级', 0, '<p>求 36 的所有因数。</p>', '<p>1,2,3,4,6,9,12,18,36</p>', '<p>2,3,4,6,9,12,18,36</p>', '<ul><li>36 的因数是能整除 36 的所有整数。通过分解质因数：<p><math><semantics><mrow><mn>36</mn><mo>=</mo><msup><mn>2</mn><mn>2</mn></msup><mo>×</mo><msup><mn>3</mn><mn>2</mn></msup></mrow></semantics></math>36=22×32</p></li><li>因数是所有&nbsp;<math><semantics><mrow><msup><mn>2</mn><mi>�</mi></msup><mo>×</mo><msup><mn>3</mn><mi>�</mi></msup></mrow></semantics></math>2a×3b&nbsp;的形式，其中&nbsp;<math><semantics><mrow><mi>�</mi></mrow></semantics></math>a&nbsp;和&nbsp;<math><semantics><mrow><mi>�</mi></mrow></semantics></math>b&nbsp;取 0 到 2 之间的整数。所有因数为：<p><math><semantics><mrow><mn>1</mn><mo>,</mo><mn>2</mn><mo>,</mo><mn>3</mn><mo>,</mo><mn>4</mn><mo>,</mo><mn>6</mn><mo>,</mo><mn>9</mn><mo>,</mo><mn>12</mn><mo>,</mo><mn>18</mn><mo>,</mo><mn>36</mn></mrow></semantics></math>1,2,3,4,6,9,12,18,36</p></li></ul>', '数学', 0, '2024-11-20 20:08:38', '周考错题');

-- ----------------------------
-- Table structure for t_photo
-- ----------------------------
DROP TABLE IF EXISTS `t_photo`;
CREATE TABLE `t_photo`  (
  `photo_id` int(0) NOT NULL AUTO_INCREMENT,
  `photo_source` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `photo_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `photo_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`photo_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sign
-- ----------------------------
DROP TABLE IF EXISTS `t_sign`;
CREATE TABLE `t_sign`  (
  `sign_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '签到id',
  `signer` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '签到者账号',
  `year` int(0) NOT NULL COMMENT '年',
  `month` int(0) NOT NULL COMMENT '月',
  `day` int(0) NOT NULL COMMENT '日',
  `sign_date` date NOT NULL COMMENT '格式化日期',
  PRIMARY KEY (`sign_id`) USING BTREE,
  UNIQUE INDEX `signer`(`signer`, `year`, `month`, `day`) USING BTREE,
  CONSTRAINT `t_sign_ibfk_1` FOREIGN KEY (`signer`) REFERENCES `t_user` (`account`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `account` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '账号',
  `password` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `username` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名',
  `telephone` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '手机号码',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '邮箱',
  `user_groups` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '分组',
  `book_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`account`) USING BTREE,
  INDEX `index_account`(`account`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('Seven', '1234', '第七组', '18319234993', '2296379492@qq.com', '语文#英语#数学#物理#历史', '月考错题#周考错题#联考错题');

-- ----------------------------
-- View structure for v_sign
-- ----------------------------
DROP VIEW IF EXISTS `v_sign`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_sign` AS select `t_sign`.`sign_date` AS `sign_date`,count(0) AS `cardNumber` from `t_sign` group by `t_sign`.`sign_date`;

SET FOREIGN_KEY_CHECKS = 1;
