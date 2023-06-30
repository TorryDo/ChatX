import 'package:chatx/routes.dart';
import 'package:chatx/src/domain/auth/repository/auth_repository.dart';
import 'package:chatx/src/domain/domain_module.dart';
import 'package:chatx/src/presentation/login/auth_bloc.dart';
import 'package:chatx/src/presentation/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  domainModules();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(GetIt.I<AuthRepository>()),
        ),
      ],
      child: MaterialApp(
        title: 'ChatX',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: Routes.LOGIN_SCREEN,
        routes: {
          Routes.LOGIN_SCREEN: (context) => LoginScreen(),
        },
      ),
    );
  }
}
