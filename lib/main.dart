import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sample/config/app_colors.dart';
import 'package:sample/config/app_constants.dart';
import 'package:sample/generated/l10n.dart';
import 'package:sample/providers/store.dart';
import 'package:sample/providers/store_user.dart';
import 'package:sample/screens/login_screen.dart';
import 'package:sample/screens/main_screen.dart';
import 'package:sample/screens/movies_screen.dart';
import 'package:sample/screens/product_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Store()),
        ChangeNotifierProvider(create: (_) => StoreUser()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(
          AppConstants.designWidth,
          AppConstants.designHeight,
        ),
        builder: () => _builderMaterialApp(),
      ),
    );
  }

  MaterialApp _builderMaterialApp() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // setup locale
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ja', 'JP'),
      // title
      title: '',
      // theme
      theme: ThemeData(
        primaryColor: AppColors.c2196F3,
      ),
      // navigation
      initialRoute: '/movies',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/': (context) => const MainScreen(),
        '/product': (context) => const ProductDetailScreen(),
        '/movies': (context) => const MoviesScreen(),
      },
    );
  }
}
