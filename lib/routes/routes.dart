import 'package:flutter/material.dart';

//My imports
import 'package:flutter_application_poke_test/pages/login_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'login': (_) => const LoginPage(),
};
