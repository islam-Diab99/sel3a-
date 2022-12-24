import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Network/cache_helper.dart';
import 'package:shop_app/cubit/login_cubit.dart';
import 'package:shop_app/cubit/register_states.dart';
import 'package:shop_app/cubit/resgister_cubit.dart';
import 'package:shop_app/cubit/states.dart';
import 'package:shop_app/layouts/shop_layout.dart';
import 'package:shop_app/shared/components.dart';
import 'package:shop_app/shared/constants.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
          listener: (context, state) {
        if (state is ShopRegisterSuccessState) {
          if (state.loginModel.status) {
            print(state.loginModel.message);
            print(state.loginModel.data!.token);

            CacheHelper.saveData(
              key: 'token',
              value: state.loginModel.data!.token,
            ).then((value) {
              token = state.loginModel.data!.token;

              navigateAndFinish(
                context,
                const ShopLayout(),
              );
            });
          } else {
            print(state.loginModel.message);

            showToast('${state.loginModel.message}');
          }
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage(
                            'assets/images/undraw_Access_account_re_8spm.png'),
                        height: 170,
                        width: 170,
                      ),
                      Text(
                        'REGISTER',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        'Register now to browse our hot offer',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      defaultFormField(
                        controller: nameController,
                        inputType: TextInputType.name,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter your name';
                          }
                        },
                        labelText: 'User Name',
                        prefix: Icons.person,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      defaultFormField(
                        controller: emailController,
                        inputType: TextInputType.emailAddress,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter your email address';
                          }
                        },
                        labelText: 'Email Address',
                        prefix: Icons.email_outlined,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      defaultFormField(
                        controller: passwordController,
                        inputType: TextInputType.visiblePassword,
                        suffix: ShopRegisterCubit.get(context).suffix,
                        onSubmit: (value) {},
                        isPassword: ShopRegisterCubit.get(context).isPassword,
                        suffixPressed: () {
                          ShopRegisterCubit.get(context)
                              .changePasswordVisibility();
                        },
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'password is too short';
                          }
                        },
                        labelText: 'Password',
                        prefix: Icons.lock_outline,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      defaultFormField(
                        controller: phoneController,
                        inputType: TextInputType.phone,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter your phone number';
                          }
                        },
                        labelText: 'Phone',
                        prefix: Icons.phone,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      state is! ShopLoadingState
                          ? DefaultButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  ShopRegisterCubit.get(context).userRegister(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    phone: phoneController.text,
                                  );
                                }
                              },
                              title: 'Register',
                              colour: Colors.teal,
                              width: double.infinity,
                              height: 50,
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
