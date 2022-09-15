import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif_app/Providers/AuthProvider.dart';
import 'package:gif_app/Providers/UIProvider.dart';
import 'package:gif_app/Screens/LoadingSpinner.dart';
import 'package:provider/provider.dart';

class SignupSigninScreen extends StatelessWidget {
  const SignupSigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<UIProvider, AuthProvider>(
          builder: (context, UIprovder, Authprovider, x) {
        return Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 170.h,
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 70.w,
                            height: 30.h,
                            margin: EdgeInsets.only(top: 30.h),
                            decoration: BoxDecoration(
                                color: Color(0xFF6A994E),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Text(
                              "GIF",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 50.w),
                            child: Text(
                              "CLUB",
                              style: TextStyle(
                                  color: Color(0xFF6A994E), fontSize: 30.sp),
                            ),
                          )
                        ]),
                  ),
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF6A994E),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.r),
                          topRight: Radius.circular(25.r))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 100.w),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    UIprovder.changeSigInUpPage(0);
                                  },
                                  child: Text(
                                    "login".tr(),
                                    style: TextStyle(
                                        color: UIprovder.SignInUpIndex == 0
                                            ? Colors.white
                                            : Color(0xFFA7C957),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.sp),
                                  ),
                                ),
                                const Spacer(),
                                TextButton(
                                  onPressed: () {
                                    UIprovder.changeSigInUpPage(1);
                                  },
                                  child: Text(
                                    "signup".tr(),
                                    style: TextStyle(
                                        color: UIprovder.SignInUpIndex == 1
                                            ? Colors.white
                                            : Color(0xFFA7C957),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.sp),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25.r),
                                  topRight: Radius.circular(25.r))),
                          child: UIprovder.currentWidget,
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
            Authprovider.isLoading
                ? const Center(child: LoadingSpinner())
                : const SizedBox(
                    height: 0,
                    width: 0,
                  )
          ],
        );
      }),
    );
  }
}
