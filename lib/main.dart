import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final String name;
  final String imageUrl;
  final String color;
  final String size;
  double price;
  int quantity;

  Product({
    required this.name,
    required this.imageUrl,
    required this.color,
    required this.size,
    this.price = 0.0,
    this.quantity = 1,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoppingCartScreen(),
    );
  }
}

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  List<Product> products = [
    Product(
      name: 'Dress 1',
      imageUrl: 'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      color: 'Red',
      size:'L' ,
      price: 50.0,
    ),
    Product(
      name: 'Dress 2',
      imageUrl:
                'https://images.pexels.com/photos/3907507/pexels-photo-3907507.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',

        color: 'Blue',
      size: 'M',
      price: 60.0,
    ),
    Product(
      name: 'Dress 3',
      imageUrl:
          'https://images.pexels.com/photos/3819969/pexels-photo-3819969.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      color: 'Green',
      size: 'M',
      price: 45.0,
    ),
  ];

  double getTotalPrice() {
    double totalPrice = 0.0;
    for (var product in products) {
      totalPrice += product.price * product.quantity;
    }
    return totalPrice;
  }
  void _showCongratulatorySnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Congratulations! Your order has been checked out.'),
      duration: Duration(seconds: 3), // Adjust the duration as needed
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final screenWidth = constraints.maxWidth;
            final screenHeight = constraints.maxHeight;

            final isSmallScreen = screenWidth < 600;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.search_rounded,size: 40,),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'My Bag',
                    style: TextStyle(fontSize: isSmallScreen ? 20.0 : 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ListTile(
                        leading: Image.network(
                          product.imageUrl, // Use the image URL from your data
                          width: isSmallScreen ? 100.0 : 120.0,
                          height: isSmallScreen ? 100.0 : 120.0,
                         // fit: BoxFit.,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            product.name,
                            style: TextStyle(fontSize: isSmallScreen ? 16.0 : 20.0),
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(

                              children: [
                                Text('Color: ${product.color}'),
                                SizedBox(width: 10,),

                                Text('Size: ${product.size}'),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      if (product.quantity > 0) {
                                        product.quantity--;
                                      }
                                    });
                                  },
                                ),
                                Text('${product.quantity}'),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      product.quantity++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.menu_sharp),
                            Text(
                              '\$${(product.price * product.quantity).toStringAsFixed(2)}',
                              style: TextStyle(fontSize: isSmallScreen ? 16.0 : 20.0),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Total amount:',
                        style: TextStyle(fontSize: isSmallScreen ? 16.0 : 20.0, fontWeight: FontWeight.bold),
                      ),
                    Text(
                    '\$${getTotalPrice().toStringAsFixed(2)}',
                      style: TextStyle(fontSize: isSmallScreen ? 16.0 : 20.0, fontWeight: FontWeight.bold),
                    ),




                    ],
                  ),
                ),
                Container(

                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: EdgeInsets.only(bottom: 10),
                  width: 400,
                  height: 40,
                  child:TextButton(
                    onPressed: (){
                      _showCongratulatorySnackbar(context);


                    },
                    child:Text('Checkout', style: TextStyle(fontSize: isSmallScreen ? 16.0 : 20.0)),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
