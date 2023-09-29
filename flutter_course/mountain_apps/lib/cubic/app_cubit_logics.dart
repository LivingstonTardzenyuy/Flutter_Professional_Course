import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mountain_apps/cubic/app_cubic_state.dart';
import 'package:mountain_apps/pages/home_page.dart';

import '../pages/welcome_page.dart';
import 'app_cubic.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitState>(
        builder: (context, state){
          if(state is WelcomeState){
            return WelcomePage();
          }

          if(state is LoadedState){
            return HomePage();
          }

          if(state is LoadingState){
            return Center(child: CircularProgressIndicator());
          }
          else{
            return Container();
          }
        }
      )
    );
  }
}
