import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/ui/auth/auterizatin_page.dart';
import 'package:myapp/ui/auth/forgot_passwpord_page.dart';
import 'package:myapp/ui/auth/login_page.dart';
import 'package:myapp/ui/auth/registration_page.dart';
import 'package:myapp/ui/views/home_page.dart';
import 'ui/cubit/home_page_cubit.dart';
import 'ui/cubit/registration_page_cubit.dart';
import 'ui/cubit/search_Repo_cubit.dart';
import 'ui/cubit/update_page_cubit.dart';
import 'ui/views/bottom_navigation.dart';
import 'ui/views/update_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey:
          "AIzaSyAAxcU5nQMcHCV0FsYRoDicPurMB2BNwww", // paste your api key here
      appId:
          "1:886608448568:android:b671e53d14d97e927ceacd", //paste your app id here
      messagingSenderId: "886608448568", //paste your messagingSenderId here
      projectId: "fir-crud-6c205", //paste your project id here
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SearchCubit()),
        BlocProvider(create: (_) => HomePageCubit()),
        BlocProvider(create: (_) => RegistrationPageCubit()),
        BlocProvider(create: (_) => UpdatePageCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyBottomNavigation(),
        routes: {
          '/update': (context) => const UpdatePage(),
          '/home': (context) => MyBottomNavigation(),
          '/bottomnavigation': (context) => MyBottomNavigation(),
          '/homePage': (context) => HomePage(),
          '/forgot': (context) => const ForgotPasswordPage(),
          '/register': (context) => const RegistrationPage(),
          '/auth': (context) => const AutherizationPage(),
          '/login': (context) => const LoginPage(),
        },
      ),
    );
  }
}
