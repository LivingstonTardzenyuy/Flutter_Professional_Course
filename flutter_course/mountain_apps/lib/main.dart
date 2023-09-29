import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mountain_apps/cubic/app_cubic.dart';
import 'package:mountain_apps/cubic/app_cubit_logics.dart';
import 'package:mountain_apps/pages/home_page.dart';
import 'package:mountain_apps/pages/navPages/bar_item_page.dart';
import 'package:mountain_apps/pages/navPages/detail_page.dart';
import 'package:mountain_apps/pages/navPages/main_page.dart';
import 'package:mountain_apps/pages/navPages/my_page.dart';
import 'package:mountain_apps/pages/welcome_page.dart';
import 'package:mountain_apps/services/data_services.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

        home: BlocProvider<AppCubits>(
          create: (context) => AppCubits(
            data: DataServices()
          ),
          child: AppCubitLogics(),
        )
    );
  }
}
