import '../02-BaiTapOOP/model/DienThoai.dart';
import '../02-BaiTapOOP/model/HoaDon.dart';
import '../02-BaiTapOOP/model/CuaHang.dart';
void main() {
  CuaHang cuaHang = CuaHang();

  // Thêm điện thoại
  DienThoai dt1 = DienThoai('DT-001', 'iPhone 13', 'Apple', 20000, 25000, 10, true);
  DienThoai dt2 = DienThoai('DT-002', 'Galaxy S21', 'Samsung', 18000, 23000, 5, true);
  cuaHang.themDienThoai(dt1);
  cuaHang.themDienThoai(dt2);

  // Thêm hóa đơn
  HoaDon hd1 = HoaDon('HD-001', DateTime.now(), dt1, 2, 25000, 'Nguyen Van A', '0123456789');
  cuaHang.themHoaDon(hd1);

  // Hiển thị thông tin
  print('Danh sách điện thoại:');
  cuaHang.hienThiDanhSachDienThoai();
  
  print('Danh sách hóa đơn:');
  cuaHang.hienThiDanhSachHoaDon();

  // Tính doanh thu và lợi nhuận
  print('Doanh thu: ${cuaHang.tinhDoanhThu()}');
  print('Lợi nhuận: ${cuaHang.tinhLoiNhuan()}');
}

// Chương trình quản lý cửa hàng bán điện thoại