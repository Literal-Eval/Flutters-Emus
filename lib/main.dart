import 'package:chip_8_flutter/data/constants.dart';
import 'package:chip_8_flutter/models/speaker.dart';
import 'package:chip_8_flutter/screens/console.dart';
import 'package:chip_8_flutter/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: const Chip(),
        theme: ThemeData.dark().copyWith(
          primaryColor: kSecondaryColor,
          scaffoldBackgroundColor: kPrimaryColor,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: kPrimaryColor,
            titleTextStyle: TextStyle(
              color: kSecondaryColor,
            ),
            iconTheme: IconThemeData(color: kSecondaryColor),
          ),
          textTheme: const TextTheme(
            bodyText2: TextStyle(
              color: kSecondaryColor,
            ),
          ),
        ),
      ),
    ),
  );
  await Speaker.load();
}

class Chip extends StatefulWidget {
  const Chip({Key? key}) : super(key: key);

  @override
  State<Chip> createState() => _ChipState();
}

class _ChipState extends State<Chip> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    SizeConfig.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text('Load'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Console();
            }));
          },
        ),
      ),
    );
  }
}
