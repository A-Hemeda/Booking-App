import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_booking_app/busieness_logic/Auth/login_cubit/states.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/end_points.dart';
import '../../../data/Auth/models/login_model.dart';
import '../../../data/Auth/web_services/dio_helper.dart';




class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  static String? token=null;
  LoginModel? loginModel;
  static savepref(String token)async{
    print("from savepref2");
    SharedPreferences prefs= await SharedPreferences.getInstance();

    prefs.setString("token", token);
    print("from savepref");
    print(prefs.get("lastSearched"));




  }
  static getpref()async{


    SharedPreferences prefs= await SharedPreferences.getInstance();
    token=prefs.getString("token");
print("token"+token!);

  }
  void userLogin ({required String email ,required String password}){
    emit(LoginLoadingState()) ;
    print(email);
    print(password);
    DioHelper.postData(url: LOGIN, body:{
      'email' : email,
      'password' : password ,
    }).then((value) {
      print("kkkkkkkkkkkkkkkk");
      print(value);
      loginModel = LoginModel.fromJson(value.data) ;
      if(loginModel?.status?.type=="1")
     { savepref((loginModel?.data?.api_token)!);
      getpref();
      print((loginModel?.data?.api_token)!);
      emit(LoginSuccessState(loginModel!));}
      else
        emit(LoginwrongState(loginModel!));
    }).catchError((error){
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }





}