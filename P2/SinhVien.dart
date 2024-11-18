class SinhVien {
  String _hoTen;
  int _tuoi;
  String _maSV;
  double _diemTB;

//constructor
  SinhVien(this._hoTen, this._tuoi, this._diemTB, this._maSV);

//Getters
  String get hoTen => _hoTen;
  int get tuoi => _tuoi;
  String get maSV => _maSV;
  double get diemTB => _diemTB;

//Setters
  set hoTen(String hoTen) {
    if (hoTen.isNotEmpty) {
      _hoTen = hoTen;
    }
  }

  set Tuoi(int tuoi) {
    if (tuoi > 0) _tuoi = tuoi;
    //tuoi = tuoi > 0 ? tuoi : _tuoi;
  }

  set maSV(String maSV) {
    if (maSV.isNotEmpty) {
      _maSV = maSV;
    }
  }

  set diemTB(double diemTB) {
    if (diemTB >= 0 && diemTB <= 10) {
      _diemTB = diemTB;
    }
  }

// Hien thi thong tin
  void hienThiThongTin() {
    print('Ho ten: $_hoTen');
    print('Tuoi: $_tuoi');
    print('Ma so sinh vien: $_maSV');
    print('Diem trung binh: $_diemTB');
  }

//xep loai sinh vien
  String xepLoai() {
    if (_diemTB >= 8.0) return 'Gioi';
    if (_diemTB >= 6.5) return 'Kha';
    if (_diemTB >= 5.0) return 'Trung binh';
    return 'Yeu';
  }
}

//Lop LopHoc
class LopHoc {
  String _tenLop;
  List<SinhVien> _danhSachSV = [];

  LopHoc(this._tenLop);

//Getters
  String get tenLop => _tenLop;
  List<SinhVien> get danhSachSV => _danhSachSV;

//Them SV
  void themSinhVien(SinhVien sv) => _danhSachSV.add(sv);

  void hienThiDanhSach() {
    print('\n------------------------');
    print('\n------------------------');
    print('\nDanh sach sinh vien veien lop $_tenLop');
    for (var sv in _danhSachSV) {
      print('\n------------------------');
      sv.hienThiThongTin();
      print('\nXep loai: ${sv.xepLoai()}');
    }
  }
}

//Ham Test
void main() {
  var sv = SinhVien('Nguyen Van A', 20, 8.5, 'SV001');
  print('Test gettier: ${sv.hoTen}');
  sv.hoTen = 'Nguyen Van B';
  print('Sau khi set: ${sv.hoTen}');
  print('Xeploai: ${sv.xepLoai()}');

  var lop = LopHoc('21DTHD5');
  lop.themSinhVien(SinhVien('Nguyen Van A', 20, 8.5, "SV001"));
  lop.themSinhVien(SinhVien('Nguyen Van B', 21, 6.5, "SV002"));
  lop.themSinhVien(SinhVien('Nguyen Van C', 22, 5.5, "SV003"));
  lop.themSinhVien(SinhVien('Nguyen Van D', 23, 4.0, "SV004"));
  lop.hienThiDanhSach();
}
