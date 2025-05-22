import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Root App
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tab Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

// MainPage dengan TabBar dan TabBarView
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Step 1: Inisialisasi TabController
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  // Step 2 & 3: Buat AppBar + TabBar + TabBarView
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Contoh Tampilan Tab Bar'),
        elevation: 4.0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Home'),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Product'),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Profile'),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Home(),
          Product(),
          Profile(),
        ],
      ),
    );
  }
}

// Halaman Home (tanpa Scaffold karena sudah di TabBarView)
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Halaman Home',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

// Halaman Product
class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Halaman Product',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

// Halaman Profile
class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Halaman Profile',
        style: TextStyle(fontSize: 21),
      ),
    );
  }
}