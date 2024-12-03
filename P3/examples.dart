import 'package:flutter/material.dart';

//Button
class CardExamples extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Card Example'),
        ),
        body: Center(
          child: Card(
            elevation: 4.0,
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('This is a card'),
            ),
          ),
        ),
      )
    );
  }
}

//Avatar
class CircleAvatarExamples extends StatelessWidget{
  const CircleAvatarExamples({super.key});
  @override
  Widget build (BuildContext context){
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('CircleAvatarExamples'),
          ),
          body: Center(
            child: CircleAvatar(
              radius: 50,
              // backgroundImage: NetworkImage('https://picsum.photos/200/200'),
                backgroundImage: AssetImage ('../assets/hutech_logo.png'),
            ),
          ),
        )
    );
  }
}

//Viền vuông border
class BorderExamples extends StatelessWidget{
  const BorderExamples({super.key});
  @override
  Widget build (BuildContext context){
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('BorderExamples'),
          ),
          body: Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blueGrey,
                  width: 3,
              ),
            ),
            child: const Center(
              child: Text('Border Example'),
            ),
            ),
          ),
        )
    );
  }
}

//thanh Bar dưới
class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() => _BottomNavigationBarExampleState();
}
//
class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  // Hàm xử lý khi tap vào item
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('BottomNavigationBar'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            )
          ],
          // Index cua item dang duoc chon
          currentIndex: _selectedIndex,
          // Màu của item khi được chọn
          selectedItemColor: Colors.amber[800],
          // Hàm xử lý khi tap vào item
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

//List bài học
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ'),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.asset('assets/hutech_logo.png'),
              title: Text('Bài viết ${index + 1}'),
              subtitle: Text('Mô tả ngắn gọn về bài viết ${index + 1}'),
            ),
          );
        },
      ),
    );
  }
}

