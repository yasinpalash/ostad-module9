import 'package:flutter/material.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count = 0;
  //first call
  @override
  void initState() {
    print('1');
    super.initState();
  }
  //2nd call
  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    print('did Update ');
    super.didUpdateWidget(oldWidget);
  }

  //3 call
  @override
  void didChangeDependencies() {
  print('2');
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Statefull'),
        ),
        body: Center(
            child: Text(
          count.toString(),
          style: TextStyle(fontSize: 40),
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            count=count+1;
            setState(() {

            });

          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  //4
  @override
  void deactivate() {
    print('Deactivate');
    super.deactivate();
  }
  //5
  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }
}
