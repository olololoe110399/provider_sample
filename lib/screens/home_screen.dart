import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/providers/store.dart';
import 'package:sample/widgets/product_list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(store.getUser?.userName ?? ''),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "List Product",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black87),
                ),
              ],
            ),
          ),
          ...store.products.map((item) {
            return InkWell(
              onTap: () {
                store.setActiveProduct(item);
                Navigator.pushNamed(context, '/product');
              },
              child: ProductListItem(product: item),
            );
          }),
        ],
      ),
    );
  }
}
