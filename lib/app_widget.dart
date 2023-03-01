import 'package:flutter/material.dart';

import 'features/presentation/presentation.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChuckNorrisIO API',
      home: HomePage(),
    );
  }
}
