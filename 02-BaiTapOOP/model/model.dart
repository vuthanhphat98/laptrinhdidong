class DienThoai {
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTonKho;
  bool _trangThai;

  // Constructor
  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat,
      this._giaNhap, this._giaBan, this._soLuongTonKho, this._trangThai) {
    _validate();
  }

  // Getter và Setter với validation
  String get maDienThoai => _maDienThoai;
  set maDienThoai(String value) {
    if (value.isEmpty || !RegExp(r'^DT-\d{3}$').hasMatch(value)) {
      throw Exception('Mã điện thoại không hợp lệ');
    }
    _maDienThoai = value;
  }

  String get tenDienThoai => _tenDienThoai;
  set tenDienThoai(String value) {
    if (value.isEmpty) {
      throw Exception('Tên điện thoại không được rỗng');
    }
    _tenDienThoai = value;
  }

  String get hangSanXuat => _hangSanXuat;
  set hangSanXuat(String value) {
    if (value.isEmpty) {
      throw Exception('Hãng sản xuất không được rỗng');
    }
    _hangSanXuat = value;
  }

  double get giaNhap => _giaNhap;
  set giaNhap(double value) {
    if (value <= 0) {
      throw Exception('Giá nhập phải lớn hơn 0');
    }
    _giaNhap = value;
  }

  double get giaBan => _giaBan;
  set giaBan(double value) {
    if (value <= 0 || value <= _giaNhap) {
      throw Exception('Giá bán phải lớn hơn giá nhập và lớn hơn 0');
    }
    _giaBan = value;
  }

  int get soLuongTonKho => _soLuongTonKho;
  set soLuongTonKho(int value) {
    if (value < 0) {
      throw Exception('Số lượng tồn kho không được âm');
    }
    _soLuongTonKho = value;
  }

  bool get trangThai => _trangThai;
  set trangThai(bool value) {
    _trangThai = value;
  }

  void _validate() {
    if (_maDienThoai.isEmpty || !RegExp(r'^DT-\d{3}$').hasMatch(_maDienThoai)) {
      throw Exception('Mã điện thoại không hợp lệ');
    }
    if (_tenDienThoai.isEmpty) {
      throw Exception('Tên điện thoại không được rỗng');
    }
    if (_hangSanXuat.isEmpty) {
      throw Exception('Hãng sản xuất không được rỗng');
    }
    if (_giaNhap <= 0) {
      throw Exception('Giá nhập phải lớn hơn 0');
    }
    if (_giaBan <= 0 || _giaBan <= _giaNhap) {
      throw Exception('Giá bán phải lớn hơn giá nhập và lớn hơn 0');
    }
    if (_soLuongTonKho < 0) {
      throw Exception('Số lượng tồn kho không được âm');
    }
  }

  double tinhLoiNhuanDuKien() {
    return (_giaBan - _giaNhap) * _soLuongTonKho;
  }

  void hienThiThongTin() {
    print('Mã điện thoại: $_maDienThoai');
    print('Tên điện thoại: $_tenDienThoai');
    print('Hãng sản xuất: $_hangSanXuat');
    print('Giá nhập: $_giaNhap');
    print('Giá bán: $_giaBan');
    print('Số lượng tồn kho: $_soLuongTonKho');
    print('Trạng thái: ${_trangThai ? "Còn kinh doanh" : "Ngừng kinh doanh"}');
  }

  bool coTheBan() {
    return _soLuongTonKho > 0 && _trangThai;
  }
}

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
