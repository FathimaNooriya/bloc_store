import 'package:bloc_store/Sreens/home_page.dart';
import 'package:bloc_store/controller/bloc/bloc_bloc.dart';
import 'package:bloc_store/controller/cart_bloc/bloc/cart_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BlocBloc()),
        BlocProvider(create: (context) => CartBlocBloc()),
      ],
      child:
          //  BlocProvider(
          // create: (context) => BlocBloc(),
          // child:
          MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 0, 0, 0)),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
