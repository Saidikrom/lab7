import 'package:flutter/material.dart';
import 'package:share/share.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cake(),
    );
  }
}

class Cake extends StatefulWidget {
  const Cake({Key? key}) : super(key: key);

  @override
  State<Cake> createState() => _CakeState();
}

class _CakeState extends State<Cake> {
  int _money = 0;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _money = _money + 10;
      _counter++;
    });
  }

  String? text = '';
  String? subject = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
          ),
        ],
        backgroundColor: Colors.teal,
        title: Text('Dessert Clicker'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                height: 570,
                width: 500,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/kitchen.png'),
                  fit: BoxFit.cover,
                )),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 200,
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory),
                    onPressed: _incrementCounter,
                    child: _counter > 20
                        ? Image.asset(
                            'assets/cake2.png',
                            height: 150,
                          )
                        : Image.asset(
                            'assets/cake.png',
                            height: 150,
                          ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    ListTile(
                      leading: Text(
                        'Desserts Sold',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 19,
                        ),
                      ),
                      trailing: Text(
                        _counter.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ListTile(
                      trailing: Text(
                        '\$${_money}',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
