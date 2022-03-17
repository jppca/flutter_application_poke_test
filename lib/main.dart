import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//My imports
import 'package:flutter_application_poke_test/services/poke_services.dart';
import 'package:flutter_application_poke_test/widgets/widget_theme.dart';
import 'package:flutter_application_poke_test/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PokeService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PokeTest',
        theme: WTheme.myTheme,
        initialRoute: 'loading',
        routes: appRoutes,
      ),
    );
  }
}
