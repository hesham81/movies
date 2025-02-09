import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:movies/core/routes/route_names.dart';
import 'package:movies/core/services/bot_toast.dart';
import 'package:movies/core/utils/firebase_auth_services.dart';
import 'package:movies/core/validations/validations.dart';
import '/core/constants/app_assets.dart';
import '/core/extensions/extensions.dart';
import '/core/theme/app_colors.dart';
import '/core/widget/custom_elevated_button.dart';
import '/core/widget/custom_text_button.dart';
import '/core/widget/custom_text_form_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SafeArea(
                child: Image.asset(
                  AppAssets.logo,
                ).center,
              ),
              0.07.horSpace(),
              CustomTextFormField(
                hintText: "Email",
                controller: emailController,
                validator: (value) {
                  return Validations.isEmailValid(emailController.text);
                },
                hintStyle: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: AppColors.whiteColor,
                ),
                prefixIcon: ImageIcon(
                  AssetImage(
                    AppAssets.emailICN,
                  ),
                  color: AppColors.whiteColor,
                ),
                isFilled: true,
                fillColor: AppColors.onyxGreen,
                borderColor: AppColors.onyxGreen,
              ),
              0.02.horSpace(),
              CustomTextFormField(
                hintText: "Password",
                controller: passwordController,
                validator: (value) {
                  return Validations.isPasswordValid(passwordController.text);
                },
                hintStyle: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: AppColors.whiteColor,
                ),
                prefixIcon: ImageIcon(
                  AssetImage(
                    AppAssets.lockICN,
                  ),
                  color: AppColors.whiteColor,
                ),
                isPassword: true,
                isFilled: true,
                fillColor: AppColors.onyxGreen,
                borderColor: AppColors.onyxGreen,
              ),
              CustomTextButton(
                text: "Forget Password ?",
              ).right,
              0.01.horSpace(),
              CustomElevatedButton(
                text: "Login",
                borderRadius: 15,
                padding: EdgeInsets.symmetric(
                  vertical: 0.02.height,
                ),
                callBack: () async {
                  if (formKey.currentState!.validate()) {
                    EasyLoading.show();
                    var response = await FirebaseAuthServices.login(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    EasyLoading.dismiss();
                    if (response != null) {
                      BotToastServices.showSuccessMessage("Login Successfully");
                    } else {
                      BotToastServices.showErrorMessage("There is an error");
                    }
                  }
                },
              ),
              0.01.horSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have Account?",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  CustomTextButton(
                    text: "Create One",
                    callback: () => Navigator.pushReplacementNamed(
                      context,
                      RouteNames.createAccount,
                    ),
                  ),
                ],
              ),
              0.01.horSpace(),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.secondaryColor,
                      thickness: 1,
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    "OR",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColors.secondaryColor,
                      thickness: 1,
                      indent: 10,
                    ),
                  ),
                ],
              ).hPadding(0.2),
              0.04.horSpace(),
              CustomElevatedButton.widget(
                borderRadius: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.googleICN,
                    ),
                    0.01.verSpace(),
                    Text(
                      "Login With Google",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.primaryColor,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ).hPadding(0.03),
        ),
      ),
    );
  }
}
