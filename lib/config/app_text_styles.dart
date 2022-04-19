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

  static final bold30c000000o87 = TextStyle(
    fontFamily: openSansBold,
    fontSize: AppDimens.sp30,
    color: AppColors.c000000,
  );

  static final bold24cFFFFFFo87 = TextStyle(
    fontFamily: openSansBold,
    fontSize: AppDimens.sp24,
    color: AppColors.cFFFFFF,
  );
}
