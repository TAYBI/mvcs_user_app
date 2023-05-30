import 'package:flutter/material.dart';
import 'package:mvc_counter_app/model/app_model.dart';
import 'package:mvc_counter_app/model/user_model.dart';
import 'package:mvc_counter_app/service/user_service.dart';
import 'package:mvc_counter_app/view/home_page.dart';
import 'package:mvc_counter_app/view/loggin_page.dart';
import 'package:provider/provider.dart';
import 'package:mvc_counter_app/controller/base_commande.dart' as Commande;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => AppModel()),
        ChangeNotifierProvider(create: (c) => UserModel()),
        Provider(create: (C) => UserService()),
      ],
      child: Builder(builder: (context) {
        Commande.init(context);
        return MaterialApp(
          home: AppScaffold(),
        );
      }),
    );
  }
}

class AppScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Bind to AppModel.currentUser
    String? currentUser =
        context.select<AppModel, String?>((value) => value.currentUser);

    // Return the current view, based on the currentUser value:
    return Scaffold(
      body: currentUser != null ? HomePage() : LoginPage(),
    );
  }
}
