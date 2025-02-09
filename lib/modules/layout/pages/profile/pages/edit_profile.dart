import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/validations/validations.dart';
import '../../../../../core/widget/custom_text_button.dart';
import '/core/extensions/extensions.dart';
import '/core/widget/custom_elevated_button.dart';
import '/core/widget/custom_text_form_field.dart';
import '../../../../../core/utils/firebase_auth_services.dart';
import '/core/theme/app_colors.dart';
import '/core/widget/load_network_image.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  User? user = FirebaseAuthServices.getUserData();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pick Avatar ",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SafeArea(
            child: LoadNetworkImage(
              url: "${user!.photoURL}",
              height: 150,
              width: 150,
            ).center,
          ),
          0.03.horSpace(),
          CustomTextFormField(
            hintText: user!.displayName.toString(),
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
            prefixIcon: Icon(
              Icons.person,
              color: AppColors.whiteColor,
            ),
            isFilled: true,
            fillColor: AppColors.onyxGreen,
            borderColor: AppColors.onyxGreen,
          ),
          0.02.horSpace(),
          CustomTextFormField(
            hintText: user?.phoneNumber ?? "No Phone Number",
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
          0.01.horSpace(),
          CustomTextButton(
            text: "Reset Password",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
            callback: () {
              FirebaseAuthServices.forgetPassword(
                user!.email.toString(),
              );
            },
          ).left,
          Spacer(),
          CustomElevatedButton(
            text: "Delete Account ",
            bgColor: Colors.red,
            borderRadius: 15,
            textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w400,
            ),

          ),
          0.01.horSpace(),
          CustomElevatedButton(
            text: "Update Data",
            borderRadius: 15,

          ),
        ],
      ).hPadding(0.02),
    );
  }
}
