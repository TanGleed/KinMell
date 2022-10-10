import 'package:app/providers/user.provider.dart';
import 'package:app/utils/user_preference.dart';
import 'package:app/views/auth/screens/register.dart';
import 'package:app/views/auth/services/auth.services.dart';
import 'package:app/views/home/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/globalvariable.dart';
import 'router.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferance.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initstate() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KinMell',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: const Color.fromARGB(255, 12, 40, 63),
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      // home: Provider.of<UserProvider>(context).user.token.isNotEmpty
      //     ? const LoginPage()
      //     : const SignupPage(),
      home: const HomePage(),
    );
  }
}
