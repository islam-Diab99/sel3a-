import 'package:flutter/material.dart';
import 'package:shop_app/Network/cache_helper.dart';
import 'package:shop_app/modules/login_screen.dart';

import 'package:shop_app/shared/components.dart';
import 'package:shop_app/shared/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Models/onboarding_item_model.dart';



class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  bool isLast = false;
  submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateAndFinish(context, ShopLoginScreen());
      }
    });
  }

  List<BoardingModel> boardings = [
    BoardingModel(
      image: 'assets/images/undraw_gone_shopping_vwmc.png',
      title: 'Choose your product',
      body: 'There are more than 1,000 brands of men\'s '
          'and women\'s shoes and clothing in the catalog',
    ),
    BoardingModel(
      image: 'assets/images/undraw_shopping_app_flsj.png',
      title: 'Add to cart',
      body: 'Just 2 clicks and you can buy all fashion news',
    ),
    BoardingModel(
      image: 'assets/images/undraw_Online_payments_re_y8f2.png',
      title: 'Pay by card',
      body: 'The order can be paid by credit card',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (index) {
                  if (index == (boardings.length - 1)) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boardings[index]),
                itemCount: 3,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                defaultTextButton(
                    function: () {
                      submit();
                    },
                    text: 'Skip',
                    textColor: Colors.black),
                SmoothPageIndicator(
                  controller: boardController,
                  count: boardings.length,
                  effect: const ScrollingDotsEffect(
                      dotHeight: 6, dotWidth: 6, activeDotColor: defaultColor),
                ),
                defaultTextButton(
                    function: () {
                      if (isLast) {
                        submit();
                      } else {
                        boardController.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    text: 'Next'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildBoardingItem(BoardingModel boarding) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Image.asset(boarding.image),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          boarding.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          boarding.body,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ],
    );
