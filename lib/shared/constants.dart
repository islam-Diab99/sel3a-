import 'package:flutter/material.dart';
import 'package:shop_app/Network/cache_helper.dart';
import 'package:shop_app/modules/login_screen.dart';

import 'components.dart';

const defaultColor = Colors.teal;
void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) => {
        if (value) {navigateAndFinish(context, ShopLoginScreen())}
      });
}

String? token = '';
