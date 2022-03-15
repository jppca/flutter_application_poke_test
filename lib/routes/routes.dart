import 'package:flutter/material.dart';
import 'package:flutter_application_poke_test/pages/loading_page.dart';

//My imports
import 'package:flutter_application_poke_test/pages/login_page.dart';
import 'package:flutter_application_poke_test/pages/home_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'loading': (_) => const LoadingPage(),
  'login': (_) => const LoginPage(),
  'home': (_) => const HomePage()
};
