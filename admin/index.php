<?php 

// Require file Common
require_once '../commons/env.php'; // Khai báo biến môi trường
require_once '../commons/function.php'; // Hàm hỗ trợ

// Require toàn bộ file Controllers
require_once 'controllers/DashboardController.php';
require_once 'controllers/SanPhamController.php';
require_once 'controllers/DanhMucController.php';

// Require toàn bộ file Models
require_once 'models/SanPham.php';
require_once 'models/DanhMuc.php';

// Route
$act = $_GET['act'] ?? '/';

// Để bảo bảo tính chất chỉ gọi 1 hàm Controller để xử lý request thì mình sử dụng match

match ($act) {
    // Dashboards
    '/'                 => (new DashboardController())->index(),


       //quản lý sản phẩm
    'san-phams' => (new SanPhamController())->danhSachSanPham(),
    'form-them-san-pham' => (new SanPhamController())->formAddSanPham(),
    'them-san-pham' => (new SanPhamController())->postAddSanPham(),
    'form-sua-san-pham' => (new SanPhamController())->formEditSanPham(),
    'sua-san-pham' => (new SanPhamController())->postEditSanPham(),
    'sua-album-anh-san-pham' => (new SanPhamController())->postEditAnhSanPham(),
    'xoa-san-pham' => (new SanPhamController())->deleteSanPham(),
    'chi-tiet-san-pham' => (new SanPhamController())->detailSanPham(),
    //bình luận
    'update-trang-thai-binh-luan' =>(new SanPhamController())->updateTrangThaiBinhLuan(),
    //đánh giá
    'update-trang-thai-danh-gia' =>(new SanPhamController())->updateTrangThaiDanhGia(),


    //quản lý danh mục
    'danh-mucs'   => (new DanhMucController())->ListCate(),
    'form-danh-muc' => (new DanhMucController())->Cre(),
    'them-danh-muc' => (new DanhMucController())->handleCre(),
    'form-sua-danh-muc' => (new DanhMucController())->ShowUpdate(),
    'sua-danh-muc' => (new DanhMucController())->handleUpdate(),
    'xoa-danh-muc' => (new DanhMucController())->Delete(),


};