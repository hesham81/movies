import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:movies/core/routes/route_names.dart';
import 'package:movies/core/validations/phone_validation.dart';
import 'package:movies/models/avatar_model.dart';
import '/core/extensions/extensions.dart';
import '../../core/constants/app_assets.dart';
import '../../core/services/bot_toast.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/firebase_auth_services.dart';
import '../../core/validations/validations.dart';
import '../../core/widget/custom_elevated_button.dart';
import '../../core/widget/custom_text_button.dart';
import '../../core/widget/custom_text_form_field.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var widgets = [
    Image.asset(
      Avatars.avatarOne['location']!,
    ),
    Image.asset(
      Avatars.avatarTwo['location']!,
    ),
    Image.asset(
      Avatars.avatarThree['location']!,
    ),
  ];
  var carouselController = CarouselSliderController();
  var selectedIndex = 0;

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
                child: CarouselSlider(
                  items: widgets,
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    viewportFraction: 0.60,
                    initialPage: 0,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      selectedIndex = index;
                      setState(() {});
                    },
                  ),
                  carouselController: carouselController,
                ).center,
              ),
              0.07.horSpace(),
              CustomTextFormField(
                hintText: "Name",
                controller: nameController,
                validator: (value) {
                  return Validations.isNameValid(nameController.text);
                },
                hintStyle: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: AppColors.whiteColor,
                ),
                prefixIcon: ImageIcon(
                  AssetImage(
                    AppAssets.nameICN,
                  ),
                  color: AppColors.whiteColor,
                ),
                isFilled: true,
                fillColor: AppColors.onyxGreen,
                borderColor: AppColors.onyxGreen,
              ),
              0.02.horSpace(),
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
              0.02.horSpace(),
              CustomTextFormField(
                hintText: "Confirm Password",
                controller: rePasswordController,
                validator: (value) {
                  return Validations.rePasswordValid(
                    passwordController.text,
                    rePasswordController.text,
                  );
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
              0.02.horSpace(),
              CustomTextFormField(
                hintText: "Phone Number ",
                controller: phoneController,
                validator: (value) {
                  if (phoneController.text != null) return null;
                  return "Please Enter Phone Number ";
                },
                hintStyle: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: AppColors.whiteColor,
                ),
                prefixIcon: ImageIcon(
                  AssetImage(
                    AppAssets.phoneICN,
                  ),
                  color: AppColors.whiteColor,
                ),
                isFilled: true,
                fillColor: AppColors.onyxGreen,
                borderColor: AppColors.onyxGreen,
              ),
              0.03.horSpace(),
              CustomElevatedButton(
                text: "Create Account",
                borderRadius: 15,
                padding: EdgeInsets.symmetric(
                  vertical: 0.02.height,
                ),
                callBack: () async {
                  if (!formKey.currentState!.validate()) return;
                  EasyLoading.show();
                  User?  user = await FirebaseAuthServices.createAccount(
                    email: emailController.text,
                    password: passwordController.text,
                    name: nameController.text,
                    phone: phoneController.text,
                    imageUrl: Avatars.urls[selectedIndex],
                  );
                  EasyLoading.dismiss();
                  if (user != null) {
                    BotToastServices.showSuccessMessage("Create Account Successfully");
                    Navigator.pushReplacementNamed(
                      context,
                      RouteNames.login,
                    );
                  } else {
                    BotToastServices.showErrorMessage("There is an error");
                  }

                },
              ),
              0.01.horSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have Account?",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  CustomTextButton(
                    text: "Login",
                    callback: () => Navigator.pushReplacementNamed(
                      context,
                      RouteNames.login,
                    ),
                  ),
                ],
              ),
              0.01.horSpace(),
            ],
          ).hPadding(0.03),
        ),
      ),
    );
  }
}
