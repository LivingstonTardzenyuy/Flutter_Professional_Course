import 'package:bloc/bloc.dart';
import 'package:mountain_apps/services/data_services.dart';

import 'app_cubic_state.dart';

class AppCubits extends Cubit<CubitState>{
  AppCubits({required this.data}) : super(InitialState()){
    emit(WelcomeState());
  }


  final DataServices data;
  late final places;

  void getData() async{
    try{
      emit(LoadedState(places));
      places = await data.getInfo();
      emit(LoadedState(places));
    }

    catch(e){

    }
  }
}