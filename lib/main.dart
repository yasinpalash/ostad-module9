import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyButtonScreen(),
    );
  }
}

class MyButtonScreen extends StatefulWidget {
  @override
  _MyButtonScreenState createState() => _MyButtonScreenState();
}

class _MyButtonScreenState extends State<MyButtonScreen> {
  String selectedSize = '';
  late Color selectedColor;

  void _showSnackbar(String size) {
    final snackBar = SnackBar(
      content: Text('Selected Size: $size'),
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _onButtonTap(String size, Color color) {
    setState(() {
      selectedSize = size;
      selectedColor = color;
    });
    _showSnackbar(size);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Size Selector'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(

                 // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => _onButtonTap('S', Colors.green),
                      style: ElevatedButton.styleFrom(
                        primary: selectedSize == 'S' ? Colors.orange : Colors.grey,
                      ),
                      child: Text('S'),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () => _onButtonTap('M', Colors.blue),
                      style: ElevatedButton.styleFrom(
                        primary: selectedSize == 'M' ? Colors.orange : Colors.grey,
                      ),
                      child: Text('M'),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () => _onButtonTap('L', Colors.red),
                      style: ElevatedButton.styleFrom(
                        primary: selectedSize == 'L' ? Colors.orange : Colors.grey,
                      ),
                      child: Text('L'),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () => _onButtonTap('XL', Colors.red),
                      style: ElevatedButton.styleFrom(
                        primary: selectedSize == 'XL' ? Colors.orange : Colors.grey,
                      ),
                      child: Text('Xl'),
                    ),

                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(children: [
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => _onButtonTap('XXL', Colors.red),
                    style: ElevatedButton.styleFrom(
                      primary: selectedSize == 'XXL' ? Colors.orange : Colors.grey,
                    ),
                    child: Text('XXl'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => _onButtonTap('XXXL', Colors.red),
                    style: ElevatedButton.styleFrom(
                      primary: selectedSize == 'XXXL' ? Colors.orange : Colors.grey,
                    ),
                    child: Text('XXXL'),
                  ),
                ],),
              ),
            )
          ],
        ),
      ),
    );
  }
}

