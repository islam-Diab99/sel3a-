import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Models/categories_model.dart';
import 'package:shop_app/Models/change_favorite_model.dart';
import 'package:shop_app/Models/favorites_model.dart';
import 'package:shop_app/Models/home_model.dart';
import 'package:shop_app/Models/user_model.dart';
import 'package:shop_app/Network/dio_helper.dart';
import 'package:shop_app/Network/end_points.dart';
import 'package:shop_app/cubit/states.dart';
import 'package:shop_app/modules/categories_screen.dart';
import 'package:shop_app/modules/favorites_screen.dart';
import 'package:shop_app/modules/product_screen.dart';
import 'package:shop_app/modules/settings_screen.dart';
import 'package:shop_app/shared/constants.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());
  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> bottomScreens = [
    const ProductScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    SettingsScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel? homeModel;
  Map<int, bool>? favorites = {};
  void getHomeData() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(
      url: home,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel!.data.products.forEach((element) {
        favorites!.addAll({element.id: element.in_favorites});
      });
      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      emit(ShopErrorHomeDataState());
    });
  }

  CategoriesModel? categoriesModel;
  void getCategories() {
    DioHelper.getData(
      url: get_categories,
      token: token,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(ShopSuccessCategoriesState());
    }).catchError((error) {
      emit(ShopErrorCategoriesState());
      print(error);
    });
  }

  FavoritesModel? favoritesModel;
  void getFavorites() {
    emit(ShopLoadingGetFavoritesState());
    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      emit(ShopSuccessGetFavoritesState());
    }).catchError((error) {
      emit(ShopErrorGetFavoritesState());
      print(error);
    });
  }

  LoginModel? userModel;
  void getUserData() {
    emit(ShopLoadingGetFavoritesState());
    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = LoginModel.fromJson(value.data);
      emit(ShopSuccessUserDataState(userModel!));
    }).catchError((error) {
      emit(ShopErrorUserDataState());
      print(error);
    });
  }

  late ChaneFavoriteModel changeFavoriteModel;
  void changeFavorites(int productId) {
    favorites![productId] = !favorites![productId]!;
    emit(ShopChangeFavoritesState());
    DioHelper.postData(
            url: FAVORITES, data: {'product_id': productId}, token: token)
        .then((value) {
      changeFavoriteModel = ChaneFavoriteModel.fromJason(value.data);
      if (!changeFavoriteModel.status) {
        favorites![productId] = !favorites![productId]!;
      } else {
        getFavorites();
      }
      emit(ShopChangeFavoritesSuccessState(changeFavoriteModel));
    }).catchError((error) {
      favorites![productId] = !favorites![productId]!;

      emit(ShopChangeFavoritesErrorState());
    });
  }
}
