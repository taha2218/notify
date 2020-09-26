import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:notification/configuration/local.dart';
import 'package:notification/pages/home.dart';
import 'package:notification/pages/login.dart';
import 'package:notification/pages/profile.dart';
import 'package:notification/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notification/providers/index.dart';
import 'package:provider/provider.dart';

void main() async {
  // Register controllers
  // Example:
  // Get.put(Controller);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
      ),
    );

    return ChangeNotifierProvider(
      create: (_) => Index(),
      child: GetMaterialApp(
        title: LocalConfiguration.name,
        debugShowCheckedModeBanner: false,

        // Theme
        theme: ThemeData(
          fontFamily: 'Poppins',
          primarySwatch: Colors.indigo,
          primaryColor: Colors.white,
          accentColor: Colors.indigo,
          cursorColor: LocalConfiguration.dark,
          textSelectionHandleColor: LocalConfiguration.dark,
          textSelectionColor: LocalConfiguration.dark.withOpacity(24 / 100),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.white,
        ),

        initialRoute: '/',
        getPages: [
          // Register routes
          // Example
          // GetPage(name: '/', page: () => Widget()),
          GetPage(name: '/', page: () => SplashPage()),
          GetPage(name: '/login', page: () => LoginPage()),
          GetPage(name: '/profile', page: () => ProfilePage()),
          GetPage(name: '/homePage', page: () => HomePage()),
        ],
      ),
    );
  }
}
