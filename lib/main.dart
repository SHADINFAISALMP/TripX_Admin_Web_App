import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_admin_application/blocs/bottomnavigation/bottomnavigation_bloc.dart';
import 'package:tripx_admin_application/blocs/google_sign/google_bloc.dart';
import 'package:tripx_admin_application/blocs/loginadmin/login_bloc.dart';
import 'package:tripx_admin_application/blocs/register_button/register_bloc.dart';
import 'package:tripx_admin_application/blocs/signupadmin/signup_bloc.dart';
import 'package:tripx_admin_application/blocs/signupimage/profileimage_bloc.dart';
import 'package:tripx_admin_application/firebase_options.dart';
import 'package:tripx_admin_application/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => SignupBloc(),
      ),
      BlocProvider(
        create: (context) => RegisterBloc(),
      ),
      BlocProvider(
        create: (context) => GoogleBloc(),
      ),
      BlocProvider(
        create: (context) => ProfileimageBloc(),
      ),
      BlocProvider(
        create: (context) => LoginBloc(),
      ),
      BlocProvider(
        create: (context) => BottomnavigationBloc(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
