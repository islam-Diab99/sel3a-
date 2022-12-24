import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/shop_cubit.dart';
import 'package:shop_app/cubit/states.dart';
import 'package:shop_app/shared/components.dart';
import 'package:shop_app/shared/constants.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          nameController.text = ShopCubit.get(context).userModel!.data!.name;
          emailController.text = ShopCubit.get(context).userModel!.data!.email!;
          phoneController.text = ShopCubit.get(context).userModel!.data!.phone!;
          return ShopCubit.get(context).userModel != null
              ? Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      defaultFormField(
                        labelText: 'Name',
                        prefix: Icons.person,
                        controller: nameController,
                        inputType: TextInputType.name,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'name must not be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                        labelText: 'Email',
                        prefix: Icons.mail,
                        controller: emailController,
                        inputType: TextInputType.emailAddress,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Email must not be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                        labelText: 'Phone',
                        prefix: Icons.phone,
                        controller: phoneController,
                        inputType: TextInputType.name,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'phone must not be empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DefaultButton(
                        onPressed: () {
                          signOut(context);
                        },
                        height: 60,
                        colour: Colors.teal,
                        width: double.infinity,
                        title: 'LOGIN OUT',
                      )
                    ],
                  ),
                )
              : const Center(child: CircularProgressIndicator());
        });
  }
}
