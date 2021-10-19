// @dart=2.9

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_front_end/pages/checkout_page.dart';
import 'package:shamo_front_end/pages/chekcout_succes_page.dart';
import 'package:shamo_front_end/pages/detail_chat_page.dart';
import 'package:shamo_front_end/pages/home/main_page.dart';
import 'package:shamo_front_end/pages/sign_in_page.dart';
import 'package:shamo_front_end/pages/sign_up_page.dart';
import 'package:shamo_front_end/pages/spalsh_page.dart';
import 'package:shamo_front_end/pages/cart_page.dart';
import 'package:shamo_front_end/pages/edit_profile_page.dart';
import 'package:shamo_front_end/pages/product_page.dart';
import 'package:shamo_front_end/providers/auth_provider.dart';
import 'package:shamo_front_end/providers/cart_provider.dart';
import 'package:shamo_front_end/providers/page_provider.dart';
import 'package:shamo_front_end/providers/product_provider.dart';
import 'package:shamo_front_end/providers/transaction_provider.dart';
import 'package:shamo_front_end/providers/wishlist_provider.dart';
import 'package:shamo_front_end/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/edit-profile': (context) => EditProfilePage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccessPage(),
        },
      ),
    );
  }
}
