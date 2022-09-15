import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif_app/Providers/AuthProvider.dart';
import 'package:gif_app/Providers/MethodsProvider.dart';
import 'package:gif_app/Screens/ResetPasswordDialog.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProvider, MethodProvider>(
        builder: (context, Authprovider, Methodprovider, x) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30.0.w),
          child: Form(
              key: Authprovider.signInKey,
              child: Column(
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: Text(
                        "WelcomeBack".tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25.sp),
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                      width: double.infinity, child: Text("SignInDes".tr())),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(width: double.infinity, child: Text("Email".tr())),
                  TextFormField(
                    validator: (value) => Methodprovider.emailValidate(value),
                    keyboardType: TextInputType.emailAddress,
                    controller: Authprovider.emailSignInController,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                      width: double.infinity, child: Text("Password".tr())),
                  TextFormField(
                    validator: (value) =>
                        Methodprovider.passwordValidate(value),
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: Authprovider.passwordSignInController,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () => Authprovider.SignIn(),
                    child: Container(
                        width: 314.w,
                        height: 70.h,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "LoginButton".tr(),
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ))),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text('ForgotPassword'.tr()),
                    TextButton(
                        onPressed: () => showDialog(
                            context: context,
                            builder: (context) => const ResetPasswordDialog()),
                        child: Text("Reset".tr()))
                  ])
                ],
              )),
        ),
      );
    });
  }
}
