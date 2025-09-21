import 'package:flutter/material.dart';
import 'package:testtest2/my_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  @override
  void initState() {
    super.initState();
    debugPrint('start');
    Future.delayed(Duration(milliseconds: 50)).then((value) => debugPrint('end'));
    for (int i = 0; i < 100000; i++) {
      if (i % 1000 == 0) debugPrint('i = $i datetime = ${DateTime.now()}');
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title)),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('You have pushed the button this many times:'),
                    Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
                    MyImage(image: Image.asset('assets/avatar.png')),
                  ],
                ),
              ),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(border: Border.all(color: Colors.yellow)),
                      child: Padding(padding: const EdgeInsets.all(8.0), child: Text('badge')),
                    ),
                  ],
                ),
                Text('1 qwertyuio asdfghjk zxcvbnm '),
                Text('2 qwertyuio asdfghjk zxcvbnm '),
                Text('3 qwertyuio asdfghjk zxcvbnm '),
                Text('4 qwertyuio asdfghjk zxcvbnm '),
                Text('5 qwertyuio asdfghjk zxcvbnm '),
                Text('6 qwertyuio asdfghjk zxcvbnm '),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
