import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Models/user_model.dart';
import 'package:shop_app/Network/dio_helper.dart';
import 'package:shop_app/Network/end_points.dart';
import 'package:shop_app/cubit/states.dart';

class LoginCubit extends Cubit<ShopStates> {
  LoginCubit() : super(ShopLoginInitState());
  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;
  userLogin({required String email, required String password}) {
    emit(ShopLoadingState());
    DioHelper.postData(url: login, data: {'email': email, 'password': password})
        .then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(ShopLoginSuccessState(loginModel!));
    }).catchError((error) {
      emit(ShopLoginErrorState(error.toString()));
      print(error);
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    isPassword
        ? suffix = Icons.visibility
        : suffix = Icons.visibility_off_outlined;
    emit(ShopChangePasswordVisibilityState());
  }
}
