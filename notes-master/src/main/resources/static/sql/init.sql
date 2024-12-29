DROP DATABASE IF EXISTS `notes`;

CREATE DATABASE `notes`;

USE notes;

DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`
(
    `account`     varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
    `password`    varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
    `username`    varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
    `telephone`   varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码',
    `email`       varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
    `user_groups` text CHARACTER SET utf8 COLLATE utf8_general_ci        NULL COMMENT '分组',
    PRIMARY KEY (`account`) USING BTREE,
    INDEX `index_account` (`account`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `notes`.`t_user` (`account`, `password`, `username`, `telephone`, `email`, `user_groups`)
VALUES ('chenliu', 'cl123456', '陈六', '13316397963', 'chenliu@163.com', NULL);
INSERT INTO `notes`.`t_user` (`account`, `password`, `username`, `telephone`, `email`, `user_groups`)
VALUES ('huangshi', 'hs123456', '黄十', '15815632498', 'huangshi@163.com', NULL);
INSERT INTO `notes`.`t_user` (`account`, `password`, `username`, `telephone`, `email`, `user_groups`)
VALUES ('lisi', 'ls123456', '李四', '13430241235', '2704145572@qq.com', '文言文#英语短文填空#诗歌#乘法#除法#加法#减法#勾股定理#成语#方程');
INSERT INTO `notes`.`t_user` (`account`, `password`, `username`, `telephone`, `email`, `user_groups`)
VALUES ('maba', 'mb123456', '马八', '13654879632', 'maba@163.com', NULL);
INSERT INTO `notes`.`t_user` (`account`, `password`, `username`, `telephone`, `email`, `user_groups`)
VALUES ('wangwu', 'ww123456', '王五', '13645236589', 'wangwu@163.com', NULL);
INSERT INTO `notes`.`t_user` (`account`, `password`, `username`, `telephone`, `email`, `user_groups`)
VALUES ('xuqi', 'xq123456', '许七', '13352679568', 'xuqi@163.com', NULL);
INSERT INTO `notes`.`t_user` (`account`, `password`, `username`, `telephone`, `email`, `user_groups`)
VALUES ('zhangsan', 'zs123456', '张三', '15915712354', '1712131536@qq.com', '加法#减法#乘法#除法#文言文#诗歌#英语短文填空#三角形#正方形#翻译');
INSERT INTO `notes`.`t_user` (`account`, `password`, `username`, `telephone`, `email`, `user_groups`)
VALUES ('zhengjiu', 'zj123456', '郑九', '13912546983', 'zhengjiu@163.com', NULL);
INSERT INTO `notes`.`t_user` (`account`, `password`, `username`, `telephone`, `email`, `user_groups`)
VALUES ('yy', '', '迎迎', '13128438703', '1712131536@qq.com', NULL);

SET FOREIGN_KEY_CHECKS = 1;

DROP TABLE IF EXISTS `t_notes`;
CREATE TABLE `t_notes`
(
    `notes_id`    int(11)                                                NOT NULL AUTO_INCREMENT COMMENT '错题编号',
    `notes_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '错题标题',
    `promulgator` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布者账号',
    `priority`    varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT '' COMMENT '优先级',
    `proficiency` int(11)                                                NOT NULL default 0 COMMENT '熟练度',
    `subject`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '错题内容',
    `answer`      text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '标准答案',
    `respond`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '我的答案',
    `summary`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '错题内容',
    `notes_group` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT '' COMMENT '错题分组',
    `deleted`     tinyint(1)                                             NULL     DEFAULT 0 COMMENT '是否删除',
    `update_time` datetime                                               NULL     DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`notes_id`) USING BTREE,
    INDEX `promulgator` (`promulgator`) USING BTREE,
    INDEX `index_notes_id` (`notes_id`) USING BTREE,
    CONSTRAINT `t_notes_ibfk_1` FOREIGN KEY (`promulgator`) REFERENCES `t_user` (`account`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 29
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (38, '数学', 'zhangsan', '低优先级', 0, '<p>1+1=3</p>', '<p>1+1=2</p>', '<p>1+1=3</p>', '<p>粗心大意</p>', '加法', 0, '2023-05-03 13:47:40');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (39, '数学', 'zhangsan', '中优先级', 0, '<p>100-50=40</p>', '<p>100-50=50</p>', '<p>100-50=40</p>', '<p>对减法不够熟悉</p>', '减法', 0, '2023-05-03 13:48:20');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (40, '数学', 'zhangsan', '高优先级', 0, '<p>100?10=2000</p>', '<p>100?10=1000<br/></p>', '<p>100?10=2000<br/></p>', '<p>混淆了乘法和加法</p>', '乘法', 0, '2023-05-04 13:49:27');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (41, '数学', 'zhangsan', '高优先级', 0, '<p>100?10=1</p>', '<p>100?10=10</p>', '<p>100?10=1<br/></p>', '<p>对除法运算不够细心</p>', '除法', 0, '2023-05-05 13:51:09');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (42, '语文', 'zhangsan', '高优先级', 10, '<p>翻译以下句子</p><p>先帝创业未半而中道崩殂，今天下三分，益州疲弊，此诚危急存亡之秋也。<br/></p>', '<p>先帝创业未半而中道崩殂，今天下三分，益州疲弊，此诚危急存亡之秋也。<br/></p><p>翻译:先帝开创大业未完成一半却中途去世了。现在天下分为三国，我们蜀汉人力疲惫，民生凋敝，这实在是国家危急存亡的时刻啊。</p>', '<p>先帝创业未半而中道崩殂，今天下三分，益州疲弊，此诚危急存亡之秋也。<br/></p><p>翻译:先帝开创大业未完成一半却中途去世了。现在天下分为三国，益州很疲惫,这真的很危急。</p>', '<p>对\"益州\",\"诚\"的翻译错误</p>', '文言文', 0, '2023-05-06 13:57:08');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (43, '语文', 'zhangsan', '高优先级', 5, '<p>翻译以下文言文</p><p>落霞与孤鹜齐飞，秋水共长天一色<br/></p>', '<p>翻译以下文言文<br/></p><p>落霞与孤鹜齐飞，秋水共长天一色</p><p>翻译:落日映射下的彩霞与孤鸟一齐飞翔，秋天的江水和辽阔的天空连成一片，浑然一色。<br/></p>', '<p>翻译以下文言文</p><p>落霞与孤鹜齐飞，秋水共长天一色</p><p>翻译:孤鹜和落日等高,远边的湖水与天色连成一片</p>', '<p>翻译功底差</p>', '文言文', 0, '2023-05-06 14:01:21');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (44, '语文', 'zhangsan', '高优先级', 10, '<p data-we-empty-p=\"\" style=\"text-align:center;\">&nbsp; &nbsp;<img src=\"http://localhost:8080/imgFile/6367ba93-15cd-4e5b-b6e8-c3ddb8768e54.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"http://localhost:8080/imgFile/ab95ca49-01f1-4f32-8eec-ad1bb279c3f2.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"http://localhost:8080/imgFile/a8596460-1f14-49eb-a744-a628f81a0375.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>文言文重点字词翻译已总结</p>', '文言文', 0, '2023-05-06 14:04:12');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (45, '语文', 'zhangsan', '高优先级', 0, '<p>诗歌填写</p><p>忽魂悸以魄动，恍惊起而长嗟。<br/>惟觉时之枕席，______________。<br/></p>', '<p>诗歌填写<br/></p><p>忽魂悸以魄动，恍惊起而长嗟。<br/>惟觉时之枕席，失向来之烟霞。<br/></p>', '<p>诗歌填写</p><p>忽魂悸以魄动，恍惊起而长嗟。<br/>惟觉时之枕席，仙之人兮列如麻。</p>', '<p>对梦游天姥吟留别不够熟悉</p>', '诗歌', 0, '2023-05-07 14:07:23');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (46, '英语', 'zhangsan', '中优先级', 0, '<p>The Xi’an City Wall is the most complete city wall that has survived China’s long history. It&nbsp;<u>41</u>&nbsp;(build) originally to protect the city&nbsp;<u>42</u>&nbsp;the Tang dynasty and has now been completely restored（修复）.<br/></p>', '<p>The Xi’an City Wall is the most complete city wall that has survived China’s long history. It <u>was built</u>&nbsp;(build) originally to protect the city&nbsp;<u>in</u>&nbsp;the Tang dynasty and has now been completely restored（修复）.</p>', '<p>The Xi’an City Wall is the most complete city wall that has survived China’s long history. It <u>builds</u>&nbsp;(build) originally to protect the city <u>at</u>&nbsp;the Tang dynasty and has now been completely restored（修复）.<br/></p>', '<p>对被动语态不熟悉</p>', '英语短文填空', 0, '2023-05-08 14:11:49');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (47, '英语', 'zhangsan', '中优先级', 0, '<p>Due to&nbsp;<u>65</u>&nbsp;growing popularity of environmentally-related and adventure travel, various types&nbsp;<u>66</u>__ trips are now being classified as ecotourism.&nbsp;<br/></p>', '<p>Due to&nbsp;<u>the</u>&nbsp;growing popularity of environmentally-related and adventure travel, various types&nbsp;<u>of</u>&nbsp;trips are now being classified as ecotourism.<br/></p>', '<p>Due to <u>is</u>&nbsp;growing popularity of environmentally-related and adventure travel, various types <u>in</u>__ trips are now being classified as ecotourism.&nbsp;<br/></p>', '<p>从属关系不熟练</p>', '英语短文填空', 0, '2023-05-08 14:13:27');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (48, '英语', 'zhangsan', '中优先级', 0, '<p>&nbsp;<u>56</u>&nbsp;is so breathtaking about the experience is the out-of-this-world scenes<br/></p>', '<p>&nbsp;<u>What</u>&nbsp;is so breathtaking about the experience is the out-of-this-world scenes<br/></p>', '<p>&nbsp;<u>The</u>&nbsp;is so breathtaking about the experience is the out-of-this-world scenes<br/></p>', '<p>没有判断出句子缺乏主语</p>', '英语短文填空', 0, '2023-05-09 14:14:55');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (49, '英语', 'zhangsan', '中优先级', 10, '<p><u>56</u>&nbsp;that most of the rise is due to gains in BMI in rural areas.<br/></p>', '<p><u>and</u> that most of the rise is due to gains in BMI in rural areas.<br/></p>', '<p><u>he</u> that most of the rise is due to gains in BMI in rural areas.<br/></p>', '<p>句子链接词不太懂</p>', '英语短文填空', 0, '2023-05-10 14:18:57');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (50, '数学', 'zhangsan', '高优先级', 15, '<p data-we-empty-p=\"\" style=\"text-align:left;\"><img src=\"http://localhost:8080/imgFile/837fc3d9-c6c0-4b5b-bdd6-79e31e501b47.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>C</p>', '<p>A</p>', '<p>对数轴原点不太理解</p>', '', 0, '2023-05-10 14:21:45');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (51, '数学', 'zhangsan', '中优先级', 5, '<p><img src=\"http://localhost:8080/imgFile/2aa3ac44-c9ad-4109-a5ca-abd29519c65d.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>B</p>', '<p>A</p>', '<p>对方程不熟悉</p>', '', 0, '2023-05-10 14:26:46');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (52, '数学', 'zhangsan', '中优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/fe04d496-4ca7-430b-8fa0-2629f77f3b4a.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>C<br/></p>', '<p>D</p>', '<p>对有理数和绝对值不太熟悉</p>', '', 0, '2023-05-11 14:28:24');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (53, '数学', 'zhangsan', '高优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/7f94fd2c-3809-4a1d-bf16-963a2ded2116.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>A</p>', '<p>C</p>', '<p>对倒数和相反数不太熟悉</p>', '', 0, '2023-05-12 14:30:07');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (54, '英语', 'zhangsan', '高优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/c95b6aad-6db2-4848-9416-0c5247614be1.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>62. an 63. specifically 64. or 65. student’s<br/></p>', '<p>62. a 63. specifical64. and 65. student<br/></p>', '<p>对元音字母开头的单词不熟悉</p>', '英语短文填空', 0, '2023-05-12 14:32:21');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (55, '英语', 'zhangsan', '中优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/c11c84e5-7d95-48c4-89b9-7c6b7616f69a.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>62.neither</p><p>63. to plant</p>', '<p>62.either</p><p>63. plant</p>', '<p>对动词不定式不够熟悉</p>', '英语短文填空', 0, '2023-05-13 14:33:33');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (56, '数学', 'zhangsan', '高优先级', 5, '<p><img src=\"http://localhost:8080/imgFile/54b8f30d-9b84-4ca3-872f-16483a469704.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>B</p>', '<p>D</p>', '<p>对分数的平方不熟悉<br/></p>', '', 0, '2023-05-14 14:35:02');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (57, '语文', 'zhangsan', '高优先级', 15, '<p>默写最后两句古诗<br/><img src=\"http://localhost:8080/imgFile/c57c45c2-2e99-4e10-be47-cd7233da67b7.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>山回路转不见君，雪上空留马行处。<br/></p>', '<p>瀚海阑干百丈冰，愁云惨淡万里凝。<br/></p>', '<p>对古诗的背诵不熟悉</p>', '文言文', 0, '2023-05-14 14:37:01');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (58, '数学', 'lisi', '低优先级', 0, '<p>1+1=3</p>', '<p>1+1=2</p>', '<p>1+1=3</p>', '<p>粗心大意</p>', '加法', 0, '2023-05-15 13:47:40');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (59, '数学', 'lisi', '中优先级', 0, '<p>100-50=40</p>', '<p>100-50=50</p>', '<p>100-50=40</p>', '<p>对减法不够熟悉</p>', '减法', 0, '2023-05-15 13:48:20');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (60, '数学', 'lisi', '高优先级', 0, '<p>100?10=2000</p>', '<p>100?10=1000<br/></p>', '<p>100?10=2000<br/></p>', '<p>混淆了乘法和加法</p>', '乘法', 0, '2023-05-15 13:49:24');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (61, '数学', 'lisi', '高优先级', 0, '<p>100?10=1</p>', '<p>100?10=10</p>', '<p>100?10=1<br/></p>', '<p>对除法运算不够细心</p>', '除法', 0, '2023-05-16 13:51:09');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (62, '语文', 'lisi', '高优先级', 5, '<p>翻译以下句子</p><p>先帝创业未半而中道崩殂，今天下三分，益州疲弊，此诚危急存亡之秋也。<br/></p>', '<p>先帝创业未半而中道崩殂，今天下三分，益州疲弊，此诚危急存亡之秋也。<br/></p><p>翻译:先帝开创大业未完成一半却中途去世了。现在天下分为三国，我们蜀汉人力疲惫，民生凋敝，这实在是国家危急存亡的时刻啊。</p>', '<p>先帝创业未半而中道崩殂，今天下三分，益州疲弊，此诚危急存亡之秋也。<br/></p><p>翻译:先帝开创大业未完成一半却中途去世了。现在天下分为三国，益州很疲惫,这真的很危急。</p>', '<p>对\"益州\",\"诚\"的翻译错误</p>', '文言文', 0, '2023-05-16 13:57:08');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (63, '语文', 'lisi', '高优先级', 5, '<p>翻译以下文言文</p><p>落霞与孤鹜齐飞，秋水共长天一色<br/></p>', '<p>翻译以下文言文<br/></p><p>落霞与孤鹜齐飞，秋水共长天一色</p><p>翻译:落日映射下的彩霞与孤鸟一齐飞翔，秋天的江水和辽阔的天空连成一片，浑然一色。<br/></p>', '<p>翻译以下文言文</p><p>落霞与孤鹜齐飞，秋水共长天一色</p><p>翻译:孤鹜和落日等高,远边的湖水与天色连成一片</p>', '<p>翻译功底差</p>', '文言文', 0, '2023-05-17 14:01:21');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (64, '语文', 'lisi', '高优先级', 10, '<p data-we-empty-p=\"\" style=\"text-align:center;\">&nbsp; &nbsp;<img src=\"http://localhost:8080/imgFile/6367ba93-15cd-4e5b-b6e8-c3ddb8768e54.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"http://localhost:8080/imgFile/ab95ca49-01f1-4f32-8eec-ad1bb279c3f2.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"http://localhost:8080/imgFile/a8596460-1f14-49eb-a744-a628f81a0375.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>文言文重点字词翻译已总结</p>', '文言文', 0, '2023-05-18 14:04:12');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (65, '语文', 'lisi', '高优先级', 0, '<p>诗歌填写</p><p>忽魂悸以魄动，恍惊起而长嗟。<br/>惟觉时之枕席，______________。<br/></p>', '<p>诗歌填写<br/></p><p>忽魂悸以魄动，恍惊起而长嗟。<br/>惟觉时之枕席，失向来之烟霞。<br/></p>', '<p>诗歌填写</p><p>忽魂悸以魄动，恍惊起而长嗟。<br/>惟觉时之枕席，仙之人兮列如麻。</p>', '<p>对梦游天姥吟留别不够熟悉</p>', '诗歌', 0, '2023-05-18 14:07:23');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (66, '英语', 'lisi', '中优先级', 0, '<p>The Xi’an City Wall is the most complete city wall that has survived China’s long history. It&nbsp;<u>41</u>&nbsp;(build) originally to protect the city&nbsp;<u>42</u>&nbsp;the Tang dynasty and has now been completely restored（修复）.<br/></p>', '<p>The Xi’an City Wall is the most complete city wall that has survived China’s long history. It <u>was built</u>&nbsp;(build) originally to protect the city&nbsp;<u>in</u>&nbsp;the Tang dynasty and has now been completely restored（修复）.</p>', '<p>The Xi’an City Wall is the most complete city wall that has survived China’s long history. It <u>builds</u>&nbsp;(build) originally to protect the city <u>at</u>&nbsp;the Tang dynasty and has now been completely restored（修复）.<br/></p>', '<p>对被动语态不熟悉</p>', '英语短文填空', 0, '2023-05-19 14:11:49');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (67, '英语', 'lisi', '中优先级', 5, '<p>Due to&nbsp;<u>65</u>&nbsp;growing popularity of environmentally-related and adventure travel, various types&nbsp;<u>66</u>__ trips are now being classified as ecotourism.&nbsp;<br/></p>', '<p>Due to&nbsp;<u>the</u>&nbsp;growing popularity of environmentally-related and adventure travel, various types&nbsp;<u>of</u>&nbsp;trips are now being classified as ecotourism.<br/></p>', '<p>Due to <u>is</u>&nbsp;growing popularity of environmentally-related and adventure travel, various types <u>in</u>__ trips are now being classified as ecotourism.&nbsp;<br/></p>', '<p>从属关系不熟练</p>', '英语短文填空', 0, '2023-05-19 14:13:27');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (68, '英语', 'lisi', '中优先级', 0, '<p>&nbsp;<u>56</u>&nbsp;is so breathtaking about the experience is the out-of-this-world scenes<br/></p>', '<p>&nbsp;<u>What</u>&nbsp;is so breathtaking about the experience is the out-of-this-world scenes<br/></p>', '<p>&nbsp;<u>The</u>&nbsp;is so breathtaking about the experience is the out-of-this-world scenes<br/></p>', '<p>没有判断出句子缺乏主语</p>', '英语短文填空', 0, '2023-05-20 14:14:55');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (69, '英语', 'lisi', '中优先级', 10, '<p><u>56</u>&nbsp;that most of the rise is due to gains in BMI in rural areas.<br/></p>', '<p><u>and</u> that most of the rise is due to gains in BMI in rural areas.<br/></p>', '<p><u>he</u> that most of the rise is due to gains in BMI in rural areas.<br/></p>', '<p>句子链接词不太懂</p>', '英语短文填空', 0, '2023-05-21 14:18:57');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (70, '数学', 'lisi', '高优先级', 15, '<p data-we-empty-p=\"\" style=\"text-align:left;\"><img src=\"http://localhost:8080/imgFile/837fc3d9-c6c0-4b5b-bdd6-79e31e501b47.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>C</p>', '<p>A</p>', '<p>对数轴原点不太理解</p>', '', 0, '2023-05-21 14:21:45');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (71, '数学', 'lisi', '中优先级', 5, '<p><img src=\"http://localhost:8080/imgFile/2aa3ac44-c9ad-4109-a5ca-abd29519c65d.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>B</p>', '<p>A</p>', '<p>对方程不熟悉</p>', '', 0, '2023-05-22 14:26:46');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (72, '数学', 'lisi', '中优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/fe04d496-4ca7-430b-8fa0-2629f77f3b4a.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>C<br/></p>', '<p>D</p>', '<p>对有理数和绝对值不太熟悉</p>', '', 0, '2023-05-22 14:28:24');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (73, '数学', 'lisi', '高优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/7f94fd2c-3809-4a1d-bf16-963a2ded2116.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>A</p>', '<p>C</p>', '<p>对倒数和相反数不太熟悉</p>', '', 0, '2023-05-23 14:30:07');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (74, '英语', 'lisi', '高优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/c95b6aad-6db2-4848-9416-0c5247614be1.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>62. an 63. specifically 64. or 65. student’s<br/></p>', '<p>62. a 63. specifical64. and 65. student<br/></p>', '<p>对元音字母开头的单词不熟悉</p>', '英语短文填空', 0, '2023-05-24 14:32:21');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (75, '英语', 'lisi', '中优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/c11c84e5-7d95-48c4-89b9-7c6b7616f69a.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>62.neither</p><p>63. to plant</p>', '<p>62.either</p><p>63. plant</p>', '<p>对动词不定式不够熟悉</p>', '英语短文填空', 0, '2023-05-25 14:33:33');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (76, '数学', 'lisi', '高优先级', 5, '<p><img src=\"http://localhost:8080/imgFile/54b8f30d-9b84-4ca3-872f-16483a469704.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>B</p>', '<p>D</p>', '<p>对分数的平方不熟悉<br/></p>', '', 0, '2023-05-26 14:35:02');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (77, '语文', 'lisi', '高优先级', 0, '<p>默写最后两句古诗<br/><img src=\"http://localhost:8080/imgFile/c57c45c2-2e99-4e10-be47-cd7233da67b7.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>山回路转不见君，雪上空留马行处。<br/></p>', '<p>瀚海阑干百丈冰，愁云惨淡万里凝。<br/></p>', '<p>对古诗的背诵不熟悉</p>', '文言文', 0, '2023-05-27 14:37:01');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (78, '数学', 'lisi', '中优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/08ac7064-7e7f-4b29-bf5f-6b7612846e69.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>C</p>', '<p>A</p>', '<p>计算出现错误</p>', '勾股定理', 0, '2023-05-27 10:47:10');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (79, '语文', 'lisi', '中优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/00e26622-4bf2-47a0-a6dc-ccd6c0f46355.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>C</p>', '<p>A</p>', '<p>对成语的运用不熟悉</p>', '成语', 0, '2023-05-28 10:49:13');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (80, '数学', 'lisi', '中优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/08ac7064-7e7f-4b29-bf5f-6b7612846e69.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>C</p>', '<p>A</p>', '<p>计算出现错误</p>', '勾股定理', 0, '2023-05-29 10:47:10');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (81, '语文', 'lisi', '中优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/00e26622-4bf2-47a0-a6dc-ccd6c0f46355.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>C</p>', '<p>A</p>', '<p>对成语的运用不熟悉</p>', '成语', 0, '2023-05-30 10:49:13');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (82, '数学', 'lisi', '高优先级', 5, '<p><img src=\"http://localhost:8080/imgFile/82880f36-6d96-497a-b23f-66e88e5fb39c.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>x=3</p>', '<p>x=5</p>', '<p>对方程的计算不熟悉</p>', '方程', 0, '2023-05-31 10:53:06');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (83, '语文', 'lisi', '中优先级', 10, '<p><img src=\"http://localhost:8080/imgFile/80011407-3c85-4466-af70-4fbf9443b68d.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>B</p>', '<p>A</p>', '<p>对成语不够熟悉</p>', '成语', 0, '2023-06-01 10:54:02');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (84, '数学', 'lisi', '中优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/08ac7064-7e7f-4b29-bf5f-6b7612846e69.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>C</p>', '<p>A</p>', '<p>计算出现错误</p>', '勾股定理', 0, '2023-06-01 10:47:10');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (85, '语文', 'lisi', '中优先级', 5, '<p><img src=\"http://localhost:8080/imgFile/00e26622-4bf2-47a0-a6dc-ccd6c0f46355.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>C</p>', '<p>A</p>', '<p>对成语的运用不熟悉</p>', '成语', 0, '2023-06-02 10:49:13');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (86, '数学', 'lisi', '高优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/82880f36-6d96-497a-b23f-66e88e5fb39c.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>x=3</p>', '<p>x=5</p>', '<p>对方程的计算不熟悉</p>', '方程', 0, '2023-06-03 10:53:06');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (87, '语文', 'lisi', '中优先级', 5, '<p><img src=\"http://localhost:8080/imgFile/80011407-3c85-4466-af70-4fbf9443b68d.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>B</p>', '<p>A</p>', '<p>对成语不够熟悉</p>', '成语', 0, '2023-06-03 10:54:02');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (88, '英语', 'lisi', '中优先级', 10, '<p><u>56</u>&nbsp;that most of the rise is due to gains in BMI in rural areas.<br/></p>', '<p><u>and</u> that most of the rise is due to gains in BMI in rural areas.<br/></p>', '<p><u>he</u> that most of the rise is due to gains in BMI in rural areas.<br/></p>', '<p>句子链接词不太懂</p>', '英语短文填空', 0, '2023-06-04 14:18:57');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (89, '英语', 'lisi', '高优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/c95b6aad-6db2-4848-9416-0c5247614be1.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>62. an 63. specifically 64. or 65. student’s<br/></p>', '<p>62. a 63. specifical64. and 65. student<br/></p>', '<p>对元音字母开头的单词不熟悉</p>', '英语短文填空', 0, '2023-06-05 14:32:21');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (90, '数学', 'lisi', '高优先级', 15, '<p data-we-empty-p=\"\" style=\"text-align:left;\"><img src=\"http://localhost:8080/imgFile/837fc3d9-c6c0-4b5b-bdd6-79e31e501b47.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>C</p>', '<p>A</p>', '<p>对数轴原点不太理解</p>', '', 0, '2023-06-06 14:21:45');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (91, '语文', 'lisi', '高优先级', 0, '<p>诗歌填写</p><p>忽魂悸以魄动，恍惊起而长嗟。<br/>惟觉时之枕席，______________。<br/></p>', '<p>诗歌填写<br/></p><p>忽魂悸以魄动，恍惊起而长嗟。<br/>惟觉时之枕席，失向来之烟霞。<br/></p>', '<p>诗歌填写</p><p>忽魂悸以魄动，恍惊起而长嗟。<br/>惟觉时之枕席，仙之人兮列如麻。</p>', '<p>对梦游天姥吟留别不够熟悉</p>', '诗歌', 0, '2023-06-06 14:07:23');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (92, '语文', 'lisi', '高优先级', 5, '<p>翻译以下文言文</p><p>落霞与孤鹜齐飞，秋水共长天一色<br/></p>', '<p>翻译以下文言文<br/></p><p>落霞与孤鹜齐飞，秋水共长天一色</p><p>翻译:落日映射下的彩霞与孤鸟一齐飞翔，秋天的江水和辽阔的天空连成一片，浑然一色。<br/></p>', '<p>翻译以下文言文</p><p>落霞与孤鹜齐飞，秋水共长天一色</p><p>翻译:孤鹜和落日等高,远边的湖水与天色连成一片</p>', '<p>翻译功底差</p>', '文言文', 0, '2023-06-07 14:01:21');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (93, '数学', 'lisi', '低优先级', 0, '<p>1+1=3</p>', '<p>1+1=2</p>', '<p>1+1=3</p>', '<p>粗心大意</p>', '加法', 0, '2023-06-08 13:47:40');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (94, '英语', 'lisi', '中优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/c11c84e5-7d95-48c4-89b9-7c6b7616f69a.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>62.neither</p><p>63. to plant</p>', '<p>62.either</p><p>63. plant</p>', '<p>对动词不定式不够熟悉</p>', '英语短文填空', 0, '2023-06-08 14:33:33');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (95, '英语', 'lisi', '中优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/c11c84e5-7d95-48c4-89b9-7c6b7616f69a.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>62.neither</p><p>63. to plant</p>', '<p>62.either</p><p>63. plant</p>', '<p>对动词不定式不够熟悉</p>', '英语短文填空', 0, '2023-06-09 14:33:33');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (96, '语文', 'lisi', '高优先级', 0, '<p>默写最后两句古诗<br/><img src=\"http://localhost:8080/imgFile/c57c45c2-2e99-4e10-be47-cd7233da67b7.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>山回路转不见君，雪上空留马行处。<br/></p>', '<p>瀚海阑干百丈冰，愁云惨淡万里凝。<br/></p>', '<p>对古诗的背诵不熟悉</p>', '文言文', 0, '2023-06-10 14:37:01');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (97, '数学', 'lisi', '中优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/fe04d496-4ca7-430b-8fa0-2629f77f3b4a.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>C<br/></p>', '<p>D</p>', '<p>对有理数和绝对值不太熟悉</p>', '', 0, '2023-06-10 14:28:24');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (98, '数学', 'zhangsan', '低优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/fccbc417-ad4b-4b02-aef0-463a170502d1.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>B</p>', '<p>C</p>', '<p>对三角形内角和不熟悉</p>', '三角形', 0, '2023-06-03 11:09:29');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (99, '数学', 'zhangsan', '低优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/950296ac-337d-422b-85ce-8d1da8332191.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>A</p>', '<p>B</p>', '<p>对等边三角形不熟悉</p>', '三角形', 0, '2023-06-03 11:10:21');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (100, '数学', 'zhangsan', '低优先级', 5, '<p><img src=\"http://localhost:8080/imgFile/3540a822-76ae-488b-b921-54dfe1a6d907.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>边长,边长<br/></p>', '<p>边长,高</p>', '<p>对正方形不熟悉</p>', '正方形', 0, '2023-06-04 11:12:31');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (101, '数学', 'zhangsan', '中优先级', 5, '<p><img src=\"http://localhost:8080/imgFile/a1e98a8e-a310-4914-871d-b9d03986b4ba.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>错</p>', '<p>对</p>', '<p>对正方形面积公式不熟悉</p>', '正方形', 0, '2023-06-03 11:13:34');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (102, '英语', 'zhangsan', '高优先级', 5, '<p><img src=\"http://localhost:8080/imgFile/515244cb-0f5b-4409-ab64-edaf09971ea0.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>It doesn\'t matter whether you will attend the party or not.<br/></p>', '<p>It\'s not important for you to come to the party</p>', '<p>对英语语法不熟悉</p>', '翻译', 0, '2023-06-04 11:15:22');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (103, '英语', 'zhangsan', '中优先级', 5, '<p><img src=\"http://localhost:8080/imgFile/e026e2bc-b685-43f8-aee8-0b0e8da63fbd.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>One false step will make a great difference.<br/></p>', '<p>A little change can be important</p>', '<p>对英语语法不熟悉</p>', '翻译', 0, '2023-06-02 11:16:32');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (104, '数学', 'zhangsan', '低优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/950296ac-337d-422b-85ce-8d1da8332191.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>A</p>', '<p>B</p>', '<p>对等边三角形不熟悉</p>', '三角形', 0, '2023-06-04 11:10:21');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (105, '数学', 'zhangsan', '中优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/a1e98a8e-a310-4914-871d-b9d03986b4ba.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>错</p>', '<p>对</p>', '<p>对正方形面积公式不熟悉</p>', '正方形', 0, '2023-06-02 11:13:34');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (106, '英语', 'zhangsan', '中优先级', 10, '<p><img src=\"http://localhost:8080/imgFile/e026e2bc-b685-43f8-aee8-0b0e8da63fbd.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>One false step will make a great difference.<br/></p>', '<p>A little change can be important</p>', '<p>对英语语法不熟悉</p>', '翻译', 0, '2023-06-04 11:16:31');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (107, '英语', 'zhangsan', '高优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/c95b6aad-6db2-4848-9416-0c5247614be1.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>62. an 63. specifically 64. or 65. student’s<br/></p>', '<p>62. a 63. specifical64. and 65. student<br/></p>', '<p>对元音字母开头的单词不熟悉</p>', '英语短文填空', 0, '2023-05-12 14:32:21');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (108, '语文', 'zhangsan', '高优先级', 10, '<p>翻译以下句子</p><p>先帝创业未半而中道崩殂，今天下三分，益州疲弊，此诚危急存亡之秋也。<br/></p>', '<p>先帝创业未半而中道崩殂，今天下三分，益州疲弊，此诚危急存亡之秋也。<br/></p><p>翻译:先帝开创大业未完成一半却中途去世了。现在天下分为三国，我们蜀汉人力疲惫，民生凋敝，这实在是国家危急存亡的时刻啊。</p>', '<p>先帝创业未半而中道崩殂，今天下三分，益州疲弊，此诚危急存亡之秋也。<br/></p><p>翻译:先帝开创大业未完成一半却中途去世了。现在天下分为三国，益州很疲惫,这真的很危急。</p>', '<p>对\"益州\",\"诚\"的翻译错误</p>', '文言文', 0, '2023-05-06 13:57:08');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (109, '数学', 'zhangsan', '高优先级', 5, '<p><img src=\"http://localhost:8080/imgFile/54b8f30d-9b84-4ca3-872f-16483a469704.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>B</p>', '<p>D</p>', '<p>对分数的平方不熟悉<br/></p>', '', 0, '2023-05-14 14:35:02');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (110, '英语', 'zhangsan', '中优先级', 0, '<p>The Xi’an City Wall is the most complete city wall that has survived China’s long history. It&nbsp;<u>41</u>&nbsp;(build) originally to protect the city&nbsp;<u>42</u>&nbsp;the Tang dynasty and has now been completely restored（修复）.<br/></p>', '<p>The Xi’an City Wall is the most complete city wall that has survived China’s long history. It <u>was built</u>&nbsp;(build) originally to protect the city&nbsp;<u>in</u>&nbsp;the Tang dynasty and has now been completely restored（修复）.</p>', '<p>The Xi’an City Wall is the most complete city wall that has survived China’s long history. It <u>builds</u>&nbsp;(build) originally to protect the city <u>at</u>&nbsp;the Tang dynasty and has now been completely restored（修复）.<br/></p>', '<p>对被动语态不熟悉</p>', '英语短文填空', 0, '2023-05-08 14:11:49');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (111, '数学', 'zhangsan', '低优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/fccbc417-ad4b-4b02-aef0-463a170502d1.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>B</p>', '<p>C</p>', '<p>对三角形内角和不熟悉</p>', '三角形', 0, '2023-06-04 11:09:29');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (112, '数学', 'zhangsan', '高优先级', 0, '<p>100?10=1</p>', '<p>100?10=10</p>', '<p>100?10=1<br/></p>', '<p>对除法运算不够细心</p>', '除法', 0, '2023-05-05 13:51:09');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (113, '数学', 'zhangsan', '低优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/3540a822-76ae-488b-b921-54dfe1a6d907.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>边长,边长<br/></p>', '<p>边长,高</p>', '<p>对正方形不熟悉</p>', '正方形', 0, '2023-06-04 11:12:31');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (114, '英语', 'zhangsan', '中优先级', 0, '<p>&nbsp;<u>56</u>&nbsp;is so breathtaking about the experience is the out-of-this-world scenes<br/></p>', '<p>&nbsp;<u>What</u>&nbsp;is so breathtaking about the experience is the out-of-this-world scenes<br/></p>', '<p>&nbsp;<u>The</u>&nbsp;is so breathtaking about the experience is the out-of-this-world scenes<br/></p>', '<p>没有判断出句子缺乏主语</p>', '英语短文填空', 0, '2023-05-09 14:14:55');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (115, '数学', 'zhangsan', '中优先级', 5, '<p><img src=\"http://localhost:8080/imgFile/a1e98a8e-a310-4914-871d-b9d03986b4ba.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>错</p>', '<p>对</p>', '<p>对正方形面积公式不熟悉</p>', '正方形', 0, '2023-06-04 11:13:34');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (116, '英语', 'zhangsan', '中优先级', 0, '<p><img src=\"http://localhost:8080/imgFile/c11c84e5-7d95-48c4-89b9-7c6b7616f69a.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>62.neither</p><p>63. to plant</p>', '<p>62.either</p><p>63. plant</p>', '<p>对动词不定式不够熟悉</p>', '英语短文填空', 0, '2023-05-13 14:33:33');
INSERT INTO `notes`.`t_notes` (`notes_id`, `notes_title`, `promulgator`, `priority`, `proficiency`, `subject`, `answer`, `respond`, `summary`, `notes_group`, `deleted`, `update_time`) VALUES (117, '数学', 'zhangsan', '高优先级', 5, '<p><img src=\"http://localhost:8080/imgFile/54b8f30d-9b84-4ca3-872f-16483a469704.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '<p>B</p>', '<p>D</p>', '<p>对分数的平方不熟悉<br/></p>', '', 0, '2023-05-14 14:35:02');


DROP TABLE IF EXISTS `t_photo`;
CREATE TABLE `t_photo`
(
    `photo_id`     int(11)                                                NOT NULL AUTO_INCREMENT,
    `photo_source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `photo_name`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `photo_type`   varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`photo_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;


DROP TABLE IF EXISTS `t_review`;

CREATE TABLE t_review
(
    review_id   int auto_increment comment '复习计划id' primary key,
    promulgator varchar(30) comment '发布者账号',
    title       varchar(64) comment '复习计划标题',
    content     text comment '复习计划详细内容',
    review_time varchar(64)                           null comment '复习时间',
    cycle       varchar(64)                           not null comment '复习周期',
    cron        varchar(64)                           not null comment 'cron表达式',
    status      varchar(16) default '进行中' comment '复习状态',
    num         int         default 0                 not null comment '复习次数',
    deleted     tinyint(1)  default 0                 null comment '是否删除',
    update_time datetime    default CURRENT_TIMESTAMP null comment '更新时间',
    foreign key (promulgator) references t_user (account)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;



INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (14, 'lisi', '复习语文', '复习成语,阅读,作文', '每天8:0:0', '每日计划', '0 0 19 * * ?', '进行中', 0, 0, '2023-05-29 19:50:00');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (15, 'lisi', '复习数学', '复习三角函数,极坐标,立体几何', '每天10:0:0', '每日计划', '0 0 21 * * ?', '进行中', 0, 0, '2023-05-29 19:51:41');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (16, 'lisi', '复习英语', '复习作文,阅读,短文填空', '每天11:0:0', '每日计划', '0 0 22 * * ?', '进行中', 1, 0, '2023-05-29 19:53:54');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (17, 'lisi', '复习物理', '复习安培力,洛伦兹力,牛顿第三定律', '每天14:0:0', '每日计划', '0 0 14 * * ?', '进行中', 0, 0, '2023-05-29 19:56:37');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (18, 'lisi', '复习化学', '复习化学式,化学电池,元素周期表', '每天16:0:0', '每日计划', '0 0 16 * * ?', '进行中', 0, 0, '2023-05-29 19:58:07');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (19, 'lisi', '复习生物', '复习遗传学,生物发酵技术,生物多样性', '每天18:0:0', '每日计划', '0 0 18 * * ?', '进行中', 0, 0, '2023-05-29 19:59:01');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (21, 'lisi', '复习语文', '复习古诗,文言文,阅读,作文', '星期一 14:0:0', '每周计划', '0 0 14 ? * MON', '进行中', 0, 0, '2023-05-29 20:02:55');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (22, 'lisi', '复习数学', '复习向量,导函数,数列', '星期二 14:0:0', '每周计划', '0 0 14 ? * TUE', '进行中', 0, 0, '2023-05-29 20:03:50');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (23, 'lisi', '复习英语', '复习单词,语法,收集好词好句', '星期三 15:0:0', '每周计划', '0 0 15 ? * WED', '进行中', 0, 0, '2023-05-29 20:05:03');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (24, 'lisi', '复习物理', '复习电学,力学,气压', '星期四 8:0:0', '每周计划', '0 0 8 ? * THU', '进行中', 0, 0, '2023-05-29 20:06:25');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (25, 'lisi', '复习化学', '复习电解质,化学式,元素周期表', '星期五 18:0:0', '每周计划', '0 0 18 ? * FRI', '进行中', 0, 0, '2023-05-29 20:07:37');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (26, 'lisi', '复习生物', '复习标记重捕法,遗传学,基因多样性', '星期六 20:0:0', '每周计划', '0 0 20 ? * SAT', '进行中', 0, 0, '2023-05-29 20:09:08');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (27, 'lisi', '复习语文', '复习作文,收集好词好句', '每月1号 8:0:0', '每月计划', '0 0 8 1 * ?', '进行中', 0, 0, '2023-05-29 20:10:33');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (28, 'lisi', '复习数学', '单元测试', '每月3号 14:0:0', '每月计划', '0 0 14 3 * ?', '进行中', 0, 0, '2023-05-29 20:11:33');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (29, 'lisi', '复习英语', '复习作文,短文改错,阅读,听力', '每月6号 20:0:0', '每月计划', '0 0 20 6 * ?', '进行中', 0, 0, '2023-05-29 20:12:28');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (30, 'lisi', '复习语文', '复习成语,阅读,作文', '每天8:0:0', '每日计划', '0 0 19 * * ?', '进行中', 0, 0, '2023-05-29 19:50:00');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (31, 'lisi', '复习数学', '复习三角函数,极坐标,立体几何', '每天10:0:0', '每日计划', '0 0 21 * * ?', '进行中', 0, 0, '2023-05-29 19:51:41');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (32, 'lisi', '复习英语', '复习作文,阅读,短文填空', '每天11:0:0', '每日计划', '0 0 22 * * ?', '进行中', 1, 0, '2023-05-29 19:53:54');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (33, 'lisi', '复习物理', '复习安培力,洛伦兹力,牛顿第三定律', '每天14:0:0', '每日计划', '0 0 14 * * ?', '进行中', 0, 0, '2023-05-29 19:56:37');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (34, 'lisi', '复习化学', '复习化学式,化学电池,元素周期表', '每天16:0:0', '每日计划', '0 0 16 * * ?', '进行中', 0, 0, '2023-05-29 19:58:07');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (36, 'zhangsan', '复习语文', '复习作文,收集好词好句', '每天8:0:0', '每日计划', '0 0 8 * * ?', '进行中', 0, 0, '2023-05-29 20:22:03');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (37, 'zhangsan', '复习数学', '复习三角函数,极坐标,立体几何', '每天14:0:0', '每日计划', '0 0 14 * * ?', '进行中', 0, 0, '2023-05-29 20:23:38');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (38, 'zhangsan', '复习英语', '复习作文,短文改错,阅读,听力', '每天16:0:0', '每日计划', '0 0 16 * * ?', '进行中', 0, 0, '2023-05-29 20:24:20');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (39, 'zhangsan', '复习物理', '复习安培力,洛伦兹力,牛顿第三定律', '每天19:0:0', '每日计划', '0 0 19 * * ?', '进行中', 0, 0, '2023-05-29 20:24:52');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (40, 'zhangsan', '复习化学', '复习化学式,化学电池,元素周期表', '每天21:0:0', '每日计划', '0 0 21 * * ?', '进行中', 0, 0, '2023-05-29 20:25:24');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (41, 'zhangsan', '复习生物', '复习遗传学,生物发酵技术,生物多样性', '每天22:0:0', '每日计划', '0 0 22 * * ?', '进行中', 0, 0, '2023-05-29 20:25:55');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (42, 'zhangsan', '复习语文', '复习成语,阅读,作文', '星期一 20:30:0', '每周计划', '0 30 20 ? * MON', '进行中', 1, 0, '2023-05-29 20:27:30');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (43, 'zhangsan', '复习数学', '复习三角函数,极坐标,立体几何', '星期二 20:0:0', '每周计划', '0 0 20 ? * TUE', '进行中', 0, 0, '2023-05-29 20:27:59');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (44, 'zhangsan', '复习英语', '复习作文,阅读,短文填空', '星期三 9:0:0', '每周计划', '0 0 9 ? * WED', '进行中', 0, 0, '2023-05-29 20:29:54');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (45, 'zhangsan', '复习物理', '复习安培力,洛伦兹力,牛顿第三定律', '星期四 20:30:0', '每周计划', '0 30 20 ? * THU', '进行中', 0, 0, '2023-05-29 20:31:16');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (46, 'zhangsan', '复习化学', '复习化学式,化学电池,元素周期表', '星期五 17:0:0', '每周计划', '0 0 17 ? * FRI', '进行中', 0, 0, '2023-05-29 20:31:53');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (47, 'zhangsan', '复习生物', '复习遗传学,生物发酵技术,生物多样性', '星期五 20:30:0', '每周计划', '0 30 20 ? * FRI', '进行中', 0, 0, '2023-05-29 20:32:52');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (48, 'zhangsan', '复习语文', '复习成语,阅读,作文', '每月3号 14:0:0', '每月计划', '0 0 14 3 * ?', '进行中', 0, 0, '2023-05-29 20:33:23');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (49, 'zhangsan', '复习数学', '复习三角函数,极坐标,立体几何', '每月8号 15:0:0', '每月计划', '0 0 15 8 * ?', '进行中', 0, 0, '2023-05-29 20:33:53');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (50, 'zhangsan', '复习英语', '复习作文,阅读,短文填空', '每月11号 20:0:0', '每月计划', '0 0 20 11 * ?', '进行中', 0, 0, '2023-05-29 20:34:33');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (51, 'zhangsan', '复习数学', '复习三角函数,极坐标,立体几何', '每天20:0:0', '每日计划', '0 0 20 * * ?', '进行中', 0, 0, '2023-05-29 20:38:01');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (52, 'zhangsan', '复习英语', '复习作文,短文改错,阅读,听力', '每天16:0:0', '每日计划', '0 0 16 * * ?', '进行中', 0, 0, '2023-05-29 20:24:20');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (53, 'zhangsan', '复习化学', '复习化学式,化学电池,元素周期表', '每天21:0:0', '每日计划', '0 0 21 * * ?', '进行中', 0, 0, '2023-05-29 20:25:24');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (54, 'zhangsan', '复习语文', '复习作文,收集好词好句', '每天8:0:0', '每日计划', '0 0 8 * * ?', '进行中', 0, 0, '2023-05-29 20:22:03');
INSERT INTO `notes`.`t_review` (`review_id`, `promulgator`, `title`, `content`, `review_time`, `cycle`, `cron`, `status`, `num`, `deleted`, `update_time`)
VALUES (55, 'zhangsan', '复习数学', '复习三角函数,极坐标,立体几何', '星期二 20:0:0', '每周计划', '0 0 20 ? * TUE', '进行中', 0, 0, '2023-05-29 20:27:59');


DROP TABLE IF EXISTS `t_sign`;

CREATE TABLE t_sign
(
    sign_id   int auto_increment comment '签到id' primary key,
    signer    varchar(30) comment '签到者账号',
    year      int  not null comment '年',
    month     int  not null comment '月',
    day       int  not null comment '日',
    sign_date DATE not null comment '格式化日期',
    foreign key (signer) references t_user (account),
    unique (signer, year, month, day)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

DROP VIEW IF EXISTS v_sign;
create view v_sign
as
select sign_date, COUNT(*) as cardNumber
from t_sign
group by sign_date;

INSERT INTO `notes`.`t_sign` (`signer`, `year`, `month`, `day`, `sign_date`)
VALUES ('xuqi', 2023, 1, 1, '2023-01-01'),
       ('wangwu', 2023, 1, 1, '2023-01-01'),
       ('maba', 2023, 1, 1, '2023-01-01'),
       ('lisi', 2023, 1, 1, '2023-01-01'),
       ('zhangsan', 2023, 1, 1, '2023-01-01'),
       ('zhengjiu', 2023, 1, 1, '2023-01-01'),
       ('huangshi', 2023, 1, 1, '2023-01-01'),
       ('lisi', 2023, 1, 2, '2023-01-02'),
       ('xuqi', 2023, 1, 2, '2023-01-02'),
       ('wangwu', 2023, 1, 2, '2023-01-02'),
       ('zhangsan', 2023, 1, 2, '2023-01-02'),
       ('chenliu', 2023, 1, 2, '2023-01-02'),
       ('maba', 2023, 1, 2, '2023-01-02'),
       ('zhengjiu', 2023, 1, 2, '2023-01-02'),
       ('chenliu', 2023, 1, 3, '2023-01-03'),
       ('xuqi', 2023, 1, 3, '2023-01-03'),
       ('maba', 2023, 1, 3, '2023-01-03'),
       ('huangshi', 2023, 1, 3, '2023-01-03'),
       ('lisi', 2023, 1, 3, '2023-01-03'),
       ('wangwu', 2023, 1, 3, '2023-01-03'),
       ('zhengjiu', 2023, 1, 3, '2023-01-03'),
       ('zhengjiu', 2023, 1, 4, '2023-01-04'),
       ('huangshi', 2023, 1, 4, '2023-01-04'),
       ('zhangsan', 2023, 1, 5, '2023-01-05'),
       ('xuqi', 2023, 1, 5, '2023-01-05'),
       ('huangshi', 2023, 1, 5, '2023-01-05'),
       ('chenliu', 2023, 1, 5, '2023-01-05'),
       ('maba', 2023, 1, 5, '2023-01-05'),
       ('zhengjiu', 2023, 1, 5, '2023-01-05'),
       ('wangwu', 2023, 1, 5, '2023-01-05'),
       ('lisi', 2023, 1, 5, '2023-01-05'),
       ('wangwu', 2023, 1, 6, '2023-01-06'),
       ('zhangsan', 2023, 1, 6, '2023-01-06'),
       ('lisi', 2023, 1, 6, '2023-01-06'),
       ('xuqi', 2023, 1, 6, '2023-01-06'),
       ('lisi', 2023, 1, 7, '2023-01-07'),
       ('xuqi', 2023, 1, 7, '2023-01-07'),
       ('zhengjiu', 2023, 1, 7, '2023-01-07'),
       ('chenliu', 2023, 1, 7, '2023-01-07'),
       ('zhangsan', 2023, 1, 7, '2023-01-07'),
       ('maba', 2023, 1, 7, '2023-01-07'),
       ('huangshi', 2023, 1, 7, '2023-01-07'),
       ('zhengjiu', 2023, 1, 9, '2023-01-09'),
       ('xuqi', 2023, 1, 9, '2023-01-09'),
       ('wangwu', 2023, 1, 9, '2023-01-09'),
       ('huangshi', 2023, 1, 9, '2023-01-09'),
       ('wangwu', 2023, 1, 10, '2023-01-10'),
       ('zhangsan', 2023, 1, 10, '2023-01-10'),
       ('lisi', 2023, 1, 10, '2023-01-10'),
       ('huangshi', 2023, 1, 10, '2023-01-10'),
       ('xuqi', 2023, 1, 10, '2023-01-10'),
       ('zhengjiu', 2023, 1, 10, '2023-01-10'),
       ('chenliu', 2023, 1, 10, '2023-01-10'),
       ('maba', 2023, 1, 10, '2023-01-10'),
       ('zhangsan', 2023, 1, 11, '2023-01-11'),
       ('maba', 2023, 1, 11, '2023-01-11'),
       ('maba', 2023, 1, 12, '2023-01-12'),
       ('zhangsan', 2023, 1, 12, '2023-01-12'),
       ('lisi', 2023, 1, 12, '2023-01-12'),
       ('wangwu', 2023, 1, 13, '2023-01-13'),
       ('chenliu', 2023, 1, 13, '2023-01-13'),
       ('zhengjiu', 2023, 1, 13, '2023-01-13'),
       ('xuqi', 2023, 1, 13, '2023-01-13'),
       ('huangshi', 2023, 1, 13, '2023-01-13'),
       ('lisi', 2023, 1, 13, '2023-01-13'),
       ('wangwu', 2023, 1, 14, '2023-01-14'),
       ('zhangsan', 2023, 1, 14, '2023-01-14'),
       ('lisi', 2023, 1, 14, '2023-01-14'),
       ('chenliu', 2023, 1, 14, '2023-01-14'),
       ('chenliu', 2023, 1, 15, '2023-01-15'),
       ('huangshi', 2023, 1, 15, '2023-01-15'),
       ('maba', 2023, 1, 15, '2023-01-15'),
       ('zhengjiu', 2023, 1, 15, '2023-01-15'),
       ('xuqi', 2023, 1, 15, '2023-01-15'),
       ('lisi', 2023, 1, 15, '2023-01-15'),
       ('zhangsan', 2023, 1, 15, '2023-01-15'),
       ('wangwu', 2023, 1, 15, '2023-01-15'),
       ('huangshi', 2023, 1, 16, '2023-01-16'),
       ('lisi', 2023, 1, 16, '2023-01-16'),
       ('chenliu', 2023, 1, 16, '2023-01-16'),
       ('maba', 2023, 1, 16, '2023-01-16'),
       ('xuqi', 2023, 1, 16, '2023-01-16'),
       ('zhangsan', 2023, 1, 16, '2023-01-16'),
       ('wangwu', 2023, 1, 17, '2023-01-17'),
       ('zhengjiu', 2023, 1, 17, '2023-01-17'),
       ('chenliu', 2023, 1, 17, '2023-01-17'),
       ('xuqi', 2023, 1, 17, '2023-01-17'),
       ('zhangsan', 2023, 1, 17, '2023-01-17'),
       ('maba', 2023, 1, 17, '2023-01-17'),
       ('lisi', 2023, 1, 17, '2023-01-17'),
       ('zhengjiu', 2023, 1, 18, '2023-01-18'),
       ('zhangsan', 2023, 1, 18, '2023-01-18'),
       ('chenliu', 2023, 1, 18, '2023-01-18'),
       ('zhengjiu', 2023, 1, 19, '2023-01-19'),
       ('xuqi', 2023, 1, 19, '2023-01-19'),
       ('zhangsan', 2023, 1, 19, '2023-01-19'),
       ('lisi', 2023, 1, 20, '2023-01-20'),
       ('zhangsan', 2023, 1, 20, '2023-01-20'),
       ('chenliu', 2023, 1, 20, '2023-01-20'),
       ('wangwu', 2023, 1, 20, '2023-01-20'),
       ('huangshi', 2023, 1, 20, '2023-01-20'),
       ('huangshi', 2023, 1, 22, '2023-01-22'),
       ('wangwu', 2023, 1, 24, '2023-01-24'),
       ('xuqi', 2023, 1, 24, '2023-01-24'),
       ('chenliu', 2023, 1, 24, '2023-01-24'),
       ('zhengjiu', 2023, 1, 24, '2023-01-24'),
       ('wangwu', 2023, 1, 26, '2023-01-26'),
       ('chenliu', 2023, 1, 27, '2023-01-27'),
       ('lisi', 2023, 1, 27, '2023-01-27'),
       ('zhengjiu', 2023, 1, 27, '2023-01-27'),
       ('maba', 2023, 1, 27, '2023-01-27'),
       ('wangwu', 2023, 1, 27, '2023-01-27'),
       ('xuqi', 2023, 1, 27, '2023-01-27'),
       ('zhangsan', 2023, 1, 27, '2023-01-27'),
       ('huangshi', 2023, 1, 27, '2023-01-27'),
       ('huangshi', 2023, 1, 28, '2023-01-28'),
       ('chenliu', 2023, 1, 29, '2023-01-29'),
       ('lisi', 2023, 1, 30, '2023-01-30'),
       ('zhangsan', 2023, 1, 30, '2023-01-30'),
       ('maba', 2023, 1, 31, '2023-01-31'),
       ('zhengjiu', 2023, 1, 31, '2023-01-31'),
       ('huangshi', 2023, 1, 31, '2023-01-31'),
       ('zhangsan', 2023, 1, 31, '2023-01-31'),
       ('xuqi', 2023, 2, 1, '2023-02-01'),
       ('lisi', 2023, 2, 1, '2023-02-01'),
       ('zhangsan', 2023, 2, 1, '2023-02-01'),
       ('chenliu', 2023, 2, 1, '2023-02-01'),
       ('maba', 2023, 2, 2, '2023-02-02'),
       ('xuqi', 2023, 2, 2, '2023-02-02'),
       ('zhengjiu', 2023, 2, 2, '2023-02-02'),
       ('lisi', 2023, 2, 2, '2023-02-02'),
       ('zhangsan', 2023, 2, 2, '2023-02-02'),
       ('wangwu', 2023, 2, 3, '2023-02-03'),
       ('lisi', 2023, 2, 3, '2023-02-03'),
       ('huangshi', 2023, 2, 3, '2023-02-03'),
       ('zhengjiu', 2023, 2, 3, '2023-02-03'),
       ('xuqi', 2023, 2, 3, '2023-02-03'),
       ('zhangsan', 2023, 2, 3, '2023-02-03'),
       ('maba', 2023, 2, 4, '2023-02-04'),
       ('zhangsan', 2023, 2, 5, '2023-02-05'),
       ('zhengjiu', 2023, 2, 5, '2023-02-05'),
       ('xuqi', 2023, 2, 5, '2023-02-05'),
       ('huangshi', 2023, 2, 5, '2023-02-05'),
       ('zhengjiu', 2023, 2, 6, '2023-02-06'),
       ('chenliu', 2023, 2, 6, '2023-02-06'),
       ('huangshi', 2023, 2, 6, '2023-02-06'),
       ('zhangsan', 2023, 2, 6, '2023-02-06'),
       ('lisi', 2023, 2, 6, '2023-02-06'),
       ('maba', 2023, 2, 6, '2023-02-06'),
       ('zhangsan', 2023, 2, 7, '2023-02-07'),
       ('huangshi', 2023, 2, 7, '2023-02-07'),
       ('xuqi', 2023, 2, 7, '2023-02-07'),
       ('chenliu', 2023, 2, 7, '2023-02-07'),
       ('wangwu', 2023, 2, 7, '2023-02-07'),
       ('zhengjiu', 2023, 2, 7, '2023-02-07'),
       ('maba', 2023, 2, 7, '2023-02-07'),
       ('lisi', 2023, 2, 7, '2023-02-07'),
       ('maba', 2023, 2, 8, '2023-02-08'),
       ('zhangsan', 2023, 2, 8, '2023-02-08'),
       ('zhengjiu', 2023, 2, 8, '2023-02-08'),
       ('huangshi', 2023, 2, 8, '2023-02-08'),
       ('maba', 2023, 2, 9, '2023-02-09'),
       ('lisi', 2023, 2, 9, '2023-02-09'),
       ('zhangsan', 2023, 2, 10, '2023-02-10'),
       ('lisi', 2023, 2, 10, '2023-02-10'),
       ('zhengjiu', 2023, 2, 10, '2023-02-10'),
       ('wangwu', 2023, 2, 10, '2023-02-10'),
       ('huangshi', 2023, 2, 10, '2023-02-10'),
       ('maba', 2023, 2, 10, '2023-02-10'),
       ('zhengjiu', 2023, 2, 11, '2023-02-11'),
       ('wangwu', 2023, 2, 11, '2023-02-11'),
       ('huangshi', 2023, 2, 11, '2023-02-11'),
       ('maba', 2023, 2, 11, '2023-02-11'),
       ('lisi', 2023, 2, 11, '2023-02-11'),
       ('chenliu', 2023, 2, 11, '2023-02-11'),
       ('zhangsan', 2023, 2, 11, '2023-02-11'),
       ('zhengjiu', 2023, 2, 12, '2023-02-12'),
       ('chenliu', 2023, 2, 12, '2023-02-12'),
       ('maba', 2023, 2, 12, '2023-02-12'),
       ('zhengjiu', 2023, 2, 13, '2023-02-13'),
       ('chenliu', 2023, 2, 13, '2023-02-13'),
       ('xuqi', 2023, 2, 13, '2023-02-13'),
       ('huangshi', 2023, 2, 14, '2023-02-14'),
       ('lisi', 2023, 2, 14, '2023-02-14'),
       ('lisi', 2023, 2, 15, '2023-02-15'),
       ('chenliu', 2023, 2, 15, '2023-02-15'),
       ('huangshi', 2023, 2, 15, '2023-02-15'),
       ('maba', 2023, 2, 15, '2023-02-15'),
       ('lisi', 2023, 2, 16, '2023-02-16'),
       ('zhengjiu', 2023, 2, 16, '2023-02-16'),
       ('xuqi', 2023, 2, 16, '2023-02-16'),
       ('chenliu', 2023, 2, 16, '2023-02-16'),
       ('huangshi', 2023, 2, 16, '2023-02-16'),
       ('maba', 2023, 2, 16, '2023-02-16'),
       ('chenliu', 2023, 2, 17, '2023-02-17'),
       ('maba', 2023, 2, 17, '2023-02-17'),
       ('wangwu', 2023, 2, 17, '2023-02-17'),
       ('huangshi', 2023, 2, 18, '2023-02-18'),
       ('xuqi', 2023, 2, 18, '2023-02-18'),
       ('lisi', 2023, 2, 18, '2023-02-18'),
       ('wangwu', 2023, 2, 18, '2023-02-18'),
       ('maba', 2023, 2, 18, '2023-02-18'),
       ('chenliu', 2023, 2, 18, '2023-02-18'),
       ('zhangsan', 2023, 2, 18, '2023-02-18'),
       ('huangshi', 2023, 2, 19, '2023-02-19'),
       ('xuqi', 2023, 2, 19, '2023-02-19'),
       ('zhengjiu', 2023, 2, 19, '2023-02-19'),
       ('wangwu', 2023, 2, 19, '2023-02-19'),
       ('huangshi', 2023, 2, 20, '2023-02-20'),
       ('wangwu', 2023, 2, 20, '2023-02-20'),
       ('xuqi', 2023, 2, 20, '2023-02-20'),
       ('lisi', 2023, 2, 20, '2023-02-20'),
       ('chenliu', 2023, 2, 20, '2023-02-20'),
       ('zhangsan', 2023, 2, 20, '2023-02-20'),
       ('zhengjiu', 2023, 2, 20, '2023-02-20'),
       ('lisi', 2023, 2, 21, '2023-02-21'),
       ('zhengjiu', 2023, 2, 22, '2023-02-22'),
       ('huangshi', 2023, 2, 22, '2023-02-22'),
       ('zhangsan', 2023, 2, 22, '2023-02-22'),
       ('chenliu', 2023, 2, 22, '2023-02-22'),
       ('maba', 2023, 2, 22, '2023-02-22'),
       ('zhangsan', 2023, 2, 24, '2023-02-24'),
       ('huangshi', 2023, 2, 24, '2023-02-24'),
       ('chenliu', 2023, 2, 24, '2023-02-24'),
       ('maba', 2023, 2, 25, '2023-02-25'),
       ('huangshi', 2023, 2, 25, '2023-02-25'),
       ('zhengjiu', 2023, 2, 25, '2023-02-25'),
       ('lisi', 2023, 2, 25, '2023-02-25'),
       ('lisi', 2023, 2, 26, '2023-02-26'),
       ('chenliu', 2023, 2, 26, '2023-02-26'),
       ('xuqi', 2023, 2, 26, '2023-02-26'),
       ('zhangsan', 2023, 2, 27, '2023-02-27'),
       ('huangshi', 2023, 2, 27, '2023-02-27'),
       ('xuqi', 2023, 2, 27, '2023-02-27'),
       ('zhengjiu', 2023, 2, 27, '2023-02-27'),
       ('chenliu', 2023, 2, 27, '2023-02-27'),
       ('maba', 2023, 2, 27, '2023-02-27'),
       ('zhengjiu', 2023, 3, 1, '2023-03-01'),
       ('maba', 2023, 3, 1, '2023-03-01'),
       ('wangwu', 2023, 3, 1, '2023-03-01'),
       ('lisi', 2023, 3, 1, '2023-03-01'),
       ('zhangsan', 2023, 3, 1, '2023-03-01'),
       ('zhangsan', 2023, 3, 2, '2023-03-02'),
       ('maba', 2023, 3, 3, '2023-03-03'),
       ('zhengjiu', 2023, 3, 4, '2023-03-04'),
       ('xuqi', 2023, 3, 4, '2023-03-04'),
       ('wangwu', 2023, 3, 4, '2023-03-04'),
       ('zhangsan', 2023, 3, 4, '2023-03-04'),
       ('lisi', 2023, 3, 4, '2023-03-04'),
       ('chenliu', 2023, 3, 4, '2023-03-04'),
       ('maba', 2023, 3, 4, '2023-03-04'),
       ('lisi', 2023, 3, 6, '2023-03-06'),
       ('xuqi', 2023, 3, 6, '2023-03-06'),
       ('zhangsan', 2023, 3, 6, '2023-03-06'),
       ('maba', 2023, 3, 6, '2023-03-06'),
       ('huangshi', 2023, 3, 6, '2023-03-06'),
       ('lisi', 2023, 3, 7, '2023-03-07'),
       ('wangwu', 2023, 3, 7, '2023-03-07'),
       ('xuqi', 2023, 3, 7, '2023-03-07'),
       ('maba', 2023, 3, 7, '2023-03-07'),
       ('chenliu', 2023, 3, 7, '2023-03-07'),
       ('huangshi', 2023, 3, 7, '2023-03-07'),
       ('zhengjiu', 2023, 3, 8, '2023-03-08'),
       ('huangshi', 2023, 3, 8, '2023-03-08'),
       ('chenliu', 2023, 3, 8, '2023-03-08'),
       ('zhangsan', 2023, 3, 8, '2023-03-08'),
       ('lisi', 2023, 3, 8, '2023-03-08'),
       ('maba', 2023, 3, 8, '2023-03-08'),
       ('wangwu', 2023, 3, 8, '2023-03-08'),
       ('huangshi', 2023, 3, 9, '2023-03-09'),
       ('chenliu', 2023, 3, 9, '2023-03-09'),
       ('huangshi', 2023, 3, 10, '2023-03-10'),
       ('zhangsan', 2023, 3, 10, '2023-03-10'),
       ('zhengjiu', 2023, 3, 10, '2023-03-10'),
       ('wangwu', 2023, 3, 10, '2023-03-10'),
       ('chenliu', 2023, 3, 10, '2023-03-10'),
       ('zhangsan', 2023, 3, 12, '2023-03-12'),
       ('huangshi', 2023, 3, 13, '2023-03-13'),
       ('zhengjiu', 2023, 3, 13, '2023-03-13'),
       ('chenliu', 2023, 3, 13, '2023-03-13'),
       ('maba', 2023, 3, 13, '2023-03-13'),
       ('xuqi', 2023, 3, 13, '2023-03-13'),
       ('zhangsan', 2023, 3, 13, '2023-03-13'),
       ('lisi', 2023, 3, 13, '2023-03-13'),
       ('maba', 2023, 3, 14, '2023-03-14'),
       ('chenliu', 2023, 3, 14, '2023-03-14'),
       ('zhangsan', 2023, 3, 14, '2023-03-14'),
       ('zhengjiu', 2023, 3, 14, '2023-03-14'),
       ('xuqi', 2023, 3, 14, '2023-03-14'),
       ('maba', 2023, 3, 16, '2023-03-16'),
       ('zhengjiu', 2023, 3, 16, '2023-03-16'),
       ('chenliu', 2023, 3, 16, '2023-03-16'),
       ('huangshi', 2023, 3, 16, '2023-03-16'),
       ('xuqi', 2023, 3, 16, '2023-03-16'),
       ('zhengjiu', 2023, 3, 17, '2023-03-17'),
       ('zhangsan', 2023, 3, 17, '2023-03-17'),
       ('maba', 2023, 3, 17, '2023-03-17'),
       ('xuqi', 2023, 3, 17, '2023-03-17'),
       ('wangwu', 2023, 3, 17, '2023-03-17'),
       ('lisi', 2023, 3, 17, '2023-03-17'),
       ('huangshi', 2023, 3, 17, '2023-03-17'),
       ('chenliu', 2023, 3, 17, '2023-03-17'),
       ('huangshi', 2023, 3, 18, '2023-03-18'),
       ('maba', 2023, 3, 18, '2023-03-18'),
       ('wangwu', 2023, 3, 18, '2023-03-18'),
       ('zhangsan', 2023, 3, 18, '2023-03-18'),
       ('zhengjiu', 2023, 3, 18, '2023-03-18'),
       ('lisi', 2023, 3, 18, '2023-03-18'),
       ('xuqi', 2023, 3, 18, '2023-03-18'),
       ('chenliu', 2023, 3, 18, '2023-03-18'),
       ('wangwu', 2023, 3, 19, '2023-03-19'),
       ('huangshi', 2023, 3, 19, '2023-03-19'),
       ('zhangsan', 2023, 3, 19, '2023-03-19'),
       ('chenliu', 2023, 3, 19, '2023-03-19'),
       ('zhengjiu', 2023, 3, 19, '2023-03-19'),
       ('xuqi', 2023, 3, 19, '2023-03-19'),
       ('lisi', 2023, 3, 20, '2023-03-20'),
       ('xuqi', 2023, 3, 20, '2023-03-20'),
       ('zhengjiu', 2023, 3, 20, '2023-03-20'),
       ('chenliu', 2023, 3, 20, '2023-03-20'),
       ('zhangsan', 2023, 3, 20, '2023-03-20'),
       ('huangshi', 2023, 3, 20, '2023-03-20'),
       ('lisi', 2023, 3, 21, '2023-03-21'),
       ('wangwu', 2023, 3, 21, '2023-03-21'),
       ('huangshi', 2023, 3, 22, '2023-03-22'),
       ('wangwu', 2023, 3, 22, '2023-03-22'),
       ('lisi', 2023, 3, 23, '2023-03-23'),
       ('huangshi', 2023, 3, 23, '2023-03-23'),
       ('zhengjiu', 2023, 3, 25, '2023-03-25'),
       ('lisi', 2023, 3, 25, '2023-03-25'),
       ('huangshi', 2023, 3, 25, '2023-03-25'),
       ('chenliu', 2023, 3, 26, '2023-03-26'),
       ('lisi', 2023, 3, 27, '2023-03-27'),
       ('chenliu', 2023, 3, 27, '2023-03-27'),
       ('huangshi', 2023, 3, 27, '2023-03-27'),
       ('zhengjiu', 2023, 3, 27, '2023-03-27'),
       ('zhangsan', 2023, 3, 27, '2023-03-27'),
       ('maba', 2023, 3, 27, '2023-03-27'),
       ('wangwu', 2023, 3, 28, '2023-03-28'),
       ('maba', 2023, 3, 28, '2023-03-28'),
       ('zhengjiu', 2023, 3, 28, '2023-03-28'),
       ('huangshi', 2023, 3, 28, '2023-03-28'),
       ('xuqi', 2023, 3, 29, '2023-03-29'),
       ('zhengjiu', 2023, 3, 29, '2023-03-29'),
       ('huangshi', 2023, 3, 30, '2023-03-30'),
       ('xuqi', 2023, 3, 30, '2023-03-30'),
       ('chenliu', 2023, 3, 30, '2023-03-30'),
       ('zhangsan', 2023, 3, 30, '2023-03-30'),
       ('zhengjiu', 2023, 3, 30, '2023-03-30'),
       ('wangwu', 2023, 3, 31, '2023-03-31'),
       ('maba', 2023, 3, 31, '2023-03-31'),
       ('huangshi', 2023, 3, 31, '2023-03-31'),
       ('zhengjiu', 2023, 3, 31, '2023-03-31'),
       ('zhangsan', 2023, 3, 31, '2023-03-31'),
       ('chenliu', 2023, 3, 31, '2023-03-31'),
       ('zhangsan', 2023, 4, 1, '2023-04-01'),
       ('huangshi', 2023, 4, 1, '2023-04-01'),
       ('chenliu', 2023, 4, 1, '2023-04-01'),
       ('zhengjiu', 2023, 4, 1, '2023-04-01'),
       ('lisi', 2023, 4, 2, '2023-04-02'),
       ('chenliu', 2023, 4, 2, '2023-04-02'),
       ('zhengjiu', 2023, 4, 2, '2023-04-02'),
       ('zhengjiu', 2023, 4, 3, '2023-04-03'),
       ('xuqi', 2023, 4, 3, '2023-04-03'),
       ('huangshi', 2023, 4, 3, '2023-04-03'),
       ('wangwu', 2023, 4, 3, '2023-04-03'),
       ('lisi', 2023, 4, 4, '2023-04-04'),
       ('xuqi', 2023, 4, 5, '2023-04-05'),
       ('huangshi', 2023, 4, 5, '2023-04-05'),
       ('huangshi', 2023, 4, 6, '2023-04-06'),
       ('lisi', 2023, 4, 6, '2023-04-06'),
       ('huangshi', 2023, 4, 7, '2023-04-07'),
       ('lisi', 2023, 4, 7, '2023-04-07'),
       ('maba', 2023, 4, 8, '2023-04-08'),
       ('wangwu', 2023, 4, 8, '2023-04-08'),
       ('lisi', 2023, 4, 8, '2023-04-08'),
       ('huangshi', 2023, 4, 8, '2023-04-08'),
       ('xuqi', 2023, 4, 8, '2023-04-08'),
       ('zhengjiu', 2023, 4, 8, '2023-04-08'),
       ('zhangsan', 2023, 4, 8, '2023-04-08'),
       ('zhangsan', 2023, 4, 9, '2023-04-09'),
       ('huangshi', 2023, 4, 9, '2023-04-09'),
       ('maba', 2023, 4, 9, '2023-04-09'),
       ('wangwu', 2023, 4, 9, '2023-04-09'),
       ('xuqi', 2023, 4, 10, '2023-04-10'),
       ('huangshi', 2023, 4, 10, '2023-04-10'),
       ('lisi', 2023, 4, 10, '2023-04-10'),
       ('zhengjiu', 2023, 4, 11, '2023-04-11'),
       ('huangshi', 2023, 4, 12, '2023-04-12'),
       ('maba', 2023, 4, 12, '2023-04-12'),
       ('xuqi', 2023, 4, 13, '2023-04-13'),
       ('lisi', 2023, 4, 14, '2023-04-14'),
       ('maba', 2023, 4, 14, '2023-04-14'),
       ('wangwu', 2023, 4, 14, '2023-04-14'),
       ('chenliu', 2023, 4, 14, '2023-04-14'),
       ('zhengjiu', 2023, 4, 15, '2023-04-15'),
       ('chenliu', 2023, 4, 15, '2023-04-15'),
       ('wangwu', 2023, 4, 15, '2023-04-15'),
       ('xuqi', 2023, 4, 15, '2023-04-15'),
       ('huangshi', 2023, 4, 15, '2023-04-15'),
       ('maba', 2023, 4, 15, '2023-04-15'),
       ('lisi', 2023, 4, 15, '2023-04-15'),
       ('wangwu', 2023, 4, 16, '2023-04-16'),
       ('wangwu', 2023, 4, 17, '2023-04-17'),
       ('lisi', 2023, 4, 17, '2023-04-17'),
       ('xuqi', 2023, 4, 17, '2023-04-17'),
       ('zhangsan', 2023, 4, 18, '2023-04-18'),
       ('huangshi', 2023, 4, 18, '2023-04-18'),
       ('zhengjiu', 2023, 4, 18, '2023-04-18'),
       ('maba', 2023, 4, 18, '2023-04-18'),
       ('chenliu', 2023, 4, 18, '2023-04-18'),
       ('maba', 2023, 4, 19, '2023-04-19'),
       ('zhengjiu', 2023, 4, 19, '2023-04-19'),
       ('xuqi', 2023, 4, 19, '2023-04-19'),
       ('huangshi', 2023, 4, 19, '2023-04-19'),
       ('chenliu', 2023, 4, 19, '2023-04-19'),
       ('zhangsan', 2023, 4, 19, '2023-04-19'),
       ('lisi', 2023, 4, 19, '2023-04-19'),
       ('chenliu', 2023, 4, 20, '2023-04-20'),
       ('zhengjiu', 2023, 4, 21, '2023-04-21'),
       ('chenliu', 2023, 4, 21, '2023-04-21'),
       ('wangwu', 2023, 4, 21, '2023-04-21'),
       ('xuqi', 2023, 4, 21, '2023-04-21'),
       ('zhangsan', 2023, 4, 21, '2023-04-21'),
       ('huangshi', 2023, 4, 21, '2023-04-21'),
       ('lisi', 2023, 4, 21, '2023-04-21'),
       ('zhengjiu', 2023, 4, 23, '2023-04-23'),
       ('huangshi', 2023, 4, 23, '2023-04-23'),
       ('lisi', 2023, 4, 23, '2023-04-23'),
       ('wangwu', 2023, 4, 23, '2023-04-23'),
       ('xuqi', 2023, 4, 23, '2023-04-23'),
       ('chenliu', 2023, 4, 23, '2023-04-23'),
       ('zhengjiu', 2023, 4, 24, '2023-04-24'),
       ('wangwu', 2023, 4, 24, '2023-04-24'),
       ('lisi', 2023, 4, 25, '2023-04-25'),
       ('zhengjiu', 2023, 4, 25, '2023-04-25'),
       ('chenliu', 2023, 4, 25, '2023-04-25'),
       ('maba', 2023, 4, 25, '2023-04-25'),
       ('wangwu', 2023, 4, 25, '2023-04-25'),
       ('xuqi', 2023, 4, 25, '2023-04-25'),
       ('lisi', 2023, 4, 26, '2023-04-26'),
       ('zhengjiu', 2023, 4, 26, '2023-04-26'),
       ('wangwu', 2023, 4, 26, '2023-04-26'),
       ('zhangsan', 2023, 4, 26, '2023-04-26'),
       ('chenliu', 2023, 4, 26, '2023-04-26'),
       ('zhangsan', 2023, 4, 27, '2023-04-27'),
       ('xuqi', 2023, 4, 27, '2023-04-27'),
       ('wangwu', 2023, 4, 27, '2023-04-27'),
       ('zhengjiu', 2023, 4, 27, '2023-04-27'),
       ('maba', 2023, 4, 27, '2023-04-27'),
       ('zhangsan', 2023, 4, 28, '2023-04-28'),
       ('maba', 2023, 4, 28, '2023-04-28'),
       ('chenliu', 2023, 4, 28, '2023-04-28'),
       ('huangshi', 2023, 4, 29, '2023-04-29'),
       ('maba', 2023, 4, 29, '2023-04-29'),
       ('wangwu', 2023, 4, 29, '2023-04-29'),
       ('zhangsan', 2023, 4, 29, '2023-04-29'),
       ('lisi', 2023, 4, 29, '2023-04-29'),
       ('chenliu', 2023, 4, 30, '2023-04-30'),
       ('wangwu', 2023, 4, 30, '2023-04-30'),
       ('huangshi', 2023, 4, 30, '2023-04-30'),
       ('chenliu', 2023, 5, 1, '2023-05-01'),
       ('wangwu', 2023, 5, 1, '2023-05-01'),
       ('maba', 2023, 5, 1, '2023-05-01'),
       ('huangshi', 2023, 5, 1, '2023-05-01'),
       ('zhengjiu', 2023, 5, 1, '2023-05-01'),
       ('lisi', 2023, 5, 1, '2023-05-01'),
       ('chenliu', 2023, 5, 2, '2023-05-02'),
       ('wangwu', 2023, 5, 2, '2023-05-02'),
       ('maba', 2023, 5, 2, '2023-05-02'),
       ('xuqi', 2023, 5, 2, '2023-05-02'),
       ('zhengjiu', 2023, 5, 2, '2023-05-02'),
       ('chenliu', 2023, 5, 3, '2023-05-03'),
       ('wangwu', 2023, 5, 3, '2023-05-03'),
       ('maba', 2023, 5, 3, '2023-05-03'),
       ('xuqi', 2023, 5, 3, '2023-05-03'),
       ('zhengjiu', 2023, 5, 3, '2023-05-03'),
       ('huangshi', 2023, 5, 3, '2023-05-03'),
       ('zhangsan', 2023, 5, 3, '2023-05-03'),
       ('lisi', 2023, 5, 3, '2023-05-03'),
       ('chenliu', 2023, 5, 4, '2023-05-04'),
       ('wangwu', 2023, 5, 4, '2023-05-04'),
       ('maba', 2023, 5, 4, '2023-05-04'),
       ('xuqi', 2023, 5, 4, '2023-05-04'),
       ('zhangsan', 2023, 5, 4, '2023-05-04'),
       ('zhengjiu', 2023, 5, 4, '2023-05-04'),
       ('lisi', 2023, 5, 4, '2023-05-04'),
       ('huangshi', 2023, 5, 4, '2023-05-04'),
       ('chenliu', 2023, 5, 5, '2023-05-05'),
       ('wangwu', 2023, 5, 5, '2023-05-05'),
       ('xuqi', 2023, 5, 5, '2023-05-05'),
       ('chenliu', 2023, 5, 6, '2023-05-06'),
       ('wangwu', 2023, 5, 6, '2023-05-06'),
       ('lisi', 2023, 5, 6, '2023-05-06'),
       ('maba', 2023, 5, 6, '2023-05-06'),
       ('huangshi', 2023, 5, 6, '2023-05-06'),
       ('xuqi', 2023, 5, 6, '2023-05-06'),
       ('chenliu', 2023, 5, 7, '2023-05-07'),
       ('wangwu', 2023, 5, 7, '2023-05-07'),
       ('maba', 2023, 5, 7, '2023-05-07'),
       ('xuqi', 2023, 5, 7, '2023-05-07'),
       ('lisi', 2023, 5, 7, '2023-05-07'),
       ('chenliu', 2023, 5, 8, '2023-05-08'),
       ('wangwu', 2023, 5, 8, '2023-05-08'),
       ('zhengjiu', 2023, 5, 8, '2023-05-08'),
       ('huangshi', 2023, 5, 8, '2023-05-08'),
       ('chenliu', 2023, 5, 10, '2023-05-10'),
       ('wangwu', 2023, 5, 10, '2023-05-10'),
       ('maba', 2023, 5, 10, '2023-05-10'),
       ('zhengjiu', 2023, 5, 10, '2023-05-10'),
       ('lisi', 2023, 5, 10, '2023-05-10'),
       ('xuqi', 2023, 5, 10, '2023-05-10'),
       ('huangshi', 2023, 5, 10, '2023-05-10'),
       ('chenliu', 2023, 5, 11, '2023-05-11'),
       ('wangwu', 2023, 5, 11, '2023-05-11'),
       ('zhangsan', 2023, 5, 11, '2023-05-11'),
       ('xuqi', 2023, 5, 11, '2023-05-11'),
       ('maba', 2023, 5, 11, '2023-05-11'),
       ('lisi', 2023, 5, 11, '2023-05-11'),
       ('huangshi', 2023, 5, 11, '2023-05-11'),
       ('zhengjiu', 2023, 5, 11, '2023-05-11'),
       ('chenliu', 2023, 5, 12, '2023-05-12'),
       ('wangwu', 2023, 5, 12, '2023-05-12'),
       ('huangshi', 2023, 5, 12, '2023-05-12'),
       ('lisi', 2023, 5, 12, '2023-05-12'),
       ('maba', 2023, 5, 12, '2023-05-12'),
       ('zhengjiu', 2023, 5, 12, '2023-05-12'),
       ('xuqi', 2023, 5, 12, '2023-05-12'),
       ('zhangsan', 2023, 5, 12, '2023-05-12'),
       ('chenliu', 2023, 5, 13, '2023-05-13'),
       ('wangwu', 2023, 5, 13, '2023-05-13'),
       ('zhengjiu', 2023, 5, 13, '2023-05-13'),
       ('maba', 2023, 5, 13, '2023-05-13'),
       ('lisi', 2023, 5, 13, '2023-05-13'),
       ('huangshi', 2023, 5, 13, '2023-05-13'),
       ('chenliu', 2023, 5, 14, '2023-05-14'),
       ('wangwu', 2023, 5, 14, '2023-05-14'),
       ('lisi', 2023, 5, 14, '2023-05-14'),
       ('maba', 2023, 5, 14, '2023-05-14'),
       ('huangshi', 2023, 5, 14, '2023-05-14'),
       ('zhangsan', 2023, 5, 14, '2023-05-14'),
       ('chenliu', 2023, 5, 15, '2023-05-15'),
       ('wangwu', 2023, 5, 15, '2023-05-15'),
       ('zhengjiu', 2023, 5, 15, '2023-05-15'),
       ('xuqi', 2023, 5, 15, '2023-05-15'),
       ('zhangsan', 2023, 5, 15, '2023-05-15'),
       ('chenliu', 2023, 5, 16, '2023-05-16'),
       ('wangwu', 2023, 5, 16, '2023-05-16'),
       ('huangshi', 2023, 5, 16, '2023-05-16'),
       ('xuqi', 2023, 5, 16, '2023-05-16'),
       ('chenliu', 2023, 5, 18, '2023-05-18'),
       ('wangwu', 2023, 5, 18, '2023-05-18'),
       ('zhangsan', 2023, 5, 18, '2023-05-18'),
       ('maba', 2023, 5, 18, '2023-05-18'),
       ('chenliu', 2023, 5, 19, '2023-05-19'),
       ('wangwu', 2023, 5, 19, '2023-05-19'),
       ('maba', 2023, 5, 19, '2023-05-19'),
       ('chenliu', 2023, 5, 20, '2023-05-20'),
       ('wangwu', 2023, 5, 20, '2023-05-20'),
       ('xuqi', 2023, 5, 20, '2023-05-20'),
       ('zhengjiu', 2023, 5, 20, '2023-05-20'),
       ('maba', 2023, 5, 20, '2023-05-20'),
       ('zhangsan', 2023, 5, 20, '2023-05-20'),
       ('lisi', 2023, 5, 20, '2023-05-20'),
       ('huangshi', 2023, 5, 20, '2023-05-20'),
       ('chenliu', 2023, 5, 22, '2023-05-22'),
       ('chenliu', 2023, 5, 23, '2023-05-23'),
       ('wangwu', 2023, 5, 23, '2023-05-23'),
       ('chenliu', 2023, 5, 24, '2023-05-24'),
       ('wangwu', 2023, 5, 24, '2023-05-24'),
       ('zhengjiu', 2023, 5, 24, '2023-05-24'),
       ('lisi', 2023, 5, 24, '2023-05-24'),
       ('xuqi', 2023, 5, 24, '2023-05-24'),
       ('chenliu', 2023, 5, 25, '2023-05-25'),
       ('chenliu', 2023, 5, 27, '2023-05-27'),
       ('chenliu', 2023, 5, 28, '2023-05-28'),
       ('wangwu', 2023, 5, 28, '2023-05-28'),
       ('huangshi', 2023, 5, 28, '2023-05-28'),
       ('xuqi', 2023, 5, 28, '2023-05-28'),
       ('chenliu', 2023, 5, 29, '2023-05-29'),
       ('wangwu', 2023, 5, 29, '2023-05-29'),
       ('zhangsan', 2023, 5, 29, '2023-05-29'),
       ('lisi', 2023, 5, 29, '2023-05-29'),
       ('xuqi', 2023, 5, 29, '2023-05-29'),
       ('maba', 2023, 5, 29, '2023-05-29'),
       ('chenliu', 2023, 5, 30, '2023-05-30'),
       ('wangwu', 2023, 5, 30, '2023-05-30'),
       ('zhangsan', 2023, 5, 30, '2023-05-30'),
       ('chenliu', 2023, 5, 31, '2023-05-31'),
       ('wangwu', 2023, 5, 31, '2023-05-31'),
       ('xuqi', 2023, 5, 31, '2023-05-31'),
       ('maba', 2023, 5, 31, '2023-05-31'),
       ('lisi', 2023, 5, 31, '2023-05-31'),
       ('zhengjiu', 2023, 5, 31, '2023-05-31'),
       ('huangshi', 2023, 5, 31, '2023-05-31'),
       ('zhangsan', 2023, 5, 31, '2023-05-31'),
       ('chenliu', 2023, 6, 1, '2023-06-01'),
       ('wangwu', 2023, 6, 1, '2023-06-01'),
       ('maba', 2023, 6, 1, '2023-06-01'),
       ('xuqi', 2023, 6, 1, '2023-06-01'),
       ('lisi', 2023, 6, 1, '2023-06-01'),
       ('chenliu', 2023, 6, 2, '2023-06-02'),
       ('wangwu', 2023, 6, 2, '2023-06-02'),
       ('maba', 2023, 6, 2, '2023-06-02'),
       ('xuqi', 2023, 6, 2, '2023-06-02'),
       ('lisi', 2023, 6, 2, '2023-06-02');