import 'package:ecom_app/screens/home_screen.dart';
import 'package:ecom_app/screens/login_screen.dart';
import 'package:ecom_app/screens/product_details_screen.dart';
import 'package:ecom_app/screens/register_screen.dart';
import 'package:ecom_app/state/product_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/favorite_screen.dart';

void main() {
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
