-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 15, 2024 at 05:25 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adadisshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id_admin` int NOT NULL,
  `ten_dang_nhap` varchar(50) NOT NULL,
  `mat_khau` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `ngay_tao_tai_khoan` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `vai_tro` enum('user','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `binh_luans`
--

CREATE TABLE `binh_luans` (
  `id` int NOT NULL,
  `san_pham_id` int NOT NULL,
  `tai_khoan_id` int NOT NULL,
  `noi_dung` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `ngay_dang` date NOT NULL,
  `trang_thai` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `binh_luans`
--

INSERT INTO `binh_luans` (`id`, `san_pham_id`, `tai_khoan_id`, `noi_dung`, `ngay_dang`, `trang_thai`) VALUES
(2, 23, 2, 'Ship hỏa tốc k shop', '2024-11-14', 1),
(3, 23, 2, 'Sản phẩm đẹp quá', '2024-11-12', 1),
(4, 21, 1, 'Đẹp quáaaaaaaaaaaaaaaa', '2024-11-12', 1),
(5, 21, 2, 'Quá tuyệt vời', '2024-11-11', 2);

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_don_hangs`
--

CREATE TABLE `chi_tiet_don_hangs` (
  `id_chi_tiet_don_hang` int NOT NULL,
  `id_don_hang` int DEFAULT NULL,
  `id_san_pham` int DEFAULT NULL,
  `so_luong` int DEFAULT NULL,
  `gia` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_san_phams`
--

CREATE TABLE `chi_tiet_san_phams` (
  `id_chi_tiet_san_pham` int NOT NULL,
  `id_san_pham` int DEFAULT NULL,
  `mau_sac` varchar(50) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `chat_lieu_san_pham` varchar(100) DEFAULT NULL,
  `so_luong` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `danh_gia_san_phams`
--

CREATE TABLE `danh_gia_san_phams` (
  `id` int NOT NULL,
  `san_pham_id` int NOT NULL,
  `tai_khoan_id` int NOT NULL,
  `diem_danh_gia` int DEFAULT NULL,
  `noi_dung` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ngay_danh_gia` date DEFAULT NULL,
  `trang_thai` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `danh_gia_san_phams`
--

INSERT INTO `danh_gia_san_phams` (`id`, `san_pham_id`, `tai_khoan_id`, `diem_danh_gia`, `noi_dung`, `ngay_danh_gia`, `trang_thai`) VALUES
(1, 23, 1, 5, 'Sản phẩm tuyệt vời ok', '2024-11-13', 1),
(2, 23, 2, 4, 'sản phẩm khá tuyệt', '2024-11-05', 2);

-- --------------------------------------------------------

--
-- Table structure for table `danh_muc_banners`
--

CREATE TABLE `danh_muc_banners` (
  `id` int NOT NULL,
  `ten_danh_muc_banner` varchar(255) DEFAULT NULL,
  `link_hinh_anh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ngay_tao` date DEFAULT NULL,
  `trang_thai` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `danh_muc_banners`
--

INSERT INTO `danh_muc_banners` (`id`, `ten_danh_muc_banner`, `link_hinh_anh`, `ngay_tao`, `trang_thai`) VALUES
(10, 'giày đá bóng', './uploads/17315264843252b521-ea3b-40f9-8061-44577633f2ea.jpg', '2024-11-06', 1),
(13, 'giày thượng đình', './uploads/1731605281giay2.jpg', '2024-11-07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `danh_muc_san_phams`
--

CREATE TABLE `danh_muc_san_phams` (
  `id` int NOT NULL,
  `ten_danh_muc` varchar(50) DEFAULT NULL,
  `mo_ta` text,
  `trang_thai` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `danh_muc_san_phams`
--

INSERT INTO `danh_muc_san_phams` (`id`, `ten_danh_muc`, `mo_ta`, `trang_thai`) VALUES
(1, 'Giày Nam', NULL, 1),
(2, 'Giày Nữ 2', '', 1),
(3, 'Giày Thể Thao', '', 1),
(4, 'Giày Vải', NULL, 0),
(5, 'AAAAAAAAAAAAAA', 'đẹp123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dia_chis`
--

CREATE TABLE `dia_chis` (
  `id_dia_chi` int NOT NULL,
  `id_nguoi_dung` int DEFAULT NULL,
  `dia_chi1` varchar(255) DEFAULT NULL,
  `dia_chi2` varchar(255) DEFAULT NULL,
  `thanh_pho` varchar(100) DEFAULT NULL,
  `quan_huyen` varchar(100) DEFAULT NULL,
  `xa_phuong` varchar(100) DEFAULT NULL,
  `quoc_gia` varchar(100) DEFAULT NULL,
  `dia_chi_mac_dinh` tinyint(1) DEFAULT NULL,
  `dia_chi_thanh_toan_mac_dinh` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `don_hangs`
--

CREATE TABLE `don_hangs` (
  `id_don_hang` int NOT NULL,
  `id_nguoi_dung` int DEFAULT NULL,
  `id_ma_van_chuyen` int DEFAULT NULL,
  `ngay_dat_hang` timestamp NULL DEFAULT NULL,
  `tong_tien` decimal(10,2) DEFAULT NULL,
  `dia_chi_giao_hang` text,
  `tong_tien_don_hang` decimal(10,2) DEFAULT NULL,
  `phuong_thuc_thanh_toan` enum('COD','ON') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phi_van_chuyen` decimal(10,2) DEFAULT NULL,
  `trang_thai_don_hang` int NOT NULL,
  `trang_thai_thanh_toan` enum('Đã thanh toán','Chưa thanh toán') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `don_hangs`
--

INSERT INTO `don_hangs` (`id_don_hang`, `id_nguoi_dung`, `id_ma_van_chuyen`, `ngay_dat_hang`, `tong_tien`, `dia_chi_giao_hang`, `tong_tien_don_hang`, `phuong_thuc_thanh_toan`, `phi_van_chuyen`, `trang_thai_don_hang`, `trang_thai_thanh_toan`) VALUES
(1, 2, 34, '2024-11-14 10:06:25', '435345.00', 'hà nội', '674263.00', 'COD', '234234.00', 15, 'Đã thanh toán'),
(2, 1, 1, '2024-11-22 10:14:35', '20000.00', 'dcdscvxz', '120000.00', 'COD', '30000.00', 15, 'Đã thanh toán');

-- --------------------------------------------------------

--
-- Table structure for table `gio_hangs`
--

CREATE TABLE `gio_hangs` (
  `id` int NOT NULL,
  `id_nguoi_dung` int DEFAULT NULL,
  `id_san_pham` int DEFAULT NULL,
  `ten_san_pham` varchar(255) DEFAULT NULL,
  `so_luong` int DEFAULT NULL,
  `gia_tien` decimal(10,2) DEFAULT NULL,
  `khuyen_mai` varchar(50) DEFAULT NULL,
  `phi_van_chuyen` int DEFAULT NULL,
  `trang_thai` int DEFAULT NULL,
  `ngay_tao` date DEFAULT NULL,
  `ghi_chu` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hinh_anh_san_phams`
--

CREATE TABLE `hinh_anh_san_phams` (
  `id` int NOT NULL,
  `san_pham_id` int DEFAULT NULL,
  `link_hinh_anh` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hinh_anh_san_phams`
--

INSERT INTO `hinh_anh_san_phams` (`id`, `san_pham_id`, `link_hinh_anh`) VALUES
(119, 23, './uploads/173159610811_pix1.jpg'),
(120, 23, './uploads/17315961083252b521-ea3b-40f9-8061-44577633f2ea.jpg'),
(121, 23, './uploads/1731596108bootstrap.jpg'),
(122, 23, './uploads/173159610812-pro-kingkongtran-van-khoa.jpg'),
(123, 1, './uploads/173160170012-pro-kingkongtran-van-khoa.jpg'),
(124, 1, './uploads/17316017003252b521-ea3b-40f9-8061-44577633f2ea.jpg'),
(125, 1, './uploads/1731601700anhsilde1.png'),
(126, 1, './uploads/1731601700anhsilde2.png'),
(127, 25, './uploads/1731602293anhsilde2.png'),
(128, 25, './uploads/1731602293anhsilde3.png'),
(129, 25, './uploads/1731602293anhsilde1.png'),
(130, 25, './uploads/1731602293anhsilde4.png'),
(131, 1, './uploads/173160328012-pro-kingkongtran-van-khoa.jpg'),
(132, 1, './uploads/17316032803252b521-ea3b-40f9-8061-44577633f2ea.jpg'),
(133, 1, './uploads/1731603280anhsilde1.png'),
(134, 1, './uploads/1731603280anhsilde2.png'),
(135, 26, './uploads/1731606775hieu-ve-UI-Ux.png'),
(136, 26, './uploads/1731606775anhsilde1.png'),
(137, 26, './uploads/17316067753252b521-ea3b-40f9-8061-44577633f2ea.jpg'),
(140, 21, './uploads/173166424011_pix1.jpg'),
(141, 21, './uploads/173166549712-pro-kingkongtran-van-khoa - Copy.jpg'),
(142, 23, './uploads/17316661244.jpg'),
(143, 23, './uploads/1731666152laragon.jpg'),
(144, 23, './uploads/1731666203anhsilde2.png'),
(145, 23, './uploads/1731666203hi.jpg'),
(146, 23, './uploads/1731666203hinh-anh-ve-do-an-25.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `khuyen_mais`
--

CREATE TABLE `khuyen_mais` (
  `id` int NOT NULL,
  `ma_khuyen_mai` varchar(50) DEFAULT NULL,
  `mo_ta` text,
  `ngay_bat_dau` datetime DEFAULT NULL,
  `ngay_ket_thuc` datetime DEFAULT NULL,
  `trang_thai` tinyint(1) DEFAULT NULL,
  `ten_khuyen_mai` varchar(255) NOT NULL,
  `gia_tri` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `khuyen_mais`
--

INSERT INTO `khuyen_mais` (`id`, `ma_khuyen_mai`, `mo_ta`, `ngay_bat_dau`, `ngay_ket_thuc`, `trang_thai`, `ten_khuyen_mai`, `gia_tri`) VALUES
(1, '345', 'đẹp123', '2024-11-07 20:13:00', '2024-11-13 20:13:00', 1, 'giày', 34),
(2, '345', 'đẹp123', '2024-11-07 20:13:00', '2024-11-13 20:13:00', 1, 'giày', 34);

-- --------------------------------------------------------

--
-- Table structure for table `lien_hes`
--

CREATE TABLE `lien_hes` (
  `id` int NOT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `so_dien_thoai` varchar(12) DEFAULT NULL,
  `noi_dung` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ngay_tao` timestamp NULL DEFAULT NULL,
  `trang_thai` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lien_hes`
--

INSERT INTO `lien_hes` (`id`, `ten`, `email`, `so_dien_thoai`, `noi_dung`, `ngay_tao`, `trang_thai`) VALUES
(4, 'Trần Văn Khoa', 'khoatvph51572@gmail.com', '028349234324', '<p>Tuần trước, Kiệt mời cả nhóm 5 người đi ăn nhà hàng. Chúng tôi thầm biết cậu ta lại mua được thứ gì ngon nghẻ nên muốn khoe thôi. Quả nhiên đúng như tôi nghĩ, Kiệt lái chiếc xe ô tô đen bóng loáng, đỗ xịch trước mắt chúng tôi. Cậu ta nham nhở cười, khoe mới mua xe nên muốn \"ra mắt vợ nhỏ\" với mọi người.</p><p><a href=\"https://kenh14cdn.com/203336854389633024/2024/11/13/aughing-enjoying-meal-while-sitting-dining-table-together-house-celebration-holiday-togetherness7861-2650-17313950019721294758610-1731469594647-1731469595274579369374.jpg\"><img src=\"https://kenh14cdn.com/203336854389633024/2024/11/13/aughing-enjoying-meal-while-sitting-dining-table-together-house-celebration-holiday-togetherness7861-2650-17313950019721294758610-1731469594647-1731469595274579369374.jpg\" alt=\"Bạn thân khoe lương trăm triệu/tháng, có xe ô tô bạc tỷ, tôi chỉ nhẹ nhàng kéo tay áo, để lộ một thứ nho nhỏ mà bạn cứng họng- Ảnh 1.\"></a></p><p><i>Ảnh minh họa</i></p><p>&nbsp;</p><p>Suốt bữa ăn, Kiệt cứ luyên thuyên chuyện mình mua xe khó khăn thế nào. \"Có tiền chưa chắc đã mua được chiếc xe ưng ý nhé? Phải chịu khó tìm từ salon này đến salon khác. Mình bỏ ra tiền tỷ thì phải chọn được chiếc nào mình hài lòng nhất chứ?\". Rồi Kiệt còn khoe lương mình cả trăm triệu/tháng nên mua xe để đi tiếp khách hàng.</p><p>Tôi thừa biết Kiệt đang làm ở một công ty nhỏ, lương lấy đâu ra trăm triệu? Bạn tôi là sếp của Kiệt mà lương chưa tới 40 triệu. Cậu ta là nhân viên bình thường, được 20 triệu là cao.</p><p>Tôi còn biết chuyện Kiệt bán nửa mảnh đất mẹ cho để mua xe cho oai, để lòe thiên hạ. Lối sống phông bạt của cậu ta, tôi quá hiểu rồi. Tôi chỉ thương cho mẹ cậu ta, có mảnh đất để cho con trai, thế mà gặp ngay cậu con trai \"báo\".</p><p>Trong lúc Kiệt khoe tung bay, tôi nhẹ nhàng kéo tay áo, để lộ cái đồng hồ đang đeo. Một cậu bạn khác thấy đồng hồ của tôi thì hét lên: \"Đồng hồ đẹp thế, chắc phải tiền tỷ nhỉ\".</p><p>Tôi nhẹ nhàng gật đầu: \"Có 2 tỷ thôi, không đáng nói tới đâu. Làm sao tôi giàu bằng Kiệt được nên cũng không dám khoe khoang\".</p><p>Tôi vừa nói thế, mấy người bạn đã mỉm cười nhìn nhau. Kiệt cũng hiểu ra vấn đề nên im bặt. Tôi lấy lý do có công việc gấp để về trước, không quên để lại 5 triệu tiền bữa ăn.</p><p>Tối đó, Kiệt nhắn tin trách tôi làm cậu ta mất mặt. Cậu ta nói năng nặng lời khiến tôi khó chịu vô cùng. Với người như Kiệt, tôi có nên hủy kết giao luôn không?</p>', '2024-11-01 16:18:00', 1),
(5, 'Trần Văn Khoa', 'khoatvph51572@gmail.com', '028349234324', '<p>Tuần trước, Kiệt mời cả nhóm 5 người đi ăn nhà hàng. Chúng tôi thầm biết cậu ta lại mua được thứ gì ngon nghẻ nên muốn khoe thôi. Quả nhiên đúng như tôi nghĩ, Kiệt lái chiếc xe ô tô đen bóng loáng, đỗ xịch trước mắt chúng tôi. Cậu ta nham nhở cười, khoe mới mua xe nên muốn \"ra mắt vợ nhỏ\" với mọi người.</p><p><a href=\"https://kenh14cdn.com/203336854389633024/2024/11/13/aughing-enjoying-meal-while-sitting-dining-table-together-house-celebration-holiday-togetherness7861-2650-17313950019721294758610-1731469594647-1731469595274579369374.jpg\"><img src=\"https://kenh14cdn.com/203336854389633024/2024/11/13/aughing-enjoying-meal-while-sitting-dining-table-together-house-celebration-holiday-togetherness7861-2650-17313950019721294758610-1731469594647-1731469595274579369374.jpg\" alt=\"Bạn thân khoe lương trăm triệu/tháng, có xe ô tô bạc tỷ, tôi chỉ nhẹ nhàng kéo tay áo, để lộ một thứ nho nhỏ mà bạn cứng họng- Ảnh 1.\"></a></p><p><i>Ảnh minh họa</i></p><p>&nbsp;</p><p>Suốt bữa ăn, Kiệt cứ luyên thuyên chuyện mình mua xe khó khăn thế nào. \"Có tiền chưa chắc đã mua được chiếc xe ưng ý nhé? Phải chịu khó tìm từ salon này đến salon khác. Mình bỏ ra tiền tỷ thì phải chọn được chiếc nào mình hài lòng nhất chứ?\". Rồi Kiệt còn khoe lương mình cả trăm triệu/tháng nên mua xe để đi tiếp khách hàng.</p><p>Tôi thừa biết Kiệt đang làm ở một công ty nhỏ, lương lấy đâu ra trăm triệu? Bạn tôi là sếp của Kiệt mà lương chưa tới 40 triệu. Cậu ta là nhân viên bình thường, được 20 triệu là cao.</p><p>Tôi còn biết chuyện Kiệt bán nửa mảnh đất mẹ cho để mua xe cho oai, để lòe thiên hạ. Lối sống phông bạt của cậu ta, tôi quá hiểu rồi. Tôi chỉ thương cho mẹ cậu ta, có mảnh đất để cho con trai, thế mà gặp ngay cậu con trai \"báo\".</p><p>Trong lúc Kiệt khoe tung bay, tôi nhẹ nhàng kéo tay áo, để lộ cái đồng hồ đang đeo. Một cậu bạn khác thấy đồng hồ của tôi thì hét lên: \"Đồng hồ đẹp thế, chắc phải tiền tỷ nhỉ\".</p><p>Tôi nhẹ nhàng gật đầu: \"Có 2 tỷ thôi, không đáng nói tới đâu. Làm sao tôi giàu bằng Kiệt được nên cũng không dám khoe khoang\".</p><p>Tôi vừa nói thế, mấy người bạn đã mỉm cười nhìn nhau. Kiệt cũng hiểu ra vấn đề nên im bặt. Tôi lấy lý do có công việc gấp để về trước, không quên để lại 5 triệu tiền bữa ăn.</p><p>Tối đó, Kiệt nhắn tin trách tôi làm cậu ta mất mặt. Cậu ta nói năng nặng lời khiến tôi khó chịu vô cùng. Với người như Kiệt, tôi có nên hủy kết giao luôn không?</p>', '2024-11-14 16:19:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nguoi_dungs`
--

CREATE TABLE `nguoi_dungs` (
  `id` int NOT NULL,
  `ten_nguoi_dung` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `sdt` varchar(15) DEFAULT NULL,
  `dia_chi` varchar(255) DEFAULT NULL,
  `mat_khau` varchar(255) NOT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `gioi_tinh` enum('Nam','Nu') NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `vai_tro` enum('Admin','User') DEFAULT 'User',
  `trang_thai` enum('Hoat_dong','Khoa','Tam_ngung') DEFAULT 'Hoat_dong'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nguoi_dungs`
--

INSERT INTO `nguoi_dungs` (`id`, `ten_nguoi_dung`, `email`, `sdt`, `dia_chi`, `mat_khau`, `ngay_sinh`, `gioi_tinh`, `avatar`, `vai_tro`, `trang_thai`) VALUES
(1, 'trần văn khoa', 'khoatvph51572@gmail.com', '089955340', 'hà nội', '$2y$10$t.2.ZoeMe0FhoU9sYR2MVOPXQ5BQCxHfzTgHE3Yw68vDL4Gvfgn1m', '2024-11-13', 'Nu', 'uploads/11_pix1.jpg', 'User', 'Hoat_dong'),
(2, 'hoàng văn a', 'vkhoa6642@gmail.com', '0819238233', 'hà nội', '$2y$10$aKM.bqLy.CD5TxtlaXPe2uE0ayPINQ9lXRxB1zgCT1taawMvgrNCi', '2003-06-14', 'Nam', 'uploads/z5814216678424_883611d923ab825e2c9813311b41f7b0.jpg', 'User', 'Hoat_dong');

-- --------------------------------------------------------

--
-- Table structure for table `noi_dungs`
--

CREATE TABLE `noi_dungs` (
  `noi_dung_id` int NOT NULL,
  `tieu_de` varchar(255) DEFAULT NULL,
  `noi_dung` text,
  `duong_dan_anh` varchar(255) DEFAULT NULL,
  `ngay_tao` timestamp NULL DEFAULT NULL,
  `banner_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `san_phams`
--

CREATE TABLE `san_phams` (
  `id` int NOT NULL,
  `ten_san_pham` varchar(100) DEFAULT NULL,
  `danh_muc_id` int DEFAULT NULL,
  `mo_ta_dai` text,
  `mo_ta_ngan` text,
  `gia_nhap` decimal(10,2) DEFAULT NULL,
  `gia_ban` decimal(10,2) NOT NULL,
  `gia_khuyen_mai` decimal(10,2) DEFAULT NULL,
  `so_luong` int DEFAULT NULL,
  `trang_thai` tinyint(1) DEFAULT NULL,
  `hinh_anh` varchar(255) DEFAULT NULL,
  `ngay_nhap` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `san_phams`
--

INSERT INTO `san_phams` (`id`, `ten_san_pham`, `danh_muc_id`, `mo_ta_dai`, `mo_ta_ngan`, `gia_nhap`, `gia_ban`, `gia_khuyen_mai`, `so_luong`, `trang_thai`, `hinh_anh`, `ngay_nhap`) VALUES
(17, 'giày thượng đình1234', 3, 'fdsccccccccccc', 'dscdsssssssssss', '23444444.00', '34444444.00', '234444.00', 23333, 1, './uploads/1731594452bootstrap.jpg', '2023-03-04'),
(21, 'giày thượng đình1234', 5, 'quá tuyệt vời\"', 'trời ơi\"', '150000.00', '200000.00', '20000.00', 30, 1, './uploads/1731664251giay1.jpg', '2024-11-06'),
(23, 'giày bata', 3, 'Là một trong những mẫu giày chính hãng do công ty Goya sản xuất và phân phối. Có kiểu dáng rất hiện đại trẻ trung, phù hợp đi chơi, dã ngoại, hoạt động thể dục cho những tín đồ đam mê phong cách thể thao năng động \r\n\r\n- Đế: Cao su cao cấp nguyên khối: Siêu nhẹ, đàn hồi cực tốt, êm chân, chắc chắn\r\n\r\n- Chất liệu: Vải dệt lưới thông hơi thoáng khí đi rất thoải mái\r\n\r\n- Form dáng thời trang, ôm khít chân\r\n\r\n- Chiều cao: 3cm \r\n\r\n- Màu sắc: nhiều màu\r\n\r\n- Kiểu dáng: Sneaker, giày thể thao năng động\r\n\r\n- Chất lượng: Goya bảo cam kết bảo hành 365 ngày\r\n\r\n', 'trời ơi\"\"\"', '150000.00', '200000.00', '20000.00', 50, 1, './uploads/1731595642anhsilde2.png', '2024-11-11'),
(24, 'giày thượng đình1234', 3, 'dfhdshfhjdsfhdsf', 'fhsdfhhdsfdsf', '2000000.00', '2344555.00', '435455.00', 345, 1, './uploads/1731595205chophuquoc.jpg', '2024-11-13'),
(25, 'giày bata', 3, '45435435\"\"', 'sdfasdfsdf\"\"', '3453453.00', '4353455.00', '3453455.00', 345, 1, './uploads/173160226812-pro-kingkongtran-van-khoa - Copy.jpg', '2024-11-06'),
(26, 'giày bata', 3, 'adhsdhfhsdhfsdf\"', 'àdafdaf\"', '3452345.00', '4354354.00', '2345345.00', 344, 1, './uploads/1731603280elseifdenchet.jpg', '2024-11-13');

-- --------------------------------------------------------

--
-- Table structure for table `tai_khoans`
--

CREATE TABLE `tai_khoans` (
  `id` int NOT NULL,
  `ho_ten` varchar(50) DEFAULT NULL,
  `anh_dai_dien` varchar(255) DEFAULT NULL,
  `ngay_sinh` datetime DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `so_dien_thoai` varchar(15) DEFAULT NULL,
  `gioi_tinh` tinyint(1) DEFAULT NULL,
  `dia_chi` varchar(255) DEFAULT NULL,
  `mat_khau` varchar(255) DEFAULT NULL,
  `chuc_vu_id` int DEFAULT NULL,
  `trang_thai` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `thanh_toans`
--

CREATE TABLE `thanh_toans` (
  `id_thanh_toan` int NOT NULL,
  `id_don_hang` int DEFAULT NULL,
  `phuong_thuc_thanh_toan` enum('credit_card','paypal','cash_on_delivery') DEFAULT NULL,
  `so_tien_da_thanh_toan` decimal(10,2) DEFAULT NULL,
  `ngay_thanh_toan` timestamp NULL DEFAULT NULL,
  `trang_thai_thanh_toan` enum('paid','unpaid','pending') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tin_tucs`
--

CREATE TABLE `tin_tucs` (
  `tin_tuc_id` int NOT NULL,
  `tieu_de` varchar(255) NOT NULL,
  `noi_dung` text NOT NULL,
  `ngay_xuat_ban` date DEFAULT NULL,
  `hinh_anh` text,
  `trang_thai` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tin_tucs`
--

INSERT INTO `tin_tucs` (`tin_tuc_id`, `tieu_de`, `noi_dung`, `ngay_xuat_ban`, `hinh_anh`, `trang_thai`) VALUES
(1, 'dfsdf', 'dhhjhjhjsdfhsdf', '2024-11-07', 'uploads/12-pro-kingkongtran-van-khoa.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `trang_thai_don_hangs`
--

CREATE TABLE `trang_thai_don_hangs` (
  `id` int NOT NULL,
  `trang_thai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '''Chờ xác nhận'',''Đã xác nhận,''''Đang vận chuyển'',''Đã giao hàng'',''Giao hàng thất bại'',''Đã hủy'''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `trang_thai_don_hangs`
--

INSERT INTO `trang_thai_don_hangs` (`id`, `trang_thai`) VALUES
(1, 'Chờ xác nhận'),
(2, 'Đã giao hàng');

-- --------------------------------------------------------

--
-- Table structure for table `van_chuyen`
--

CREATE TABLE `van_chuyen` (
  `id_ma_van_chuyen` int NOT NULL,
  `phuong_thuc_van_chuyen` varchar(50) DEFAULT NULL,
  `phi_van_chuyen` decimal(10,2) DEFAULT NULL,
  `ngay_du_kien_giao_hang` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `binh_luans`
--
ALTER TABLE `binh_luans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chi_tiet_don_hangs`
--
ALTER TABLE `chi_tiet_don_hangs`
  ADD PRIMARY KEY (`id_chi_tiet_don_hang`),
  ADD KEY `id_don_hang` (`id_don_hang`),
  ADD KEY `fk_chi_tiet_don_hangs_san_phams` (`id_san_pham`);

--
-- Indexes for table `chi_tiet_san_phams`
--
ALTER TABLE `chi_tiet_san_phams`
  ADD PRIMARY KEY (`id_chi_tiet_san_pham`),
  ADD KEY `fk_chi_tiet_san_phams_san_phams` (`id_san_pham`);

--
-- Indexes for table `danh_gia_san_phams`
--
ALTER TABLE `danh_gia_san_phams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `danh_muc_banners`
--
ALTER TABLE `danh_muc_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `danh_muc_san_phams`
--
ALTER TABLE `danh_muc_san_phams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dia_chis`
--
ALTER TABLE `dia_chis`
  ADD PRIMARY KEY (`id_dia_chi`),
  ADD KEY `fk_dia_chis_nguoi_dungs` (`id_nguoi_dung`);

--
-- Indexes for table `don_hangs`
--
ALTER TABLE `don_hangs`
  ADD PRIMARY KEY (`id_don_hang`);

--
-- Indexes for table `gio_hangs`
--
ALTER TABLE `gio_hangs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_gio_hangs_nguoi_dungs` (`id_nguoi_dung`),
  ADD KEY `fk_gio_hangs_san_phams` (`id_san_pham`);

--
-- Indexes for table `hinh_anh_san_phams`
--
ALTER TABLE `hinh_anh_san_phams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `khuyen_mais`
--
ALTER TABLE `khuyen_mais`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lien_hes`
--
ALTER TABLE `lien_hes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nguoi_dungs`
--
ALTER TABLE `nguoi_dungs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `noi_dungs`
--
ALTER TABLE `noi_dungs`
  ADD PRIMARY KEY (`noi_dung_id`),
  ADD KEY `banner_id` (`banner_id`);

--
-- Indexes for table `san_phams`
--
ALTER TABLE `san_phams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tai_khoans`
--
ALTER TABLE `tai_khoans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `so_dien_thoai` (`so_dien_thoai`);

--
-- Indexes for table `thanh_toans`
--
ALTER TABLE `thanh_toans`
  ADD PRIMARY KEY (`id_thanh_toan`),
  ADD KEY `id_don_hang` (`id_don_hang`);

--
-- Indexes for table `tin_tucs`
--
ALTER TABLE `tin_tucs`
  ADD PRIMARY KEY (`tin_tuc_id`);

--
-- Indexes for table `trang_thai_don_hangs`
--
ALTER TABLE `trang_thai_don_hangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `van_chuyen`
--
ALTER TABLE `van_chuyen`
  ADD PRIMARY KEY (`id_ma_van_chuyen`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id_admin` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `binh_luans`
--
ALTER TABLE `binh_luans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `chi_tiet_don_hangs`
--
ALTER TABLE `chi_tiet_don_hangs`
  MODIFY `id_chi_tiet_don_hang` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `danh_muc_banners`
--
ALTER TABLE `danh_muc_banners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `danh_muc_san_phams`
--
ALTER TABLE `danh_muc_san_phams`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `don_hangs`
--
ALTER TABLE `don_hangs`
  MODIFY `id_don_hang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hinh_anh_san_phams`
--
ALTER TABLE `hinh_anh_san_phams`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `khuyen_mais`
--
ALTER TABLE `khuyen_mais`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lien_hes`
--
ALTER TABLE `lien_hes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nguoi_dungs`
--
ALTER TABLE `nguoi_dungs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `san_phams`
--
ALTER TABLE `san_phams`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tin_tucs`
--
ALTER TABLE `tin_tucs`
  MODIFY `tin_tuc_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trang_thai_don_hangs`
--
ALTER TABLE `trang_thai_don_hangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
