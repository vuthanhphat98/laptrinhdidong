import '../model/DienThoai.dart';
import '../model/CuaHang.dart';
import '../model/HoaDon.dart';
import 'dart:io';

void main() {
  CuaHang cuaHang = CuaHang();

  while (true) {
    print('--- Menu ---');
    print('1. Thêm điện thoại mới');
    print('2. Cập nhật thông tin điện thoại');
    print('3. Tạo hóa đơn mới');
    print('4. Tính doanh thu');
    print('5. Tính lợi nhuận');
    print('6. Hiện thị danh sách điện thoại');
    print('7. Hiện thị danh sách hóa đơn');
    print('8. Thoát');
    stdout.write('Chọn một tùy chọn: ');
    
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        // Thêm điện thoại mới
        try {
          stdout.write('Nhập mã điện thoại (DT-xxx): ');
          String maDienThoai = stdin.readLineSync()!;
          stdout.write('Nhập tên điện thoại: ');
          String tenDienThoai = stdin.readLineSync()!;
          stdout.write('Nhập hãng sản xuất: ');
          String hangSanXuat = stdin.readLineSync()!;
          stdout.write('Nhập giá nhập: ');
          double giaNhap = double.parse(stdin.readLineSync()!);
          stdout.write('Nhập giá bán: ');
          double giaBan = double.parse(stdin.readLineSync()!);
          stdout.write('Nhập số lượng tồn kho: ');
          int soLuongTonKho = int.parse(stdin.readLineSync()!);
          stdout.write('Trạng thái (true/false): ');
          bool trangThai = stdin.readLineSync()!.toLowerCase() == 'true';

          var dienThoai = DienThoai(maDienThoai, tenDienThoai, hangSanXuat, giaNhap, giaBan, soLuongTonKho, trangThai);
          cuaHang.themDienThoai(dienThoai);
          print('Thêm điện thoại thành công!');
        } catch (e) {
          print('Lỗi: ${e.toString()}');
        }
        break;

      case '2':
        // Cập nhật thông tin điện thoại
        try {
          stdout.write('Nhập mã điện thoại cần cập nhật: ');
          String maDienThoai = stdin.readLineSync()!;
          var dienThoai = cuaHang.danhSachDienThoai.firstWhere((dt) => dt.maDienThoai == maDienThoai);
          
          stdout.write('Nhập tên điện thoại mới: ');
          String tenDienThoai = stdin.readLineSync()!;
          dienThoai.tenDienThoai = tenDienThoai;

          stdout.write('Nhập hãng sản xuất mới: ');
          String hangSanXuat = stdin.readLineSync()!;
          dienThoai.hangSanXuat = hangSanXuat;

          stdout.write('Nhập giá nhập mới: ');
          double giaNhap = double.parse(stdin.readLineSync()!);
          dienThoai.giaNhap = giaNhap;

          stdout.write('Nhập giá bán mới: ');
          double giaBan = double.parse(stdin.readLineSync()!);
          dienThoai.giaBan = giaBan;

          stdout.write('Nhập số lượng tồn kho mới: ');
          int soLuongTonKho = int.parse(stdin.readLineSync()!);
          dienThoai.soLuongTonKho = soLuongTonKho;

          stdout.write('Trạng thái mới (true/false): ');
          bool trangThai = stdin.readLineSync()!.toLowerCase() == 'true';
          dienThoai.trangThai = trangThai;

          print('Cập nhật thông tin điện thoại thành công!');
        } catch (e) {
          print('Lỗi: ${e.toString()}');
        }
        break;

      case '3':
        // Tạo hóa đơn mới
        try {
          stdout.write('Nhập mã hóa đơn (HD-xxx): ');
          String maHoaDon = stdin.readLineSync()!;
          stdout.write('Nhập ngày bán (yyyy-mm-dd): ');
          DateTime ngayBan = DateTime.parse(stdin.readLineSync()!);
          stdout.write('Nhập mã điện thoại (DT-xxx): ');
          String maDienThoai = stdin.readLineSync()!;
          var dienThoai = cuaHang.danhSachDienThoai.firstWhere((dt) => dt.maDienThoai == maDienThoai);
          stdout.write('Nhập số lượng mua: ');
 int soLuongMua = int.parse(stdin.readLineSync()!);
          stdout.write('Nhập giá bán thực tế: ');
          double giaBanThucTe = double.parse(stdin.readLineSync()!);
          stdout.write('Nhập tên khách hàng: ');
          String tenKhachHang = stdin.readLineSync()!;
          stdout.write('Nhập số điện thoại khách: ');
          String soDienThoaiKhach = stdin.readLineSync()!;

          var hoaDon = HoaDon(maHoaDon, ngayBan, dienThoai, soLuongMua, giaBanThucTe, tenKhachHang, soDienThoaiKhach);
          cuaHang.themHoaDon(hoaDon);
          print('Tạo hóa đơn thành công!');
        } catch (e) {
          print('Lỗi: ${e.toString()}');
        }
        break;

      case '4':
        // Tính doanh thu
        double doanhThu = cuaHang.tinhDoanhThu();
        print('Doanh thu hiện tại: $doanhThu');
        break;

      case '5':
        // Tính lợi nhuận
        double loiNhuan = cuaHang.tinhLoiNhuan();
        print('Lợi nhuận hiện tại: $loiNhuan');
        break;

      case '6':
        // Hiện thị danh sách điện thoại
        cuaHang.hienThiDanhSachDienThoai();
        break;

      case '7':
        // Hiện thị danh sách hóa đơn
        cuaHang.hienThiDanhSachHoaDon();
        break;

      case '8':
        // Thoát
        print('Cảm ơn bạn đã sử dụng chương trình!');
        return;

      default:
        print('Tùy chọn không hợp lệ. Vui lòng chọn lại.');
    }
  }
}