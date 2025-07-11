/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80300
 Source Host           : localhost:3306
 Source Schema         : myblog

 Target Server Type    : MySQL
 Target Server Version : 80300
 File Encoding         : 65001

 Date: 11/07/2025 19:00:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES (1, 'sinead');

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add 种类信息', 6, 'add_category');
INSERT INTO `auth_permission` VALUES (22, 'Can change 种类信息', 6, 'change_category');
INSERT INTO `auth_permission` VALUES (23, 'Can delete 种类信息', 6, 'delete_category');
INSERT INTO `auth_permission` VALUES (24, 'Can view 种类信息', 6, 'view_category');
INSERT INTO `auth_permission` VALUES (25, 'Can add 评论信息', 7, 'add_comment');
INSERT INTO `auth_permission` VALUES (26, 'Can change 评论信息', 7, 'change_comment');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 评论信息', 7, 'delete_comment');
INSERT INTO `auth_permission` VALUES (28, 'Can view 评论信息', 7, 'view_comment');
INSERT INTO `auth_permission` VALUES (29, 'Can add 文章信息', 8, 'add_post');
INSERT INTO `auth_permission` VALUES (30, 'Can change 文章信息', 8, 'change_post');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 文章信息', 8, 'delete_post');
INSERT INTO `auth_permission` VALUES (32, 'Can view 文章信息', 8, 'view_post');
INSERT INTO `auth_permission` VALUES (33, 'Can add 标签信息', 9, 'add_tag');
INSERT INTO `auth_permission` VALUES (34, 'Can change 标签信息', 9, 'change_tag');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 标签信息', 9, 'delete_tag');
INSERT INTO `auth_permission` VALUES (36, 'Can view 标签信息', 9, 'view_tag');
INSERT INTO `auth_permission` VALUES (37, 'Can add 用户信息', 10, 'add_userprofile');
INSERT INTO `auth_permission` VALUES (38, 'Can change 用户信息', 10, 'change_userprofile');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 用户信息', 10, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES (40, 'Can view 用户信息', 10, 'view_userprofile');
INSERT INTO `auth_permission` VALUES (41, 'Can add 课程评论', 11, 'add_coursecomments');
INSERT INTO `auth_permission` VALUES (42, 'Can change 课程评论', 11, 'change_coursecomments');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 课程评论', 11, 'delete_coursecomments');
INSERT INTO `auth_permission` VALUES (44, 'Can view 课程评论', 11, 'view_coursecomments');
INSERT INTO `auth_permission` VALUES (45, 'Can add 用户点赞', 12, 'add_userfavorite');
INSERT INTO `auth_permission` VALUES (46, 'Can change 用户点赞', 12, 'change_userfavorite');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 用户点赞', 12, 'delete_userfavorite');
INSERT INTO `auth_permission` VALUES (48, 'Can view 用户点赞', 12, 'view_userfavorite');
INSERT INTO `auth_permission` VALUES (49, 'Can add 文章信息', 8, 'add_blog');
INSERT INTO `auth_permission` VALUES (50, 'Can change 文章信息', 8, 'change_blog');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 文章信息', 8, 'delete_blog');
INSERT INTO `auth_permission` VALUES (52, 'Can view 文章信息', 8, 'view_blog');
INSERT INTO `auth_permission` VALUES (53, 'Can add 省市县地址信息', 13, 'add_area');
INSERT INTO `auth_permission` VALUES (54, 'Can change 省市县地址信息', 13, 'change_area');
INSERT INTO `auth_permission` VALUES (55, 'Can delete 省市县地址信息', 13, 'delete_area');
INSERT INTO `auth_permission` VALUES (56, 'Can view 省市县地址信息', 13, 'view_area');
INSERT INTO `auth_permission` VALUES (57, 'Can add 文章地区点击统计', 14, 'add_articlearea');
INSERT INTO `auth_permission` VALUES (58, 'Can change 文章地区点击统计', 14, 'change_articlearea');
INSERT INTO `auth_permission` VALUES (59, 'Can delete 文章地区点击统计', 14, 'delete_articlearea');
INSERT INTO `auth_permission` VALUES (60, 'Can view 文章地区点击统计', 14, 'view_articlearea');
INSERT INTO `auth_permission` VALUES (61, 'Can add 文章', 16, 'add_article');
INSERT INTO `auth_permission` VALUES (62, 'Can change 文章', 16, 'change_article');
INSERT INTO `auth_permission` VALUES (63, 'Can delete 文章', 16, 'delete_article');
INSERT INTO `auth_permission` VALUES (64, 'Can view 文章', 16, 'view_article');
INSERT INTO `auth_permission` VALUES (65, 'Can add 种类信息', 17, 'add_category');
INSERT INTO `auth_permission` VALUES (66, 'Can change 种类信息', 17, 'change_category');
INSERT INTO `auth_permission` VALUES (67, 'Can delete 种类信息', 17, 'delete_category');
INSERT INTO `auth_permission` VALUES (68, 'Can view 种类信息', 17, 'view_category');
INSERT INTO `auth_permission` VALUES (69, 'Can add 合集列表', 19, 'add_collection');
INSERT INTO `auth_permission` VALUES (70, 'Can change 合集列表', 19, 'change_collection');
INSERT INTO `auth_permission` VALUES (71, 'Can delete 合集列表', 19, 'delete_collection');
INSERT INTO `auth_permission` VALUES (72, 'Can view 合集列表', 19, 'view_collection');
INSERT INTO `auth_permission` VALUES (73, 'Can add 合集分类后台点击统计', 20, 'add_clickintersectsortcount');
INSERT INTO `auth_permission` VALUES (74, 'Can change 合集分类后台点击统计', 20, 'change_clickintersectsortcount');
INSERT INTO `auth_permission` VALUES (75, 'Can delete 合集分类后台点击统计', 20, 'delete_clickintersectsortcount');
INSERT INTO `auth_permission` VALUES (76, 'Can view 合集分类后台点击统计', 20, 'view_clickintersectsortcount');
INSERT INTO `auth_permission` VALUES (77, 'Can add 文章分类后台点击统计', 22, 'add_articlecategorybackstage');
INSERT INTO `auth_permission` VALUES (78, 'Can change 文章分类后台点击统计', 22, 'change_articlecategorybackstage');
INSERT INTO `auth_permission` VALUES (79, 'Can delete 文章分类后台点击统计', 22, 'delete_articlecategorybackstage');
INSERT INTO `auth_permission` VALUES (80, 'Can view 文章分类后台点击统计', 22, 'view_articlecategorybackstage');
INSERT INTO `auth_permission` VALUES (81, 'Can add 文章分类后台点击统计', 25, 'add_articlecategorybackstage');
INSERT INTO `auth_permission` VALUES (82, 'Can change 文章分类后台点击统计', 25, 'change_articlecategorybackstage');
INSERT INTO `auth_permission` VALUES (83, 'Can delete 文章分类后台点击统计', 25, 'delete_articlecategorybackstage');
INSERT INTO `auth_permission` VALUES (84, 'Can view 文章分类后台点击统计', 25, 'view_articlecategorybackstage');
INSERT INTO `auth_permission` VALUES (85, 'Can add 合集分类后台点击统计', 26, 'add_clickintersectsortcount');
INSERT INTO `auth_permission` VALUES (86, 'Can change 合集分类后台点击统计', 26, 'change_clickintersectsortcount');
INSERT INTO `auth_permission` VALUES (87, 'Can delete 合集分类后台点击统计', 26, 'delete_clickintersectsortcount');
INSERT INTO `auth_permission` VALUES (88, 'Can view 合集分类后台点击统计', 26, 'view_clickintersectsortcount');

-- ----------------------------
-- Table structure for blog_blog
-- ----------------------------
DROP TABLE IF EXISTS `blog_blog`;
CREATE TABLE `blog_blog`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `likes` int UNSIGNED NOT NULL,
  `author_id` bigint NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `simple_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `blog_post_author_id_dd7a8485_fk_user_userprofile_id`(`author_id`) USING BTREE,
  CONSTRAINT `blog_post_author_id_dd7a8485_fk_user_userprofile_id` FOREIGN KEY (`author_id`) REFERENCES `user_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_blog
-- ----------------------------
INSERT INTO `blog_blog` VALUES (1, '习近平总书记提出并阐述中国梦', '梦想，凝聚了几代中国人的夙愿，体现了中华民族和中国人民的整体利益，是每一个中华儿女的共同期盼。历史告诉我们，每个人的前途命运都与国家和民族的前途命运紧密相连。国家好，民族好，大家才会好。实现中华民族伟大复兴是一项光荣而艰巨的事业，需要一代又一代中国人共同为之努力。空谈误国，实干兴邦。我们这一代共产党人一定要承前启后、继往开来，把我们的党建设好，团结全体中华儿女把我们国家建设好，把我们民族发展好，继续朝着中华民族伟大复兴的目标奋勇前进。\r\n\r\n　　此后，习近平总书记多次深刻阐述实现中华民族伟大复兴的中国梦。强调中国梦的基本内涵是国家富强、民族振兴、人民幸福；中国梦归根到底是人民的梦，人民对美好生活的向往就是我们的奋斗目标；实现中国梦，必须坚持中国道路、弘扬中国精神、凝聚中国力量；全体中华儿女要同心共圆中华民族伟大复兴的中国梦；中国梦是和平、发展、合作、共赢的梦，不仅造福中国人民，而且造福世界人民。\r\n\r\n　　中国梦生动形象表达了全体中国人民的共同理想追求，昭示着国家富强、民族振兴、人民幸福的美好前景，为坚持和发展中国特色社会主义注入新的内涵和时代精神。中国梦已经成为凝聚党心民心、激励中华儿女为实现中华民族伟大复兴而奋斗的强大精神力量。', '2024-09-06 11:22:19.085416', '2025-07-11 18:56:15.677451', 1, 1, 'post_image/2024/09/favicon_zQU6Veh.jpg', '简介19');
INSERT INTO `blog_blog` VALUES (2, '什么是中国梦 怎样实现中国梦？', '新华社北京11月23日电 党的十八大召开后不久，2012年11月29日，习近平总书记和中央政治局常委李克强、张德江、俞正声、刘云山、王岐山、张高丽等来到国家博物馆，参观《复兴之路》基本陈列。习近平总书记在参观《复兴之路》展览时提出和阐述了“中国梦”。从这时起，“中国梦”就成为全党全社会乃至全世界高度关注的一个重要思想概念。\r\n\r\n　　习近平总书记指出，每个人都有理想和追求，都有自己的梦想。现在，大家都在讨论中国梦，我以为，实现中华民族伟大复兴，就是中华民族近代以来最伟大的梦想。这个梦想，凝聚了几代中国人的夙愿，体现了中华民族和中国人民的整体利益，是每一个中华儿女的共同期盼。历史告诉我们，每个人的前途命运都与国家和民族的前途命运紧密相连。国家好，民族好，大家才会好。实现中华民族伟大复兴是一项光荣而艰巨的事业，需要一代又一代中国人共同为之努力。空谈误国，实干兴邦。我们这一代共产党人一定要承前启后、继往开来，把我们的党建设好，团结全体中华儿女把我们国家建设好，把我们民族发展好，继续朝着中华民族伟大复兴的目标奋勇前进。\r\n\r\n　　此后，习近平总书记多次深刻阐述实现中华民族伟大复兴的中国梦。强调中国梦的基本内涵是国家富强、民族振兴、人民幸福；中国梦归根到底是人民的梦，人民对美好生活的向往就是我们的奋斗目标；实现中国梦，必须坚持中国道路、弘扬中国精神、凝聚中国力量；全体中华儿女要同心共圆中华民族伟大复兴的中国梦；中国梦是和平、发展、合作、共赢的梦，不仅造福中国人民，而且造福世界人民。\r\n\r\n　　中国梦生动形象表达了全体中国人民的共同理想追求，昭示着国家富强、民族振兴、人民幸福的美好前景，为坚持和发展中国特色社会主义注入新的内涵和时代精神。中国梦已经成为凝聚党心民心、激励中华儿女为实现中华民族伟大复兴而奋斗的强大精神力量。', '2024-09-10 01:14:30.789198', '2024-09-18 17:55:27.716272', 24, 2, 'post_image/2024/09/avatar_fiitC1U.jpg', '简介8');
INSERT INTO `blog_blog` VALUES (3, '“黄河很美，将来会更美”', '9月10日，总书记过陕西宝鸡，抵甘肃天水；11日，到兰州。12日，一场牵动黄河沿岸9省区的会议——全面推动黄河流域生态保护和高质量发展座谈会在兰州召开。\r\n\r\n　　这是一以贯之的牵挂。党的十八大以来，总书记30多次到黄河流域各省区考察。5年，同一主题三次召开座谈会，将黄河流域生态保护和高质量发展这一国家战略持续向纵深推进。\r\n\r\n　　这是运筹帷幄的布局。党的二十大至今，习近平总书记接连9次召开区域发展方面的座谈会。匠心独运丹青手，着眼的是大时代、大格局。万里山河起宏图。\r\n\r\n　　这是稳扎稳打的行进。新时代新征程，国家的江河战略融汇于中国式现代化的壮阔篇章。爬坡过坎、搏风击浪，向进一步全面深化改革要动力、要活力，万千气象，尽收眼底。\r\n\r\n　　这次座谈会上，习近平总书记深刻指出：“今天把这么多人召集到这里，就是为了黄河的永续发展，可见党中央多么重视。这件事要久久为功，锲而不舍，一以贯之地抓下去。”\r\n\r\n　　黄河落天走东海，万里写入胸怀间。\r\n\r\n　　文明之河：绵延不绝\r\n\r\n　　水脉连着文脉。\r\n\r\n　　中华文明史册上，黄河流域有3000多年是政治、经济、文化中心。中华文明，肇启于斯、传承于斯、灿烂于斯。\r\n\r\n　　甘陕之行，以文化开篇。\r\n\r\n　　9月10日，宝鸡青铜器博物院、天水伏羲庙；11日，麦积山石窟。\r\n\r\n　　文化不断流，再传承，这些璀璨瑰宝是见证和记录，亦是皇皇巨著的序言开篇。\r\n\r\n　　宝鸡，古称陈仓，孕育了周秦文化，以“青铜器之乡”闻名于世。\r\n\r\n　　博物院内，何尊、户方彝、墙盘、逨盘、 簋，还有金柄铁剑、秦公镈、吕不韦八年戈……历风霜洗礼，镌时光印记。\r\n\r\n　　金文载史。逨盘铭文记录一部极简西周史，堪称“青铜史书”；西周晚期四十三年逨鼎的铭文还原了约2800年前的廉政谈话；秦公镈铭文见证古人的开拓创新。\r\n\r\n　　伫立于镇院之宝何尊前，习近平总书记久久凝思。\r\n\r\n　　何尊铭文有“宅兹中国”一词，这成为迄今为止“中国”一词的最早文字记录。再久远', '2024-09-10 01:18:08.259849', '2024-09-18 17:55:19.035985', 6, 1, 'post_image/2024/09/img.png', '简介2');
INSERT INTO `blog_blog` VALUES (4, '《共产党员手机报》', '星期六　农历八月十二　预祝广大党员中秋节快乐\r\n\r\n　　9月10日至13日，中共中央总书记、国家主席、中央军委主席习近平先后来到甘肃省天水、兰州等地考察调研。在考察时，习近平强调，甘肃要深入落实党中央关于西部大开发、黄河流域生态保护和高质量发展的决策部署，完整准确全面贯彻新发展理念，坚持稳中求进工作总基调，着力在加强生态保护修复、加快绿色低碳转型发展、进一步全面深化改革开放、推动乡村全面振兴、加强民生保障、促进民族团结等方面下功夫，加快建设幸福美好新甘肃、不断开创富民兴陇新局面，奋力谱写中国式现代化甘肃篇章。\r\n\r\n　　国家主席习近平9月13日签署主席令，根据十四届全国人大常委会第十一次会议13日上午表决通过的全国人大常委会关于在中华人民共和国成立七十五周年之际授予国家勋章和国家荣誉称号的决定，授予15人国家勋章、国家荣誉称号。\r\n\r\n　　扬州经济技术开发区开展流动党员情况摸排行动，开发专有信息库，建立“三向联系、双重管理”机制，主动与流出地、流入地党组织沟通对接，实现流动党员有效管理。\r\n\r\n　　四川省成都市开展“万堂示范课下基层”、“基层党员进党校”活动，组织优秀讲师赴基层一线巡讲，指导基层党委依托街道“中心校”、“微党校”开展党员兜底培训，推动党员全覆盖轮训。\r\n\r\n　　【温馨提示】\r\n\r\n　　欢迎您对共产党员手机报提出宝贵意见，请发送手机短信至12371。', '2024-09-10 01:18:30.147250', '2024-09-18 17:55:11.372604', 5, 2, 'post_image/2024/09/banner_8ITV91p.jpg', '简介1');
INSERT INTO `blog_blog` VALUES (5, '《关于践行大食物观意见》', '新华社北京9月15日电　日前，国务院办公厅印发《关于践行大食物观构建多元化食物供给体系的意见》（以下简称《意见》）。\r\n\r\n　　《意见》以习近平新时代中国特色社会主义思想为指导，全面贯彻党的二十大和二十届二中、三中全会精神，锚定建设农业强国目标，在保护好生态环境的前提下，从耕地资源向整个国土资源拓展、从传统农作物和畜禽资源向更丰富的生物资源拓展，有效促进食物新品种、新领域、新技术开发，加快构建多元化食物供给体系，实现各类食物供求平衡，为确保国家粮食安全、建设农业强国提供坚实保障。\r\n\r\n　　《意见》提出3方面14项重点任务。一是全方位、多途径开发食物资源，拓展食物来源渠道。巩固提升产能，夯实粮食和重要农产品供给基础。积极发展经济林和林下经济，稳妥开发森林食物资源。大力发展饲草产业，增加草食畜产品供给。加快发展深远海养殖，科学开发江河湖海食物资源。加快发展现代设施农业，拓展食物开发新空间。培育发展生物农业，开拓新型食品资源。发展壮大食用菌产业，开发食用菌食品。二是大力推进科技创新，提升食物开发质量效益。加强食物开发基础研究，加快育种创新，构建食物科技创新支撑体系。三是推进全产业链建设，提升食物开发价值链。提升食物加工流通产业水平，推进食物产业集聚发展，提升食物质量安全水平，引导食物营养健康消费。\r\n\r\n　　《意见》要求，要强化保障措施，充分利用现有政策和资金渠道支持食物开发，发展特色农产品保险，完善用地政策，探索构建大食物监测统计体系。', '2024-09-15 22:36:18.783761', '2024-09-18 17:55:01.078377', 0, 4, 'post_image/2024/09/logo.png', '《意见》要求，要强化保障措施...');
INSERT INTO `blog_blog` VALUES (11, '题目', '方式v的', '2024-09-16 01:44:14.914142', '2024-09-18 17:54:26.614040', 1, 1, 'post_image/2024/09/favicon.jpg', '啊是第三方的v');
INSERT INTO `blog_blog` VALUES (12, '题目234r', 'qewraetshmb', '2024-09-16 21:44:37.244040', '2024-09-18 17:54:06.736944', 0, 1, 'post_image/2024/09/banner_tibb1JZ.jpg', '32rwef');
INSERT INTO `blog_blog` VALUES (13, 'qewregfd', 'wrefsdbcv', '2024-09-17 21:40:07.927768', '2024-09-22 12:35:09.256955', 0, 1, 'post_image/2024/09/img_OhW0yJi.png', '2qewrefsdvc');

-- ----------------------------
-- Table structure for blog_blog_categories
-- ----------------------------
DROP TABLE IF EXISTS `blog_blog_categories`;
CREATE TABLE `blog_blog_categories`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `blog_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `blog_post_categories_post_id_category_id_ed4f1727_uniq`(`blog_id`, `category_id`) USING BTREE,
  INDEX `blog_post_categories_category_id_2211dae5_fk`(`category_id`) USING BTREE,
  CONSTRAINT `blog_blog_categories_blog_id_41b7a08b_fk_blog_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `blog_blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_post_categories_category_id_2211dae5_fk` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_blog_categories
-- ----------------------------
INSERT INTO `blog_blog_categories` VALUES (1, 1, 1);
INSERT INTO `blog_blog_categories` VALUES (10, 1, 2);
INSERT INTO `blog_blog_categories` VALUES (11, 1, 3);
INSERT INTO `blog_blog_categories` VALUES (2, 2, 2);
INSERT INTO `blog_blog_categories` VALUES (9, 3, 1);
INSERT INTO `blog_blog_categories` VALUES (3, 3, 2);
INSERT INTO `blog_blog_categories` VALUES (4, 4, 1);
INSERT INTO `blog_blog_categories` VALUES (5, 5, 1);
INSERT INTO `blog_blog_categories` VALUES (6, 5, 2);
INSERT INTO `blog_blog_categories` VALUES (8, 11, 1);
INSERT INTO `blog_blog_categories` VALUES (7, 11, 3);
INSERT INTO `blog_blog_categories` VALUES (12, 13, 1);

-- ----------------------------
-- Table structure for blog_blog_tags
-- ----------------------------
DROP TABLE IF EXISTS `blog_blog_tags`;
CREATE TABLE `blog_blog_tags`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `blog_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `blog_post_tags_post_id_tag_id_4925ec37_uniq`(`blog_id`, `tag_id`) USING BTREE,
  INDEX `blog_post_tags_tag_id_0875c551_fk`(`tag_id`) USING BTREE,
  CONSTRAINT `blog_blog_tags_blog_id_e4cd5f6a_fk_blog_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `blog_blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_post_tags_tag_id_0875c551_fk` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_blog_tags
-- ----------------------------
INSERT INTO `blog_blog_tags` VALUES (1, 1, 1);
INSERT INTO `blog_blog_tags` VALUES (11, 1, 2);
INSERT INTO `blog_blog_tags` VALUES (12, 1, 3);
INSERT INTO `blog_blog_tags` VALUES (2, 2, 2);
INSERT INTO `blog_blog_tags` VALUES (3, 3, 1);
INSERT INTO `blog_blog_tags` VALUES (4, 3, 2);
INSERT INTO `blog_blog_tags` VALUES (5, 4, 1);
INSERT INTO `blog_blog_tags` VALUES (6, 4, 2);
INSERT INTO `blog_blog_tags` VALUES (7, 5, 1);
INSERT INTO `blog_blog_tags` VALUES (8, 5, 3);
INSERT INTO `blog_blog_tags` VALUES (10, 11, 1);
INSERT INTO `blog_blog_tags` VALUES (9, 11, 3);
INSERT INTO `blog_blog_tags` VALUES (13, 13, 2);

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES (1, '种类1');
INSERT INTO `blog_category` VALUES (2, '种类2');
INSERT INTO `blog_category` VALUES (3, '种类3');

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `author_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `blog_comment_author_id_4f11e2e0_fk_user_userprofile_id`(`author_id`) USING BTREE,
  CONSTRAINT `blog_comment_author_id_4f11e2e0_fk_user_userprofile_id` FOREIGN KEY (`author_id`) REFERENCES `user_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_comment
-- ----------------------------
INSERT INTO `blog_comment` VALUES (1, '我是admin，我评论题目', '2024-09-06 11:26:06.197654', 1);

-- ----------------------------
-- Table structure for blog_post_bookmarks
-- ----------------------------
DROP TABLE IF EXISTS `blog_post_bookmarks`;
CREATE TABLE `blog_post_bookmarks`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `userprofile_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `blog_post_bookmarks_post_id_userprofile_id_6095d554_uniq`(`post_id`, `userprofile_id`) USING BTREE,
  INDEX `blog_post_bookmarks_userprofile_id_e3cbb124_fk_user_user`(`userprofile_id`) USING BTREE,
  CONSTRAINT `blog_post_bookmarks_post_id_eb9c59a3_fk` FOREIGN KEY (`post_id`) REFERENCES `blog_blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_post_bookmarks_userprofile_id_e3cbb124_fk_user_user` FOREIGN KEY (`userprofile_id`) REFERENCES `user_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_post_bookmarks
-- ----------------------------
INSERT INTO `blog_post_bookmarks` VALUES (1, 1, 1);
INSERT INTO `blog_post_bookmarks` VALUES (2, 3, 2);
INSERT INTO `blog_post_bookmarks` VALUES (3, 4, 1);

-- ----------------------------
-- Table structure for blog_post_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_post_comment`;
CREATE TABLE `blog_post_comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `comment_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `blog_post_Comment_post_id_comment_id_05547e8c_uniq`(`post_id`, `comment_id`) USING BTREE,
  INDEX `blog_post_Comment_comment_id_aab69d3a_fk_blog_comment_id`(`comment_id`) USING BTREE,
  CONSTRAINT `blog_post_Comment_comment_id_aab69d3a_fk_blog_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `blog_comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_post_Comment_post_id_f9eb2cbd_fk_blog_post_id` FOREIGN KEY (`post_id`) REFERENCES `blog_blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_post_comment
-- ----------------------------

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
INSERT INTO `blog_tag` VALUES (1, '标签1');
INSERT INTO `blog_tag` VALUES (2, '标签2');
INSERT INTO `blog_tag` VALUES (3, '标签3');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_user_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2024-09-06 11:21:28.351871', '1', '标签1', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (2, '2024-09-06 11:21:32.215234', '2', '标签2', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (3, '2024-09-06 11:21:37.378259', '3', '标签3', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (4, '2024-09-06 11:21:44.328283', '1', '种类1', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (5, '2024-09-06 11:21:48.318068', '2', '种类2', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (6, '2024-09-06 11:21:56.681428', '3', '种类3', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (7, '2024-09-06 11:22:19.093436', '1', '题目', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (8, '2024-09-06 11:26:06.198651', '1', 'Comment by admin on 题目', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (9, '2024-09-06 16:00:37.526543', '1', 'sinead', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (10, '2024-09-07 19:37:10.105400', '2', 'sinead', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (11, '2024-09-07 19:37:25.020397', '2', 'sinead', 2, '[]', 10, 1);
INSERT INTO `django_admin_log` VALUES (12, '2024-09-10 01:14:30.820850', '2', '题目2', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (13, '2024-09-10 01:18:08.269390', '3', '题目3', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (14, '2024-09-10 01:18:30.163116', '4', '题目4', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (15, '2024-09-10 01:18:39.996817', '1', '题目1', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u9898\\u76ee\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (16, '2024-09-10 22:21:13.441777', '4', '题目4', 2, '[]', 8, 1);
INSERT INTO `django_admin_log` VALUES (17, '2024-09-10 22:21:23.304880', '3', '题目3', 2, '[{\"changed\": {\"fields\": [\"\\u535a\\u5ba2\\u5c01\\u9762\\u56fe\\u7247\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (18, '2024-09-10 22:21:30.950626', '2', '题目2', 2, '[{\"changed\": {\"fields\": [\"\\u535a\\u5ba2\\u5c01\\u9762\\u56fe\\u7247\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (19, '2024-09-10 22:21:37.444667', '1', '题目1', 2, '[{\"changed\": {\"fields\": [\"\\u535a\\u5ba2\\u5c01\\u9762\\u56fe\\u7247\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (20, '2024-09-10 23:11:42.474701', '4', '题目4', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u7b80\\u4ecb\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (21, '2024-09-10 23:11:51.254677', '3', '题目3', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u7b80\\u4ecb\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (22, '2024-09-10 23:11:57.803901', '2', '题目2', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u7b80\\u4ecb\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (23, '2024-09-10 23:12:03.738911', '1', '题目1', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u7b80\\u4ecb\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (24, '2024-09-10 23:14:39.311376', '4', '题目4', 2, '[{\"changed\": {\"fields\": [\"\\u535a\\u5ba2\\u5c01\\u9762\\u56fe\\u7247\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (25, '2024-09-15 11:38:45.160870', '1', '习近平总书记提出并阐述中国梦', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u9898\\u76ee\", \"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (26, '2024-09-15 11:39:26.287060', '2', '什么是中国梦 怎样实现中国梦？——读《习近平关于实现中华民族伟大复兴的中国梦论述摘编》', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u9898\\u76ee\", \"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (27, '2024-09-15 11:40:19.466692', '3', '“黄河很美，将来会更美”——习近平总书记在甘肃、陕西考察并主持召开全面推动黄河流域生态保护和高质量发展座谈会纪实', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u9898\\u76ee\", \"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (28, '2024-09-15 11:40:44.623525', '4', '《共产党员手机报》20240914', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u9898\\u76ee\", \"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (29, '2024-09-15 11:41:21.261227', '3', '“黄河很美，将来会更美”', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u9898\\u76ee\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (30, '2024-09-15 11:41:27.694608', '2', '什么是中国梦 怎样实现中国梦？', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u9898\\u76ee\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (31, '2024-09-15 11:51:59.836323', '4', '《共产党员手机报》', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u9898\\u76ee\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (32, '2024-09-15 12:53:35.033343', '4', '《共产党员手机报》', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u4f5c\\u8005\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (33, '2024-09-15 12:53:42.730223', '2', '什么是中国梦 怎样实现中国梦？', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u4f5c\\u8005\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (34, '2024-09-15 22:36:18.791142', '5', '《关于践行大食物观构建多元化食物供给体系的意见》', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (35, '2024-09-15 23:52:26.150138', '5', '《关于践行大食物观构建多元化食物供给体系的意见》', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u7b80\\u4ecb\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (36, '2024-09-15 23:52:51.721654', '5', '《关于践行大食物观意见》', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u9898\\u76ee\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (37, '2024-09-15 23:53:07.198803', '5', '《关于践行大食物观意见》', 2, '[]', 8, 1);
INSERT INTO `django_admin_log` VALUES (38, '2024-09-16 00:37:20.806844', '5', '《关于践行大食物观意见》', 2, '[{\"changed\": {\"fields\": [\"\\u535a\\u5ba2\\u5c01\\u9762\\u56fe\\u7247\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (39, '2024-09-16 01:31:18.888852', '10', '题目3', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (40, '2024-09-16 01:31:18.933075', '9', 'django', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (41, '2024-09-16 01:31:18.938383', '8', '题目', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (42, '2024-09-16 01:31:18.939384', '7', '题目', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (43, '2024-09-16 01:31:18.946935', '6', '题目', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (44, '2024-09-16 19:16:06.976958', '11', '题目', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u79cd\\u7c7b\", \"\\u6587\\u7ae0\\u6807\\u7b7e\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (45, '2024-09-16 19:16:13.834064', '3', '“黄河很美，将来会更美”', 2, '[]', 8, 1);
INSERT INTO `django_admin_log` VALUES (46, '2024-09-16 19:16:19.528960', '1', '习近平总书记提出并阐述中国梦', 2, '[]', 8, 1);
INSERT INTO `django_admin_log` VALUES (47, '2024-09-16 19:57:00.886285', '11', '题目', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u79cd\\u7c7b\", \"\\u6587\\u7ae0\\u6807\\u7b7e\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (48, '2024-09-16 19:57:08.908621', '3', '“黄河很美，将来会更美”', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u79cd\\u7c7b\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (49, '2024-09-16 19:57:20.247079', '1', '习近平总书记提出并阐述中国梦', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u79cd\\u7c7b\", \"\\u6587\\u7ae0\\u6807\\u7b7e\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (50, '2024-09-18 14:46:14.639565', '13', 'qewregfd', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u79cd\\u7c7b\", \"\\u6587\\u7ae0\\u6807\\u7b7e\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (51, '2024-09-18 14:46:39.471071', '13', 'qewregfd', 2, '[{\"changed\": {\"fields\": [\"\\u535a\\u5ba2\\u5c01\\u9762\\u56fe\\u7247\"]}}]', 8, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (13, 'area', 'area');
INSERT INTO `django_content_type` VALUES (14, 'area', 'articlearea');
INSERT INTO `django_content_type` VALUES (16, 'article', 'article');
INSERT INTO `django_content_type` VALUES (15, 'article', 'articlefile');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (8, 'blog', 'blog');
INSERT INTO `django_content_type` VALUES (6, 'blog', 'category');
INSERT INTO `django_content_type` VALUES (7, 'blog', 'comment');
INSERT INTO `django_content_type` VALUES (9, 'blog', 'tag');
INSERT INTO `django_content_type` VALUES (17, 'category', 'category');
INSERT INTO `django_content_type` VALUES (18, 'collection', 'articlecategory');
INSERT INTO `django_content_type` VALUES (22, 'collection', 'articlecategorybackstage');
INSERT INTO `django_content_type` VALUES (20, 'collection', 'clickintersectsortcount');
INSERT INTO `django_content_type` VALUES (21, 'collection', 'clickintersectsortusercount');
INSERT INTO `django_content_type` VALUES (19, 'collection', 'collection');
INSERT INTO `django_content_type` VALUES (23, 'connection', 'articlecategory');
INSERT INTO `django_content_type` VALUES (25, 'connection', 'articlecategorybackstage');
INSERT INTO `django_content_type` VALUES (26, 'connection', 'clickintersectsortcount');
INSERT INTO `django_content_type` VALUES (24, 'connection', 'collectioncategory');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (11, 'operations', 'coursecomments');
INSERT INTO `django_content_type` VALUES (12, 'operations', 'userfavorite');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (10, 'user', 'userprofile');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2024-09-06 11:04:11.056574');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2024-09-06 11:04:11.099700');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2024-09-06 11:04:11.271249');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2024-09-06 11:04:11.313733');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2024-09-06 11:04:11.319733');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2024-09-06 11:04:11.325886');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2024-09-06 11:04:11.334885');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2024-09-06 11:04:11.339884');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2024-09-06 11:04:11.351489');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2024-09-06 11:04:11.357532');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2024-09-06 11:04:11.368596');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2024-09-06 11:04:11.389284');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2024-09-06 11:04:11.398750');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2024-09-06 11:04:11.405715');
INSERT INTO `django_migrations` VALUES (15, 'user', '0001_initial', '2024-09-06 11:04:11.603054');
INSERT INTO `django_migrations` VALUES (16, 'admin', '0001_initial', '2024-09-06 11:04:11.682967');
INSERT INTO `django_migrations` VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2024-09-06 11:04:11.689995');
INSERT INTO `django_migrations` VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2024-09-06 11:04:11.699332');
INSERT INTO `django_migrations` VALUES (19, 'blog', '0001_initial', '2024-09-06 11:04:11.752177');
INSERT INTO `django_migrations` VALUES (20, 'blog', '0002_initial', '2024-09-06 11:04:12.131434');
INSERT INTO `django_migrations` VALUES (21, 'sessions', '0001_initial', '2024-09-06 11:04:12.154931');
INSERT INTO `django_migrations` VALUES (22, 'blog', '0003_alter_comment_created_at', '2024-09-06 15:48:20.898533');
INSERT INTO `django_migrations` VALUES (23, 'blog', '0004_alter_category_id_alter_comment_id_alter_post_id_and_more', '2024-09-06 16:09:59.172986');
INSERT INTO `django_migrations` VALUES (24, 'user', '0002_userprofile_creation_time', '2024-09-07 19:41:31.451865');
INSERT INTO `django_migrations` VALUES (25, 'user', '0002_remove_userprofile_nick_name_and_more', '2024-09-07 20:58:21.182542');
INSERT INTO `django_migrations` VALUES (26, 'blog', '0005_post_image', '2024-09-08 10:48:53.314492');
INSERT INTO `django_migrations` VALUES (27, 'blog', '0002_post_simple_content_alter_post_image', '2024-09-10 23:04:03.892736');
INSERT INTO `django_migrations` VALUES (28, 'user', '0002_userprofile_creation_time_userprofile_image', '2024-09-10 23:04:04.036554');
INSERT INTO `django_migrations` VALUES (29, 'blog', '0003_remove_comment_post_post_comment', '2024-09-11 12:14:31.826050');
INSERT INTO `django_migrations` VALUES (30, 'operations', '0001_initial', '2024-09-11 12:35:52.768620');
INSERT INTO `django_migrations` VALUES (31, 'user', '0003_userprofile_likes', '2024-09-11 12:47:49.214624');
INSERT INTO `django_migrations` VALUES (32, 'blog', '0002_remove_post_views', '2024-09-11 12:48:01.049126');
INSERT INTO `django_migrations` VALUES (33, 'user', '0004_alter_userprofile_image', '2024-09-15 13:08:02.707385');
INSERT INTO `django_migrations` VALUES (34, 'user', '0005_alter_userprofile_image', '2024-09-15 19:58:43.004738');
INSERT INTO `django_migrations` VALUES (35, 'user', '0006_alter_userprofile_image', '2024-09-15 22:37:42.382623');
INSERT INTO `django_migrations` VALUES (36, 'blog', '0003_alter_post_image', '2024-09-18 14:38:07.447672');
INSERT INTO `django_migrations` VALUES (37, 'blog', '0004_rename_post_blog', '2024-09-18 16:16:14.639873');
INSERT INTO `django_migrations` VALUES (38, 'blog', '0005_alter_blog_image', '2024-09-18 20:45:26.040063');
INSERT INTO `django_migrations` VALUES (39, 'user', '0007_alter_userprofile_image', '2024-09-18 20:45:26.058243');
INSERT INTO `django_migrations` VALUES (40, 'article', '0001_initial', '2024-09-27 08:28:07.974464');
INSERT INTO `django_migrations` VALUES (41, 'area', '0001_initial', '2024-09-27 08:28:08.295305');
INSERT INTO `django_migrations` VALUES (42, 'category', '0001_initial', '2024-09-27 08:28:08.330709');
INSERT INTO `django_migrations` VALUES (43, 'collection', '0001_initial', '2024-09-27 08:28:09.242477');
INSERT INTO `django_migrations` VALUES (44, 'collection', '0002_remove_articlecategorybackstage_article_and_more', '2024-09-27 08:40:44.966638');
INSERT INTO `django_migrations` VALUES (45, 'article', '0002_article_category_article_collection', '2024-09-27 08:40:45.157575');
INSERT INTO `django_migrations` VALUES (46, 'connection', '0001_initial', '2024-09-27 08:40:46.067838');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('4pz5hvki80mejfu7wq7wufxnttvxim7a', '.eJxVzEEOwiAUBNC7sDYE6AfEpXvPQD4fkKqBpLQr492lSRe6nXkzb-ZxW4vfelr8HNmFSXb6zQLSM9W9iA-s98ap1XWZA98JP9rOby2m1_WwfwcFexlro9BNwWYQWQRJZgoatQRSJkKKNgFIJ60mQ0oa4QZxeTpnDAADC8M-X9V1N2Q:1spiy6:0rb4jfyMdmgxdfGv4CyFnDb3BTCzskt3ndAeBt-FrbI', '2024-09-29 14:42:46.307137');
INSERT INTO `django_session` VALUES ('lhze3yk5jk8zb75prpwbyu82foxllb5n', '.eJxVzEEOwiAUBNC7sDYE6AfEpXvPQD4fkKqBpLQr492lSRe6nXkzb-ZxW4vfelr8HNmFSXb6zQLSM9W9iA-s98ap1XWZA98JP9rOby2m1_WwfwcFexlro9BNwWYQWQRJZgoatQRSJkKKNgFIJ60mQ0oa4QZxeTpnDAADC8M-X9V1N2Q:1smPIG:lSk0ftxKfZ3WE-GmpS4O18MbugbnnBjY5jsTPSmnsyY', '2024-09-20 11:05:52.638871');
INSERT INTO `django_session` VALUES ('s3qzxt4r8txs2q49jkb45vybvtqllwnz', '.eJxVzEEOwiAUBNC7sDYE6AfEpXvPQD4fkKqBpLQr492lSRe6nXkzb-ZxW4vfelr8HNmFSXb6zQLSM9W9iA-s98ap1XWZA98JP9rOby2m1_WwfwcFexlro9BNwWYQWQRJZgoatQRSJkKKNgFIJ60mQ0oa4QZxeTpnDAADC8M-X9V1N2Q:1uaBPH:b0DjvBDwsZXyvWVpeYFhC13uuZdx3GgqwQWKH--dtXc', '2025-07-25 18:55:07.867569');
INSERT INTO `django_session` VALUES ('vtjgn3nu9amh135ynz9v374xq6jmvbx1', '.eJxVzEEOwiAUBNC7sDYE6AfEpXvPQD4fkKqBpLQr492lSRe6nXkzb-ZxW4vfelr8HNmFSXb6zQLSM9W9iA-s98ap1XWZA98JP9rOby2m1_WwfwcFexlro9BNwWYQWQRJZgoatQRSJkKKNgFIJ60mQ0oa4QZxeTpnDAADC8M-X9V1N2Q:1sn99g:54l_X5IUk5aIghl53-wXYt9CQCKOC1k_t595Rhred2k', '2024-09-22 12:04:04.864953');
INSERT INTO `django_session` VALUES ('yeow7y6ezi2phz7wdy7oz4vlgt8v343f', '.eJxVjMsOwiAQRf-FtSHIe1y67zcQYAapGkhKuzL-uzbpQrf3nHNfLMRtrWEbtIQZ2YV5dvrdUswPajvAe2y3znNv6zInviv8oINPHel5Pdy_gxpH_dagrBSGDDrvsgGPVkqZrFIJQaMywkLRDkjns0dS4IpLnqwqgCSEI_b-AL4kN0o:1squ5Q:r_7CpZeXT5SJZzO7HmzCnSQeS0Ic7K2y9Ak8uqf9mec', '2024-10-02 20:47:12.098875');
INSERT INTO `django_session` VALUES ('zzwmt4oar684h8i78qpji4ufyxcg6q0p', '.eJxVzEEOwiAUBNC7sDYE6AfEpXvPQD4fkKqBpLQr492lSRe6nXkzb-ZxW4vfelr8HNmFSXb6zQLSM9W9iA-s98ap1XWZA98JP9rOby2m1_WwfwcFexlro9BNwWYQWQRJZgoatQRSJkKKNgFIJ60mQ0oa4QZxeTpnDAADC8M-X9V1N2Q:1sphUj:71WpXocw6w6ymoMsTrY9m9GVRApFzo1t3yzRg9vjUcw', '2024-09-29 13:08:21.302314');

-- ----------------------------
-- Table structure for operations_coursecomments
-- ----------------------------
DROP TABLE IF EXISTS `operations_coursecomments`;
CREATE TABLE `operations_coursecomments`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `author_id` bigint NOT NULL,
  `post_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operations_coursecom_author_id_9a91faf7_fk_user_user`(`author_id`) USING BTREE,
  INDEX `operations_coursecomments_post_id_4594645b_fk_blog_blog_id`(`post_id`) USING BTREE,
  CONSTRAINT `operations_coursecom_author_id_9a91faf7_fk_user_user` FOREIGN KEY (`author_id`) REFERENCES `user_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `operations_coursecomments_post_id_4594645b_fk_blog_blog_id` FOREIGN KEY (`post_id`) REFERENCES `blog_blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operations_coursecomments
-- ----------------------------
INSERT INTO `operations_coursecomments` VALUES (1, '12', '2024-09-16 21:27:24.910218', 1, 2);
INSERT INTO `operations_coursecomments` VALUES (2, '98765654', '2024-09-16 21:55:27.654218', 1, 3);
INSERT INTO `operations_coursecomments` VALUES (3, '98765654', '2024-09-16 21:55:39.406269', 1, 3);
INSERT INTO `operations_coursecomments` VALUES (4, '7654', '2024-09-16 21:56:36.520604', 1, 4);
INSERT INTO `operations_coursecomments` VALUES (5, 'qwewrefdg', '2024-09-16 22:19:29.816600', 1, 12);
INSERT INTO `operations_coursecomments` VALUES (6, 'FSdji肌肤的考虑出门， 围殴及分配的僧侣们', '2024-09-16 22:22:52.642335', 1, 12);
INSERT INTO `operations_coursecomments` VALUES (7, '34wt', '2024-09-17 00:40:19.739316', 1, 11);
INSERT INTO `operations_coursecomments` VALUES (8, '23q4wretrgfbv', '2024-09-17 21:39:40.248144', 1, 12);
INSERT INTO `operations_coursecomments` VALUES (9, '123', '2025-07-11 18:56:05.162829', 1, 1);
INSERT INTO `operations_coursecomments` VALUES (10, '123', '2025-07-11 18:56:10.237355', 1, 1);
INSERT INTO `operations_coursecomments` VALUES (11, '13ee', '2025-07-11 18:56:13.428140', 1, 1);

-- ----------------------------
-- Table structure for operations_userfavorite
-- ----------------------------
DROP TABLE IF EXISTS `operations_userfavorite`;
CREATE TABLE `operations_userfavorite`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fav_id` int NOT NULL,
  `fav_type` int NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operations_userfavorite_user_id_092d3821_fk_user_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `operations_userfavorite_user_id_092d3821_fk_user_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operations_userfavorite
-- ----------------------------
INSERT INTO `operations_userfavorite` VALUES (87, 11, 1, 1);
INSERT INTO `operations_userfavorite` VALUES (91, 1, 1, 1);

-- ----------------------------
-- Table structure for user_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `user_userprofile`;
CREATE TABLE `user_userprofile`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `creation_time` datetime(6) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `likes` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_userprofile
-- ----------------------------
INSERT INTO `user_userprofile` VALUES (1, 'pbkdf2_sha256$600000$LTjGWwutWF4IIw01qN7nbt$RaQx0ICqw/gEss6DSw9obMPFDhQDQVFDi2ZmVjgucaE=', '2025-07-11 18:55:07.862591', 1, 'admin', '', '', '', 1, 1, '2024-09-06 11:05:39.771406', '2024-09-10 23:04:03.911736', 'head_image/2024/09/favicon.jpg', 0);
INSERT INTO `user_userprofile` VALUES (2, 'pbkdf2_sha256$600000$YlkxgXpvupfYqDEZnLHZL3$q1GENGCU9cQTWWy+lxftZfgr6UAsX+ccqX9+VDQRHMs=', NULL, 0, 'sinead', '', '', '', 0, 1, '2024-09-07 19:37:00.000000', '2024-09-10 23:04:03.911736', 'head_image/default.jpg', 0);
INSERT INTO `user_userprofile` VALUES (3, 'pbkdf2_sha256$600000$A0fSyfAoa14E1Q8QnQBsT1$pQQ7e/ZJPgFLE8IilctclU5Maf/Jg/FBvD7LeIJt1lg=', '2024-09-09 18:26:12.665993', 0, '1234', '', '', '15834584868@163.com', 0, 1, '2024-09-09 18:26:11.314163', '2024-09-10 23:04:03.911736', 'head_image/default.jpg', 0);
INSERT INTO `user_userprofile` VALUES (4, 'pbkdf2_sha256$600000$xQ0CciL5oIQyKi0vH5Rf4l$i6IbiuocZQeItulMlev8fTaqosQ33iGQbHuxrIdLP4k=', '2024-09-10 00:02:39.898222', 0, '123456', '', '', '15834584868@163.com', 0, 1, '2024-09-10 00:02:38.552578', '2024-09-10 23:04:03.911736', 'head_image/default.jpg', 0);
INSERT INTO `user_userprofile` VALUES (5, 'pbkdf2_sha256$600000$0wDacjLh7WFPDz6wFp8WX9$YC47wHEH5CP3iMSMCB/tFscED+IgjnvyYFFpBMP8P3g=', '2024-09-10 00:28:18.387426', 0, 'demo2', '', '', '15834584868@163.com', 0, 1, '2024-09-10 00:28:17.027953', '2024-09-10 23:04:03.911736', 'head_image/default.jpg', 0);
INSERT INTO `user_userprofile` VALUES (6, 'pbkdf2_sha256$600000$DGs0PEsWrU8DYjqqnpti8r$yQBLqK2cdqzdiCtiYSXwLVd77rJgAL3jvF+KFfLNxUQ=', '2024-09-18 20:42:50.221770', 0, '1111', '', '', '15834584868@163.com', 0, 1, '2024-09-18 20:42:49.906434', '2024-09-18 20:42:49.906434', '', 0);
INSERT INTO `user_userprofile` VALUES (8, 'pbkdf2_sha256$600000$Ni99SFUV0hh4aqpg2WvSl0$mBy/c8Se88ZkDO4l8PSOlOC8r1s21bfvG0dQsGaleCE=', '2024-09-18 20:47:12.098875', 0, 'hello', '', '', '15834584868@163.com', 0, 1, '2024-09-18 20:47:11.793958', '2024-09-18 20:47:11.793958', 'img.png', 0);

-- ----------------------------
-- Table structure for user_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `user_userprofile_groups`;
CREATE TABLE `user_userprofile_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userprofile_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_userprofile_groups_userprofile_id_group_id_52847a61_uniq`(`userprofile_id`, `group_id`) USING BTREE,
  INDEX `user_userprofile_groups_group_id_98cc4038_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `user_userprofile_gro_userprofile_id_49724c40_fk_user_user` FOREIGN KEY (`userprofile_id`) REFERENCES `user_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_userprofile_groups_group_id_98cc4038_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for user_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `user_userprofile_user_permissions`;
CREATE TABLE `user_userprofile_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userprofile_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_userprofile_user_pe_userprofile_id_permissio_2e86ceca_uniq`(`userprofile_id`, `permission_id`) USING BTREE,
  INDEX `user_userprofile_use_permission_id_7f559b23_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `user_userprofile_use_permission_id_7f559b23_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_userprofile_use_userprofile_id_68dc814c_fk_user_user` FOREIGN KEY (`userprofile_id`) REFERENCES `user_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_userprofile_user_permissions
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
