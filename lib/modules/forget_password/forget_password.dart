import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:movies/core/services/bot_toast.dart';
import 'package:movies/core/utils/firebase_auth_services.dart';
import 'package:movies/core/widget/custom_elevated_button.dart';
import '../../core/validations/validations.dart';
import '../../core/widget/custom_text_form_field.dart';
import '/core/constants/app_assets.dart';
import '/core/extensions/extensions.dart';
import '/core/theme/app_colors.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forget Password",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColors.secondaryColor,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AppAssets.forgetPassword,
              ),
              0.03.horSpace(),
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
              ).hPadding(0.02),
              0.02.horSpace(),
              CustomElevatedButton(
                text: "Verify Email",
                borderRadius: 15,
                padding: EdgeInsets.symmetric(
                  vertical: 0.017.height,
                ),
                callBack: () {
                  if (formKey.currentState!.validate()) {
                    EasyLoading.show();
                    FirebaseAuthServices.forgetPassword(emailController.text);
                    EasyLoading.dismiss();
                    BotToastServices.showSuccessMessage("Code Sent Success");
                    Navigator.pop(context);
                  }
                },
              ).hPadding(0.02),
            ],
          ),
        ),
      ),
    );
  }
}
