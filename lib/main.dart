import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Network/cache_helper.dart';
import 'package:shop_app/Network/dio_helper.dart';
import 'package:shop_app/cubit/app_cubit.dart';
import 'package:shop_app/cubit/login_cubit.dart';
import 'package:shop_app/cubit/shop_cubit.dart';
import 'package:shop_app/cubit/states.dart';
import 'package:shop_app/layouts/shop_layout.dart';
import 'package:shop_app/modules/login_screen.dart';
import 'package:shop_app/shared/bloc_observer.dart';
import 'package:shop_app/shared/constants.dart';
import 'package:shop_app/shared/themes.dart';

import 'modules/on_boarding_screan.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  Widget widget;
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');

  bool? isDark = CacheHelper.getData(key: 'isDark');
  if (onBoarding != null) {
    if (token != null) {
      widget = const ShopLayout();
    } else {
      widget = ShopLoginScreen();
    }
  } else {
    widget = const OnBoardingScreen();
  }

  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
   MyApp({required this.startWidget, this.isDark});
  final Widget startWidget;
  final bool? isDark;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(
            create: (context) => ShopCubit()
              ..getHomeData()
              ..getCategories()
              ..getFavorites()
              ..getUserData())
      ],
      child: BlocConsumer<AppCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'EShop',
              theme: lightTheme,
              themeMode: cubit.appMode,
              darkTheme: darkTheme,
              home: startWidget);
        },
      ),
    );
  }
}
