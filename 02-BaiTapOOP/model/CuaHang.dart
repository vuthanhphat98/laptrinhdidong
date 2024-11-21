import 'DienThoai.dart';
import 'HoaDon.dart';

class CuaHang {
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  void themDienThoai(DienThoai dienThoai) {
    _danhSachDienThoai.add(dienThoai);
  }

  void themHoaDon(HoaDon hoaDon) {
    if (hoaDon == null || hoaDon.dienThoai == null) {
      print("HoaDon or DienThoai is null");
      return;
    }

    if (hoaDon.soLuongMua <= 0) {
      print("So luong mua must be greater than zero");
      return;
    }

    // Thêm hóa đơn vào danh sách
    _danhSachHoaDon.add(hoaDon);

    // Cập nhật số lượng tồn kho của điện thoại
    if (hoaDon.dienThoai.soLuongTonKho >= hoaDon.soLuongMua) {
      hoaDon.dienThoai.soLuongTonKho -= hoaDon.soLuongMua;
    } else {
      print("Not enough stock for the requested quantity");
    }
  }

  double tinhDoanhThu() {
    double doanhThu = 0;
    for (var hoaDon in _danhSachHoaDon) {
      doanhThu += hoaDon.tinhTongTien();
    }
    return doanhThu;
  }

  double tinhLoiNhuan() {
    double loiNhuan = 0;
    for (var hoaDon in _danhSachHoaDon) {
      loiNhuan += hoaDon.tinhLoiNhuanThucTe();
    }
    return loiNhuan;
  }

  void hienThiDanhSachDienThoai() {
    for (var dienThoai in _danhSachDienThoai) {
      dienThoai.hienThiThongTin();
      print('-------------------');
    }
  }

  void hienThiDanhSachHoaDon() {
    for (var hoaDon in _danhSachHoaDon) {
      hoaDon.hienThiThongTinHoaDon();
      print('-------------------');
    }
  }
}