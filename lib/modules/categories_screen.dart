import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Models/categories_model.dart';
import 'package:shop_app/cubit/shop_cubit.dart';
import 'package:shop_app/cubit/states.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildCatItem(
                  ShopCubit.get(context).categoriesModel!.data.data[index]),
              separatorBuilder: (context, index) => Divider(
                    height: 50,
                  ),
              itemCount:
                  ShopCubit.get(context).categoriesModel!.data.data.length);
        });
  }
}

Widget buildCatItem(DataModel model) => Row(
      children: [
        Image(
          image: NetworkImage(
            model.image,
          ),
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          model.name,
          style: TextStyle(fontSize: 20),
        ),
        Spacer(),
        Icon(Icons.arrow_forward_ios),
      ],
    );
