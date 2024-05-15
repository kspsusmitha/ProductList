import 'package:flutter/material.dart';
import 'package:machine_test/api.dart';
import 'package:machine_test/productitem.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ApiClass.instance.getProducts();
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade50,
        title: Text("Product List"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
        child: SafeArea(
            child: ValueListenableBuilder(
                valueListenable: ApiClass.instance.productNotifier,
                builder: (context, List newProduct, _) {
                  return GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: List.generate(newProduct.length, (index) {
                        final product =
                            ApiClass.instance.productNotifier.value[index];
                        print(
                            "sssssssssssssssssssssssssssssssssssssss $product");
                        return Card(
                          color: Colors.blueGrey.shade50,
                          child: ProductItem(
                              pTitle: product.title,
                              pType: product.type,
                              pPrice: product.price,
                              pImage: product.image),
                        );
                      }));
                })),
      ),
    );
  }
}
