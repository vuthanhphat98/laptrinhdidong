import 'package:flutter/material.dart';
import 'main.dart';

class _MyHomePageState extends State<MyHomePage> {
  final List<String> friends = ['Bạn 1', 'Bạn 2', 'Bạn 3']; // Danh sách bạn bè

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Image.asset('../assets/hutech_logo.png', height: 100),
                  const SizedBox(height: 20),
                  const Text(
                    'Tên người dùng',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Mô tả ngắn gọn về người dùng',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Hành động khi nhấn nút
                    },
                    child: const Text('Chỉnh sửa hồ sơ'),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Danh sách bạn bè:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: friends.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(friends[index]),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}