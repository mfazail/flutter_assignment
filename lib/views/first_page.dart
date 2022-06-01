import 'package:flutter/material.dart';
import 'package:flutter_assignment/views/second_page.dart';
import 'package:flutter_assignment/utils/app_state.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    context.read<AppState>().initHive();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<AppState>().checkAndSaveData();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SecondPage(),
              ),
            );
          },
          child: const Text("Second Screen"),
        ),
      ),
    );
  }
}
