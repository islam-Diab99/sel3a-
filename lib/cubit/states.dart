import 'package:shop_app/Models/change_favorite_model.dart';
import 'package:shop_app/Models/user_model.dart';

abstract class ShopStates {}

class ShopLoginInitState extends ShopStates {}

class ShopLoadingState extends ShopStates {}

class ShopLoginSuccessState extends ShopStates {
  final LoginModel loginModel;

  ShopLoginSuccessState(this.loginModel);
}

class ShopLoginErrorState extends ShopStates {
  final String error;

  ShopLoginErrorState(this.error);
}

class ShopChangePasswordVisibilityState extends ShopStates {}

class ShopInitialState extends ShopStates {}

class ChangeModeState extends ShopStates {}

class ShopChangeBottomNavState extends ShopStates {}

class ShopLoadingHomeDataState extends ShopStates {}

class ShopSuccessHomeDataState extends ShopStates {}

class ShopErrorHomeDataState extends ShopStates {}

class ShopSuccessCategoriesState extends ShopStates {}

class ShopErrorCategoriesState extends ShopStates {}

class ShopChangeFavoritesSuccessState extends ShopStates {
  final ChaneFavoriteModel model;

  ShopChangeFavoritesSuccessState(this.model);
}

class ShopChangeFavoritesErrorState extends ShopStates {}

class ShopChangeFavoritesState extends ShopStates {}

class ShopErrorGetFavoritesState extends ShopStates {}

class ShopSuccessGetFavoritesState extends ShopStates {}

class ShopLoadingGetFavoritesState extends ShopStates {}

class ShopErrorUserDataState extends ShopStates {}

class ShopSuccessUserDataState extends ShopStates {
  final LoginModel loginModel;

  ShopSuccessUserDataState(this.loginModel);
}

class ShopLoadingUserDataState extends ShopStates {}
