import 'dart:io';
import 'dart:math';

void main() {
  bool continueSolving = true;
// Menu chon 
  while (continueSolving) {
    print('Chọn chức năng:');
    print('1. Giải phương trình bậc 2: ax^2+bx+c=0');
    print('2. Thoát');
    stdout.write('Nhập lựa chọn của bạn: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        solveQuadraticEquation();
        break;
      case '2':
        continueSolving = false;
        break;
      default:
        print('Lựa chọn không hợp lệ. Vui lòng nhập lại.');
    }
  }
}
// Ham nhap va kiem tra du lieu nhap vao
double getNumber(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    try {
      return double.parse(input!);
    } catch (e) {
      print('Vui lòng nhập số thực. Hãy thử lại!');
    }
  }
}
//Nhap a,b,c
void solveQuadraticEquation() {
  double a = getNumber('Nhập hệ số a (a khác 0): ');
  while (a == 0) {
    print('Hệ số a phải khác 0. Vui lòng nhập lại.');
    a = getNumber('Nhập hệ số a (a khác 0): ');
  }

  double b = getNumber('Nhập hệ số b: ');
  double c = getNumber('Nhập hệ số c: ');

  double delta = b * b - 4 * a * c;
//Tinh delta va giai phuong trinh
  if (delta > 0) {
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    print('Phương trình có 2 nghiệm phân biệt: x1 = $x1, x2 = $x2');
  } else if (delta == 0) {
    double x = -b / (2 * a);
    print('Phương trình có nghiệm kép: x = $x');
  } else {
    print('Phương trình vô nghiệm');
  }
}