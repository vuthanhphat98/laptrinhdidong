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