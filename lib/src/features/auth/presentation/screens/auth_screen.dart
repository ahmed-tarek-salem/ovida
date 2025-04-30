import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/constants/app_constants.dart';
import 'package:ovida/src/core/constants/app_images.dart';
import 'package:ovida/src/core/extensions/hardcoded.dart';
import 'package:ovida/src/core/shared/widgets/gradient_elevated_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool signUp = false;

  toggleSignUp() {
    setState(() {
      signUp = !signUp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SafeArea(
        child: ListView(
          padding:
              EdgeInsets.symmetric(horizontal: AppConstants.horizontalPadding),
          children: [
            Center(
              child: Image.asset(
                AppImages.logo,
                height: 100.h,
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              'Welcome to Ovida'.hardCoded,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              'Access your medication reminders and track your progress, and empower your health journey.'
                  .hardCoded,
              style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.lightGrey,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.h),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your phone number'.hardCoded,
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 12.h),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your password'.hardCoded,
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            if (signUp) ...[
              SizedBox(height: 12.h),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Confirm your password'.hardCoded,
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
            ],
            SizedBox(height: 24.h),
            RaisedRaisedButton(
              height: 55.h,
              width: double.infinity,
              onPressed: () {},
              child: Text(signUp ? "Sign up" : "Login".hardCoded),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Spacer(),
                Text(
                  signUp
                      ? "Don’t have an account yet?".hardCoded
                      : "Already have an account?".hardCoded,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.lightGrey,
                      fontWeight: FontWeight.w400),
                ),
                GestureDetector(
                  onTap: toggleSignUp,
                  child: Text(signUp ? " Login" : " Sign up".hardCoded,
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.blueLink,
                          fontWeight: FontWeight.w500)),
                )
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(child: const Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Text('or'.hardCoded),
                ),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 16.h),
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                AppImages.google,
                height: 70.h,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'By joining, you agree to our Terms of Service and Privacy Policy.'
                  .hardCoded,
              style: TextStyle(fontSize: 8.h, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
