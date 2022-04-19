import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/config/app_colors.dart';
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
    final widthItemHorizontal =
        ((MediaQuery.of(context).size.width - AppDimens.w30) / 2);

    return Scaffold(
      appBar: AppBar(
        title: Text(store.getUser?.userName ?? ''),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView(
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
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimens.w20,
              ),
              height: AppDimens.h150,
              child: GridView.count(
                crossAxisCount: 2,
                children: [1, 2, 3, 4, 5, 6, 9]
                    .map((value) =>
                        _buildItemHorizontal(value, widthItemHorizontal))
                    .toList(),
                scrollDirection: Axis.horizontal,
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
      ),
    );
  }

  Widget _buildItemHorizontal(int value, double width) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          color: AppColors.c000000,
        ),
        SizedBox(
          width: AppDimens.w10,
        )
      ],
    );
  }
}
