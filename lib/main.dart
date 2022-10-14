// ignore_for_file: prefer_const_constructors

import 'package:book_collection/cubit/book_cubit.dart';
import 'package:book_collection/cubit/page_cubit.dart';
import 'package:book_collection/pages/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PageCubit()),
        BlocProvider(create: (context) => BookCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => MainPage(),
        },
      ),
    );
  }
}
