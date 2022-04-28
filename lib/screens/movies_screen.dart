import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/config/app_colors.dart';
import 'package:sample/config/app_dimens.dart';
import 'package:sample/config/app_text_styles.dart';
import 'package:sample/generated/l10n.dart';
import 'package:sample/providers/store.dart';
import 'package:sample/repository/remote/my_api_sevice.dart';
import 'package:sample/utillies/error_handle_factory.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<Store>(context, listen: false)
        .fetchMoviesByCategory(Category.popular);
    Provider.of<Store>(context, listen: false).handleError = (error) {
      ErrorHandleFactory.handleErrorByType(context, error);
    };
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).movieScreen,
          style: AppTextStyles.bold24cFFFFFFo87,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          store.fetchMoviesByCategory(Category.nowPlaying);
        },
        child: ListView(
          children: [
            ...store.movies.map(
              (e) => Text(e.title ?? ""),
            ),
            ...store.movies.map(
              (e) => Text(e.title ?? ""),
            ),
          ],
        ),
      ),
    );
  }
}
