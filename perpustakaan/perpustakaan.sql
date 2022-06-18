/*
 Navicat Premium Data Transfer

 Source Server         : anu
 Source Server Type    : MySQL
 Source Server Version : 100421
 Source Host           : localhost:3306
 Source Schema         : perpustakaan

 Target Server Type    : MySQL
 Target Server Version : 100421
 File Encoding         : 65001

 Date: 18/06/2022 00:16:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for anggota_mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `anggota_mahasiswa`;
CREATE TABLE `anggota_mahasiswa`  (
  `NoAnggotaM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NIM` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NamaAnggota` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Jurusan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TanggalLahir` date NOT NULL,
  `Alamat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `KodePos` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NoTelp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HP` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Angkatan` int NOT NULL,
  `NamaOrtu` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AlamatOrtu` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NoTelpOrtu` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JenisKelamin` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TempatLahir` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `poto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`NoAnggotaM`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of anggota_mahasiswa
-- ----------------------------
INSERT INTO `anggota_mahasiswa` VALUES ('m-01', '1212', 'Ari Sanjaya', 'Teknik Informatika', '2002-06-06', 'Rhee ', '98201', '082347173812', NULL, 2020, '', '', NULL, 'L', 'Rhee', '');

-- ----------------------------
-- Table structure for anggota_non_mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `anggota_non_mahasiswa`;
CREATE TABLE `anggota_non_mahasiswa`  (
  `NoAnggotaN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NIP` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NamaAnggota` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Jabatan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TanggalLahir` date NOT NULL,
  `Alamat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `KodePos` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NoTelp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HP` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TglDaftar` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JenisKelamin` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TempatLahir` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `poto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`NoAnggotaN`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of anggota_non_mahasiswa
-- ----------------------------
INSERT INTO `anggota_non_mahasiswa` VALUES ('n-01', '2324', 'Rahmatullah', 'Dosen', '1985-02-07', 'Sumbawa', '89021', '081324614248', NULL, '2016', 'L', 'Sumbawa', '');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add anggota mahasiswa', 7, 'add_anggotamahasiswa');
INSERT INTO `auth_permission` VALUES (26, 'Can change anggota mahasiswa', 7, 'change_anggotamahasiswa');
INSERT INTO `auth_permission` VALUES (27, 'Can delete anggota mahasiswa', 7, 'delete_anggotamahasiswa');
INSERT INTO `auth_permission` VALUES (28, 'Can view anggota mahasiswa', 7, 'view_anggotamahasiswa');
INSERT INTO `auth_permission` VALUES (29, 'Can add anggota non mahasiswa', 8, 'add_anggotanonmahasiswa');
INSERT INTO `auth_permission` VALUES (30, 'Can change anggota non mahasiswa', 8, 'change_anggotanonmahasiswa');
INSERT INTO `auth_permission` VALUES (31, 'Can delete anggota non mahasiswa', 8, 'delete_anggotanonmahasiswa');
INSERT INTO `auth_permission` VALUES (32, 'Can view anggota non mahasiswa', 8, 'view_anggotanonmahasiswa');
INSERT INTO `auth_permission` VALUES (33, 'Can add auth group', 9, 'add_authgroup');
INSERT INTO `auth_permission` VALUES (34, 'Can change auth group', 9, 'change_authgroup');
INSERT INTO `auth_permission` VALUES (35, 'Can delete auth group', 9, 'delete_authgroup');
INSERT INTO `auth_permission` VALUES (36, 'Can view auth group', 9, 'view_authgroup');
INSERT INTO `auth_permission` VALUES (37, 'Can add auth group permissions', 10, 'add_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (38, 'Can change auth group permissions', 10, 'change_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (39, 'Can delete auth group permissions', 10, 'delete_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (40, 'Can view auth group permissions', 10, 'view_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (41, 'Can add auth permission', 11, 'add_authpermission');
INSERT INTO `auth_permission` VALUES (42, 'Can change auth permission', 11, 'change_authpermission');
INSERT INTO `auth_permission` VALUES (43, 'Can delete auth permission', 11, 'delete_authpermission');
INSERT INTO `auth_permission` VALUES (44, 'Can view auth permission', 11, 'view_authpermission');
INSERT INTO `auth_permission` VALUES (45, 'Can add auth user', 12, 'add_authuser');
INSERT INTO `auth_permission` VALUES (46, 'Can change auth user', 12, 'change_authuser');
INSERT INTO `auth_permission` VALUES (47, 'Can delete auth user', 12, 'delete_authuser');
INSERT INTO `auth_permission` VALUES (48, 'Can view auth user', 12, 'view_authuser');
INSERT INTO `auth_permission` VALUES (49, 'Can add auth user groups', 13, 'add_authusergroups');
INSERT INTO `auth_permission` VALUES (50, 'Can change auth user groups', 13, 'change_authusergroups');
INSERT INTO `auth_permission` VALUES (51, 'Can delete auth user groups', 13, 'delete_authusergroups');
INSERT INTO `auth_permission` VALUES (52, 'Can view auth user groups', 13, 'view_authusergroups');
INSERT INTO `auth_permission` VALUES (53, 'Can add auth user user permissions', 14, 'add_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (54, 'Can change auth user user permissions', 14, 'change_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (55, 'Can delete auth user user permissions', 14, 'delete_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (56, 'Can view auth user user permissions', 14, 'view_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (57, 'Can add buku', 15, 'add_buku');
INSERT INTO `auth_permission` VALUES (58, 'Can change buku', 15, 'change_buku');
INSERT INTO `auth_permission` VALUES (59, 'Can delete buku', 15, 'delete_buku');
INSERT INTO `auth_permission` VALUES (60, 'Can view buku', 15, 'view_buku');
INSERT INTO `auth_permission` VALUES (61, 'Can add django admin log', 16, 'add_djangoadminlog');
INSERT INTO `auth_permission` VALUES (62, 'Can change django admin log', 16, 'change_djangoadminlog');
INSERT INTO `auth_permission` VALUES (63, 'Can delete django admin log', 16, 'delete_djangoadminlog');
INSERT INTO `auth_permission` VALUES (64, 'Can view django admin log', 16, 'view_djangoadminlog');
INSERT INTO `auth_permission` VALUES (65, 'Can add django content type', 17, 'add_djangocontenttype');
INSERT INTO `auth_permission` VALUES (66, 'Can change django content type', 17, 'change_djangocontenttype');
INSERT INTO `auth_permission` VALUES (67, 'Can delete django content type', 17, 'delete_djangocontenttype');
INSERT INTO `auth_permission` VALUES (68, 'Can view django content type', 17, 'view_djangocontenttype');
INSERT INTO `auth_permission` VALUES (69, 'Can add django migrations', 18, 'add_djangomigrations');
INSERT INTO `auth_permission` VALUES (70, 'Can change django migrations', 18, 'change_djangomigrations');
INSERT INTO `auth_permission` VALUES (71, 'Can delete django migrations', 18, 'delete_djangomigrations');
INSERT INTO `auth_permission` VALUES (72, 'Can view django migrations', 18, 'view_djangomigrations');
INSERT INTO `auth_permission` VALUES (73, 'Can add django session', 19, 'add_djangosession');
INSERT INTO `auth_permission` VALUES (74, 'Can change django session', 19, 'change_djangosession');
INSERT INTO `auth_permission` VALUES (75, 'Can delete django session', 19, 'delete_djangosession');
INSERT INTO `auth_permission` VALUES (76, 'Can view django session', 19, 'view_djangosession');
INSERT INTO `auth_permission` VALUES (77, 'Can add kembali mahasiswa', 20, 'add_kembalimahasiswa');
INSERT INTO `auth_permission` VALUES (78, 'Can change kembali mahasiswa', 20, 'change_kembalimahasiswa');
INSERT INTO `auth_permission` VALUES (79, 'Can delete kembali mahasiswa', 20, 'delete_kembalimahasiswa');
INSERT INTO `auth_permission` VALUES (80, 'Can view kembali mahasiswa', 20, 'view_kembalimahasiswa');
INSERT INTO `auth_permission` VALUES (81, 'Can add kembali non mahasiswa', 21, 'add_kembalinonmahasiswa');
INSERT INTO `auth_permission` VALUES (82, 'Can change kembali non mahasiswa', 21, 'change_kembalinonmahasiswa');
INSERT INTO `auth_permission` VALUES (83, 'Can delete kembali non mahasiswa', 21, 'delete_kembalinonmahasiswa');
INSERT INTO `auth_permission` VALUES (84, 'Can view kembali non mahasiswa', 21, 'view_kembalinonmahasiswa');
INSERT INTO `auth_permission` VALUES (85, 'Can add petugas', 22, 'add_petugas');
INSERT INTO `auth_permission` VALUES (86, 'Can change petugas', 22, 'change_petugas');
INSERT INTO `auth_permission` VALUES (87, 'Can delete petugas', 22, 'delete_petugas');
INSERT INTO `auth_permission` VALUES (88, 'Can view petugas', 22, 'view_petugas');
INSERT INTO `auth_permission` VALUES (89, 'Can add pinjam detail mahasiswa', 23, 'add_pinjamdetailmahasiswa');
INSERT INTO `auth_permission` VALUES (90, 'Can change pinjam detail mahasiswa', 23, 'change_pinjamdetailmahasiswa');
INSERT INTO `auth_permission` VALUES (91, 'Can delete pinjam detail mahasiswa', 23, 'delete_pinjamdetailmahasiswa');
INSERT INTO `auth_permission` VALUES (92, 'Can view pinjam detail mahasiswa', 23, 'view_pinjamdetailmahasiswa');
INSERT INTO `auth_permission` VALUES (93, 'Can add pinjam detail non mahasiswa', 24, 'add_pinjamdetailnonmahasiswa');
INSERT INTO `auth_permission` VALUES (94, 'Can change pinjam detail non mahasiswa', 24, 'change_pinjamdetailnonmahasiswa');
INSERT INTO `auth_permission` VALUES (95, 'Can delete pinjam detail non mahasiswa', 24, 'delete_pinjamdetailnonmahasiswa');
INSERT INTO `auth_permission` VALUES (96, 'Can view pinjam detail non mahasiswa', 24, 'view_pinjamdetailnonmahasiswa');
INSERT INTO `auth_permission` VALUES (97, 'Can add pinjam header mahasiswa', 25, 'add_pinjamheadermahasiswa');
INSERT INTO `auth_permission` VALUES (98, 'Can change pinjam header mahasiswa', 25, 'change_pinjamheadermahasiswa');
INSERT INTO `auth_permission` VALUES (99, 'Can delete pinjam header mahasiswa', 25, 'delete_pinjamheadermahasiswa');
INSERT INTO `auth_permission` VALUES (100, 'Can view pinjam header mahasiswa', 25, 'view_pinjamheadermahasiswa');
INSERT INTO `auth_permission` VALUES (101, 'Can add pinjam header non mahasiswa', 26, 'add_pinjamheadernonmahasiswa');
INSERT INTO `auth_permission` VALUES (102, 'Can change pinjam header non mahasiswa', 26, 'change_pinjamheadernonmahasiswa');
INSERT INTO `auth_permission` VALUES (103, 'Can delete pinjam header non mahasiswa', 26, 'delete_pinjamheadernonmahasiswa');
INSERT INTO `auth_permission` VALUES (104, 'Can view pinjam header non mahasiswa', 26, 'view_pinjamheadernonmahasiswa');
INSERT INTO `auth_permission` VALUES (105, 'Can add pinjam mahasiswa', 27, 'add_pinjammahasiswa');
INSERT INTO `auth_permission` VALUES (106, 'Can change pinjam mahasiswa', 27, 'change_pinjammahasiswa');
INSERT INTO `auth_permission` VALUES (107, 'Can delete pinjam mahasiswa', 27, 'delete_pinjammahasiswa');
INSERT INTO `auth_permission` VALUES (108, 'Can view pinjam mahasiswa', 27, 'view_pinjammahasiswa');
INSERT INTO `auth_permission` VALUES (109, 'Can add pinjam non mahasiswa', 28, 'add_pinjamnonmahasiswa');
INSERT INTO `auth_permission` VALUES (110, 'Can change pinjam non mahasiswa', 28, 'change_pinjamnonmahasiswa');
INSERT INTO `auth_permission` VALUES (111, 'Can delete pinjam non mahasiswa', 28, 'delete_pinjamnonmahasiswa');
INSERT INTO `auth_permission` VALUES (112, 'Can view pinjam non mahasiswa', 28, 'view_pinjamnonmahasiswa');
INSERT INTO `auth_permission` VALUES (113, 'Can add book', 29, 'add_book');
INSERT INTO `auth_permission` VALUES (114, 'Can change book', 29, 'change_book');
INSERT INTO `auth_permission` VALUES (115, 'Can delete book', 29, 'delete_book');
INSERT INTO `auth_permission` VALUES (116, 'Can view book', 29, 'view_book');
INSERT INTO `auth_permission` VALUES (117, 'Can add tes', 30, 'add_tes');
INSERT INTO `auth_permission` VALUES (118, 'Can change tes', 30, 'change_tes');
INSERT INTO `auth_permission` VALUES (119, 'Can delete tes', 30, 'delete_tes');
INSERT INTO `auth_permission` VALUES (120, 'Can view tes', 30, 'view_tes');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for buku
-- ----------------------------
DROP TABLE IF EXISTS `buku`;
CREATE TABLE `buku`  (
  `KodeBuku` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NoUDC` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NoReg` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Judul` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Penerbit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Pengarang` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ThnTerbit` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `KotaTerbit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Bahasa` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Edisi` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Deskripsi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Isbn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JumEkslempar` int NULL DEFAULT NULL,
  `SubyekUtama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SubyekTambahan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sampul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`KodeBuku`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of buku
-- ----------------------------
INSERT INTO `buku` VALUES ('b-123', NULL, NULL, 'Dilan', 'Md Production', 'Pidi Baiq', '2018', 'serang', 'Indonesia', '1', NULL, NULL, 7, NULL, NULL, '');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (7, 'myapp', 'anggotamahasiswa');
INSERT INTO `django_content_type` VALUES (8, 'myapp', 'anggotanonmahasiswa');
INSERT INTO `django_content_type` VALUES (9, 'myapp', 'authgroup');
INSERT INTO `django_content_type` VALUES (10, 'myapp', 'authgrouppermissions');
INSERT INTO `django_content_type` VALUES (11, 'myapp', 'authpermission');
INSERT INTO `django_content_type` VALUES (12, 'myapp', 'authuser');
INSERT INTO `django_content_type` VALUES (13, 'myapp', 'authusergroups');
INSERT INTO `django_content_type` VALUES (14, 'myapp', 'authuseruserpermissions');
INSERT INTO `django_content_type` VALUES (29, 'myapp', 'book');
INSERT INTO `django_content_type` VALUES (15, 'myapp', 'buku');
INSERT INTO `django_content_type` VALUES (16, 'myapp', 'djangoadminlog');
INSERT INTO `django_content_type` VALUES (17, 'myapp', 'djangocontenttype');
INSERT INTO `django_content_type` VALUES (18, 'myapp', 'djangomigrations');
INSERT INTO `django_content_type` VALUES (19, 'myapp', 'djangosession');
INSERT INTO `django_content_type` VALUES (20, 'myapp', 'kembalimahasiswa');
INSERT INTO `django_content_type` VALUES (21, 'myapp', 'kembalinonmahasiswa');
INSERT INTO `django_content_type` VALUES (22, 'myapp', 'petugas');
INSERT INTO `django_content_type` VALUES (23, 'myapp', 'pinjamdetailmahasiswa');
INSERT INTO `django_content_type` VALUES (24, 'myapp', 'pinjamdetailnonmahasiswa');
INSERT INTO `django_content_type` VALUES (25, 'myapp', 'pinjamheadermahasiswa');
INSERT INTO `django_content_type` VALUES (26, 'myapp', 'pinjamheadernonmahasiswa');
INSERT INTO `django_content_type` VALUES (27, 'myapp', 'pinjammahasiswa');
INSERT INTO `django_content_type` VALUES (28, 'myapp', 'pinjamnonmahasiswa');
INSERT INTO `django_content_type` VALUES (30, 'myapp', 'tes');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2022-06-10 14:36:23.825916');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2022-06-10 14:36:34.787581');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2022-06-10 14:36:36.808765');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2022-06-10 14:36:36.878847');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2022-06-10 14:36:36.946751');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2022-06-10 14:36:37.790407');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2022-06-10 14:36:39.471045');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2022-06-10 14:36:39.681304');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2022-06-10 14:36:39.753829');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2022-06-10 14:36:41.072126');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2022-06-10 14:36:41.115745');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2022-06-10 14:36:41.184058');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2022-06-10 14:36:41.367623');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2022-06-10 14:36:41.531546');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2022-06-10 14:36:41.748013');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2022-06-10 14:36:41.843083');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2022-06-10 14:36:42.002070');
INSERT INTO `django_migrations` VALUES (18, 'myapp', '0001_initial', '2022-06-10 14:36:42.498386');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2022-06-10 14:36:43.412353');
INSERT INTO `django_migrations` VALUES (20, 'myapp', '0002_tes', '2022-06-11 00:09:58.640609');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for kembali_mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `kembali_mahasiswa`;
CREATE TABLE `kembali_mahasiswa`  (
  `NoKembaliM` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NoPinjamM` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TglKembali` date NOT NULL,
  `KodePetugas` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Denda` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`NoKembaliM`) USING BTREE,
  INDEX `nopnn`(`NoPinjamM`) USING BTREE,
  CONSTRAINT `kembali_mahasiswa_ibfk_1` FOREIGN KEY (`NoPinjamM`) REFERENCES `pinjam_header_mahasiswa` (`NopinjamM`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kembali_mahasiswa
-- ----------------------------

-- ----------------------------
-- Table structure for kembali_non_mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `kembali_non_mahasiswa`;
CREATE TABLE `kembali_non_mahasiswa`  (
  `NoKembaliN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NoPinjamN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TglKembali` date NOT NULL,
  `KodePetugas` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Denda` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`NoKembaliN`) USING BTREE,
  INDEX `nopin`(`NoPinjamN`) USING BTREE,
  CONSTRAINT `kembali_non_mahasiswa_ibfk_1` FOREIGN KEY (`NoPinjamN`) REFERENCES `pinjam_header_non_mahasiswa` (`NopinjamN`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kembali_non_mahasiswa
-- ----------------------------
INSERT INTO `kembali_non_mahasiswa` VALUES ('12345', '12345', '2022-06-13', '', '10000');

-- ----------------------------
-- Table structure for myapp_book
-- ----------------------------
DROP TABLE IF EXISTS `myapp_book`;
CREATE TABLE `myapp_book`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pdf` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myapp_book
-- ----------------------------

-- ----------------------------
-- Table structure for myapp_tes
-- ----------------------------
DROP TABLE IF EXISTS `myapp_tes`;
CREATE TABLE `myapp_tes`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pengarang` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gambar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myapp_tes
-- ----------------------------

-- ----------------------------
-- Table structure for petugas
-- ----------------------------
DROP TABLE IF EXISTS `petugas`;
CREATE TABLE `petugas`  (
  `KodePetugas` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Jabatan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HakAkses` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`KodePetugas`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of petugas
-- ----------------------------
INSERT INTO `petugas` VALUES ('234', 'jamal', 'petugas', 'admin', '123456');
INSERT INTO `petugas` VALUES ('p-01', '', '', '', '');
INSERT INTO `petugas` VALUES ('p-02', '', '', '', '');
INSERT INTO `petugas` VALUES ('p-03', '', '', '', '');

-- ----------------------------
-- Table structure for pinjam_detail_mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `pinjam_detail_mahasiswa`;
CREATE TABLE `pinjam_detail_mahasiswa`  (
  `NopinjamM` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KodeBuku` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Judul` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Penerbit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ThnTerbit` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Jml` int NOT NULL,
  `pengarang` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Jml`) USING BTREE,
  INDEX `nopinjamm`(`NopinjamM`) USING BTREE,
  INDEX `kdbuku`(`KodeBuku`) USING BTREE,
  CONSTRAINT `pinjam_detail_mahasiswa_ibfk_1` FOREIGN KEY (`KodeBuku`) REFERENCES `buku` (`KodeBuku`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pinjam_detail_mahasiswa_ibfk_2` FOREIGN KEY (`NopinjamM`) REFERENCES `pinjam_header_mahasiswa` (`NopinjamM`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pinjam_detail_mahasiswa
-- ----------------------------
INSERT INTO `pinjam_detail_mahasiswa` VALUES (NULL, 'b-123', 'Tiger and Fish', 'gak tau', NULL, 1, 'aku');

-- ----------------------------
-- Table structure for pinjam_detail_non_mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `pinjam_detail_non_mahasiswa`;
CREATE TABLE `pinjam_detail_non_mahasiswa`  (
  `NoPinjamN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KodeBuku` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Judul` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Penerbit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ThnTerbit` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Jml` int NOT NULL,
  `pengarang` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  INDEX `nopinn`(`NoPinjamN`) USING BTREE,
  INDEX `kdpet`(`KodeBuku`) USING BTREE,
  CONSTRAINT `pinjam_detail_non_mahasiswa_ibfk_1` FOREIGN KEY (`KodeBuku`) REFERENCES `buku` (`KodeBuku`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pinjam_detail_non_mahasiswa_ibfk_2` FOREIGN KEY (`NoPinjamN`) REFERENCES `pinjam_header_non_mahasiswa` (`NopinjamN`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pinjam_detail_non_mahasiswa
-- ----------------------------
INSERT INTO `pinjam_detail_non_mahasiswa` VALUES (NULL, 'b-123', 'Tiger and Fish', 'aku sendiri', NULL, 1, 'aku');

-- ----------------------------
-- Table structure for pinjam_header_mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `pinjam_header_mahasiswa`;
CREATE TABLE `pinjam_header_mahasiswa`  (
  `NopinjamM` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TglPinjam` date NOT NULL,
  `TglKembali` date NOT NULL,
  `NoAnggotaM` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `KodePetugas` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`NopinjamM`) USING BTREE,
  INDEX `noanggotam`(`NoAnggotaM`) USING BTREE,
  INDEX `kdpetugs`(`KodePetugas`) USING BTREE,
  CONSTRAINT `pinjam_header_mahasiswa_ibfk_1` FOREIGN KEY (`KodePetugas`) REFERENCES `petugas` (`KodePetugas`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pinjam_header_mahasiswa_ibfk_2` FOREIGN KEY (`NoAnggotaM`) REFERENCES `anggota_mahasiswa` (`NoAnggotaM`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pinjam_header_mahasiswa
-- ----------------------------
INSERT INTO `pinjam_header_mahasiswa` VALUES ('12', '2022-06-03', '2022-06-04', 'm-01', 'p-02');

-- ----------------------------
-- Table structure for pinjam_header_non_mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `pinjam_header_non_mahasiswa`;
CREATE TABLE `pinjam_header_non_mahasiswa`  (
  `NopinjamN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TglPinjam` date NOT NULL,
  `TglKembali` date NOT NULL,
  `NoAnggotaN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `KodePetugas` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`NopinjamN`) USING BTREE,
  INDEX `noanggotam`(`NoAnggotaN`) USING BTREE,
  INDEX `kdpetugs`(`KodePetugas`) USING BTREE,
  CONSTRAINT `noanggotan` FOREIGN KEY (`NoAnggotaN`) REFERENCES `anggota_non_mahasiswa` (`NoAnggotaN`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pinjam_header_non_mahasiswa_ibfk_1` FOREIGN KEY (`KodePetugas`) REFERENCES `petugas` (`KodePetugas`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pinjam_header_non_mahasiswa
-- ----------------------------
INSERT INTO `pinjam_header_non_mahasiswa` VALUES ('12345', '2022-06-02', '2022-06-11', 'n-01', 'p-01');

-- ----------------------------
-- Table structure for pinjam_mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `pinjam_mahasiswa`;
CREATE TABLE `pinjam_mahasiswa`  (
  `NoPinjamM` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `KodeBuku` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Judul` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Penerbit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ThnTerbit` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Jml` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NoAnggotaM` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TglPinjam` date NOT NULL,
  `TglKembali` date NOT NULL,
  `kodepetugas` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pengarang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`NoPinjamM`) USING BTREE,
  INDEX `noanggotam`(`NoAnggotaM`) USING BTREE,
  INDEX `kdpet`(`kodepetugas`) USING BTREE,
  INDEX `kadebuk`(`KodeBuku`) USING BTREE,
  CONSTRAINT `kadebuk` FOREIGN KEY (`KodeBuku`) REFERENCES `buku` (`KodeBuku`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `kdpet` FOREIGN KEY (`kodepetugas`) REFERENCES `petugas` (`KodePetugas`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `noanggotam` FOREIGN KEY (`NoAnggotaM`) REFERENCES `anggota_mahasiswa` (`NoAnggotaM`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pinjam_mahasiswa
-- ----------------------------

-- ----------------------------
-- Table structure for pinjam_non_mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `pinjam_non_mahasiswa`;
CREATE TABLE `pinjam_non_mahasiswa`  (
  `NoPinjamN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `KodeBuku` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Judul` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Penerbit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ThnTerbit` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Jml` int NOT NULL,
  `NoAnggotaN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TglPinjam` date NOT NULL,
  `TglKembali` date NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pinjam_non_mahasiswa
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
