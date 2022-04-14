import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/config/app_dimens.dart';
import 'package:sample/config/app_text_styles.dart';
import 'package:sample/generated/l10n.dart';
import 'package:sample/providers/store.dart';
import 'package:sample/widgets/product_list_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.w20,
              vertical: AppDimens.h20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).favorite,
                  style: AppTextStyles.bold30c000000o87,
                ),
              ],
            ),
          ),
          ...store.favorites.map((item) {
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
