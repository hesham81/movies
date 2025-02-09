import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/extensions/extensions.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/widget/custom_elevated_button.dart';
import 'package:movies/modules/layout/pages/profile/widget/tab_items.dart';

import '/core/utils/firebase_auth_services.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user = FirebaseAuthServices.getUserData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                height: 0.4.height,
                decoration: BoxDecoration(
                  color: AppColors.onyxGreen,
                ),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Image.network(
                                "${user!.photoURL}",
                                height: 118,
                                width: 118,
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  (loadingProgress
                                                          .expectedTotalBytes ??
                                                      1)
                                              : null,
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return Center(
                                    child: Icon(
                                      Icons.error,
                                      color: Colors.red,
                                      size: 50,
                                    ),
                                  );
                                },
                              ).allPadding(15),
                              Text(
                                "${user!.displayName}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                    ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "12",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                    ),
                              ),
                              0.01.horSpace(),
                              Text(
                                "Wish List",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                    ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "10",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                    ),
                              ),
                              0.01.horSpace(),
                              Text(
                                "History",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ).hPadding(0.03),
                      0.02.horSpace(),
                      Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: CustomElevatedButton(
                              text: "Edit Profile",
                              borderRadius: 15,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                              padding:
                                  EdgeInsets.symmetric(vertical: 0.015.height),
                            ).hPadding(0.02),
                          ),
                          Expanded(
                            flex: 2,
                            child: CustomElevatedButton(
                              text: "Exit",
                              borderRadius: 15,
                              bgColor: Colors.red,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                              padding:
                                  EdgeInsets.symmetric(vertical: 0.015.height),
                            ),
                          ),
                        ],
                      ).hPadding(0.022),
                      0.02.horSpace(),
                      TabBar(
                        dividerColor: Colors.transparent,
                        indicatorColor: AppColors.secondaryColor,
                        isScrollable: false,
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: [
                          TabItems(
                            icon: Icons.list,
                            text: "Watch List",
                          ),
                          TabItems(
                            icon: Icons.folder,
                            text: "History",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
