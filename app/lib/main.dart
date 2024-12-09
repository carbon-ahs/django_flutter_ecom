import 'package:ecom_app/screens/home_screen.dart';
import 'package:ecom_app/screens/login_screen.dart';
import 'package:ecom_app/screens/product_details_screen.dart';
import 'package:ecom_app/screens/register_screen.dart';
import 'package:ecom_app/state/cart_state.dart';
import 'package:ecom_app/state/product_state.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  @override
  Widget build(BuildContext context) {
    SharedPreferences prefs = sl<SharedPreferences>();
    var token = prefs.getString('token');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductState()),
        ChangeNotifierProvider(create: (context) => UserState()),
        ChangeNotifierProvider(create: (context) => CartState()),
      ],
      child: MaterialApp(
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          ProductDetailsScreen.routeName: (context) =>
              const ProductDetailsScreen(),
          FavoriteScreen.routeName: (context) => const FavoriteScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          RegisterScreen.routeName: (context) => const RegisterScreen(),
        },
        // home: LoginScreen(),
        home: token != null ? HomeScreen() : LoginScreen(),
      ),
    );
  }
}
