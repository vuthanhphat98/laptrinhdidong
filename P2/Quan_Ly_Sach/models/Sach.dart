

class Sach{
  String _maSach;
  String _tenSach;
  String _tacGia;
  bool _trangThai;

  Sach(this._maSach, this._tacGia, this._tenSach, this._trangThai);

  //getter
  String get maSach => _maSach;
  String get tenSach => _tenSach;
  String get tacGia => _tacGia;
  bool get trangThai => _trangThai;

  //setter
  set maSach(String maSach){
    if(maSach.isNotEmpty){
      maSach = _maSach;
    }
  } 
  set tenSach(String tenSach){
    if(tenSach.isNotEmpty){
      tenSach = _maSach;
    }
  }
  set tacGia(String tacGia){
    if(tacGia.isNotEmpty){
      tacGia = _tacGia;
    }
  }
  set trangThai(bool trangThai){
      trangThai = _trangThai;
  }

  void hienThiThongTin(){
      print('Ma sach: $_maSach');
      print('Ten sach: $_tenSach');
      print('Tac gia: $_tacGia');
      print('Trang thai: ${_trangThai ? 'Da muon' : 'Chua muon'}');
  }

}