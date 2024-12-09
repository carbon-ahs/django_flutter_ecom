import 'package:ecom_app/screens/home_screen.dart';
import 'package:ecom_app/screens/login_screen.dart';
import 'package:ecom_app/screens/product_details_screen.dart';
import 'package:ecom_app/screens/register_screen.dart';
import 'package:ecom_app/state/product_state.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

import 'screens/favorite_screen.dart';
import 'service_locator.dart';
import 'state/user_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductState()),
        ChangeNotifierProvider(create: (context) => UserState()),
      ],
      child: MaterialApp(
        home: LoginScreen(),
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          ProductDetailsScreen.routeName: (context) =>
              const ProductDetailsScreen(),
          FavoriteScreen.routeName: (context) => const FavoriteScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          RegisterScreen.routeName: (context) => const RegisterScreen(),
        },
      ),
    );
  }
}
