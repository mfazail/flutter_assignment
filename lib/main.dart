import 'package:flutter/material.dart';
import 'package:flutter_assignment/views/first_page.dart';
import 'package:flutter_assignment/model/product.dart';
import 'package:flutter_assignment/utils/app_state.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (_) => AppState(),
      child: MaterialApp(
        title: 'Flutter Assignment',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FirstPage(),
      ),
    );
  }
}
