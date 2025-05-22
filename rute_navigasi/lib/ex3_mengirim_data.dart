import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  void panggilSecondScreen(BuildContext context) async {
    final _result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const SecondScreen(value: 2025);
        },
      ),
    );

    print("Datanya adalah: $_result");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: const Text('Buka Screen 2'),
          onPressed: () {
            panggilSecondScreen(context); // Dibungkus dalam fungsi
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final int value;

  const SecondScreen({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 65, 207, 70),
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Nilai yang dikirim : $value'),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 65, 207, 70),
                foregroundColor: Colors.white,
              ),
              child: const Text('Kembali ke Screen 1'),
              onPressed: () {
                Navigator.pop(context, 'Kembali dari Screen 2');
              },
            ),
          ],
        ),
      ),
    );
  }
}