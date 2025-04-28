import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/constants/app_constants.dart';
import 'package:ovida/src/core/constants/app_images.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.horizontalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                AppImages.logo,
                height: 100,
              ),
            ),
            const SizedBox(height: 32),

            // Welcome Text
            const Text(
              'Welcome to Ovida',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Access your medication reminders and track your progress, and empower your health journey.',
              style: TextStyle(
                  fontSize: 12,
                  color: AppColors.lightGrey,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // Phone Number Input
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Enter your phone number',
                border: GradientOutlineInputBorder(
                  gradient: AppColors.primaryGradient,
                  width: 1.0,
                  gapPadding: 4.0,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),

            // Divider with OR
            Row(
              children: const [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('or'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 16),

            // Google Sign-In Button
            GestureDetector(
              onTap: () {}, // Add your Google sign-in logic here
              child: Image.asset(
                AppImages.google,
                height: 70,
              ),
            ),
            const SizedBox(height: 16),

            // Terms and Privacy
            const Text(
              'By joining, you agree to our Terms of Service and Privacy Policy.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
