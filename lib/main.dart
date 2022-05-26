import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/blocs/bloc.dart';
import 'package:sample/blocs/event.dart';
import 'package:sample/models/item.dart';
import 'package:sample/repository/local/shared_pref_helper.dart';
import 'package:sample/repository/local/sql_hepler.dart';
import 'package:sample/repository/repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.instance.setup();
  await SQLHelper.deleteItem(1);

  final result = await SQLHelper.getItems();

  print(result.map((e) => e.toJson()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final _repository = Repository();
  @override
  void initState() {
    if (!_repository.isFirstLogin) {
      _repository.isFirstLogin = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
    );
  }
}
