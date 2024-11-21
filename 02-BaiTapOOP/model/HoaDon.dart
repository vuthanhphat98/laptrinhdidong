import 'DienThoai.dart';

class HoaDon {
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai dienThoai;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  // Constructor
  HoaDon(this._maHoaDon, this._ngayBan, this.dienThoai, this._soLuongMua,
      this._giaBanThucTe, this._tenKhachHang, this._soDienThoaiKhach) {
    _validate();
  }

  // Getter và Setter với validation
  String get maHoaDon => _maHoaDon;
  set maHoaDon(String value) {
    if (value.isEmpty || !RegExp(r'^HD-\d{3}$').hasMatch(value)) {
      throw Exception('Mã hóa đơn không hợp lệ');
    }
    _maHoaDon = value;
  }

  DateTime get ngayBan => _ngayBan;
  set ngayBan(DateTime value) {
    if (value.isAfter(DateTime.now())) {
      throw Exception('Ngày bán không được sau ngày hiện tại');
    }
    _ngayBan = value;
  }

  int get soLuongMua => _soLuongMua;
  set soLuongMua(int value) {
    if (value <= 0 || value > dienThoai.soLuongTonKho) {
      throw Exception('Số lượng mua không hợp lệ');
    }
    _soLuongMua = value;
  }

  double get giaBanThucTe => _giaBanThucTe;
  set giaBanThucTe(double value) {
    if (value <= 0) {
      throw Exception('Giá bán thực tế phải lớn hơn 0');
    }
    _giaBanThucTe = value;
  }

  String get tenKhachHang => _tenKhachHang;
  set tenKhachHang(String value) {
    if (value.isEmpty) {
      throw Exception('Tên khách hàng không được rỗng');
    }
    _tenKhachHang = value;
  }

  String get soDienThoaiKhach => _soDienThoaiKhach;
  set soDienThoaiKhach(String value) {
    if (value.isEmpty || !RegExp(r'^\d{10}$').hasMatch(value)) {
      throw Exception('Số điện thoại khách không hợp lệ');
    }
    _soDienThoaiKhach = value;
  }

  void _validate() {
    if (_maHoaDon.isEmpty || !RegExp(r'^HD-\d{3}$').hasMatch(_maHoaDon)) {
      throw Exception('Mã hóa đơn không hợp lệ');
    }
    if (_ngayBan.isAfter(DateTime.now())) {
      throw Exception('Ngày bán không được sau ngày hiện tại');
    }
    if (_soLuongMua <= 0 || _soLuongMua > dienThoai.soLuongTonKho) {
      throw Exception('Số lượng mua không hợp lệ');
    }
    if (_giaBanThucTe <= 0) {
      throw Exception('Giá bán thực tế phải lớn hơn 0');
    }
    if (_tenKhachHang.isEmpty) {
      throw Exception('Tên khách hàng không được rỗng');
    }
    if (_soDienThoaiKhach.isEmpty ||
        !RegExp(r'^\d{10}$').hasMatch(_soDienThoaiKhach)) {
      throw Exception('Số điện thoại khách không hợp lệ');
    }
  }

  double tinhTongTien() {
    return _giaBanThucTe * _soLuongMua;
  }

  double tinhLoiNhuanThucTe() {
    return (dienThoai.giaBan - dienThoai.giaNhap) * _soLuongMua;
  }

  void hienThiThongTinHoaDon() {
    print('Mã hóa đơn: $_maHoaDon');
    print('Ngày bán: $_ngayBan');
    print('Điện thoại: ${dienThoai.tenDienThoai}');
    print('Số lượng mua: $_soLuongMua');
    print('Giá bán thực tế: $_giaBanThucTe');
    print('Tên khách hàng: $_tenKhachHang');
    print('Số điện thoại khách: $_soDienThoaiKhach');
  }
}
