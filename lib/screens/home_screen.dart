import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/config/app_dimens.dart';
import 'package:sample/config/app_text_styles.dart';
import 'package:sample/generated/l10n.dart';
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
              horizontal: AppDimens.w20,
              vertical: AppDimens.h25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).listProduct,
                  style: AppTextStyles.bold30c000000o87,
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
