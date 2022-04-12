import 'package:flutter/rendering.dart';
import 'package:sample/config/app_colors.dart';
import 'package:sample/config/app_dimens.dart';

class AppTextStyles {
  static const String openSansBold = 'OpenSans-Bold';
  static const String openSansRegular = 'OpenSans-Regular';

  static final normal10cFFFFFF = TextStyle(
    fontFamily: openSansBold,
    fontSize: AppDimens.sp10,
    color: AppColors.cFFFFFF,
  );
}
