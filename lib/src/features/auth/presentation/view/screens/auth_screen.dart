import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/constants/app_constants.dart';
import 'package:ovida/src/core/constants/app_images.dart';
import 'package:ovida/src/core/extensions/hardcoded.dart';
import 'package:ovida/src/core/services/dependency_injection/di_service.dart';
import 'package:ovida/src/core/shared/widgets/custom_progress_indicator.dart';
import 'package:ovida/src/core/shared/widgets/gradient_elevated_button.dart';
import 'package:ovida/src/core/shared/widgets/loading_overlay.dart';
import 'package:ovida/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:ovida/src/features/user_info/presentation/screens/user_info_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isSignUpMode = false;

  late final AuthViewmodel _viewmodel = di<AuthViewmodel>();
  final _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _toggleAuthMode() {
    setState(() => _isSignUpMode = !_isSignUpMode);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleAuthentication() async {
    if (_viewmodel.loading || !_formKey.currentState!.validate()) return;

    if (_isSignUpMode) {
      await _viewmodel.signUp(
        phoneNumber: _phoneController.text,
        password: _passwordController.text,
      );
    } else {
      await _viewmodel.login(
        phoneNumber: _phoneController.text,
        password: _passwordController.text,
      );
    }

    if (_viewmodel.userModel != null && mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const UserInfoScreen()),
      );
    } else {
      LoadingOverlay.showErrorMessage(
          "Authentication failed ${_viewmodel.error?.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SafeArea(
        child: FormBuilder(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.horizontalPadding),
            children: [
              const LogoSection(),
              SizedBox(height: 32.h),
              const HeaderSection(),
              SizedBox(height: 32.h),
              AuthFormFields(
                isSignUpMode: _isSignUpMode,
                phoneController: _phoneController,
                passwordController: _passwordController,
                confirmPasswordController: _confirmPasswordController,
              ),
              SizedBox(height: 24.h),
              AuthButton(
                isSignUpMode: _isSignUpMode,
                viewmodel: _viewmodel,
                onPressed: _handleAuthentication,
              ),
              SizedBox(height: 8.h),
              ToggleAuthModeRow(
                isSignUpMode: _isSignUpMode,
                onTap: _toggleAuthMode,
              ),
              SizedBox(height: 16.h),
              const DividerWithText(text: 'or'),
              SizedBox(height: 16.h),
              const SocialLoginButton(),
              SizedBox(height: 16.h),
              const TermsText(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class LogoSection extends StatelessWidget {
  const LogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(AppImages.logo, height: 100.h),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome to Ovida'.hardCoded,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        Text(
          'Access your medication reminders and track your progress, and empower your health journey.'
              .hardCoded,
          style: TextStyle(fontSize: 12.sp, color: AppColors.lightGrey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class AuthFormFields extends StatelessWidget {
  final bool isSignUpMode;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const AuthFormFields({
    super.key,
    required this.isSignUpMode,
    required this.phoneController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: phoneController,
          keyboardType: TextInputType.phone,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.equalLength(11),
          ]),
          decoration:
              InputDecoration(hintText: 'Enter your phone number'.hardCoded),
        ),
        SizedBox(height: 12.h),
        TextFormField(
          controller: passwordController,
          obscureText: true,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.minLength(4),
          ]),
          decoration:
              InputDecoration(hintText: 'Enter your password'.hardCoded),
        ),
        if (isSignUpMode) ...[
          SizedBox(height: 12.h),
          TextFormField(
            controller: confirmPasswordController,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              (val) => val != passwordController.text
                  ? 'Passwords do not match'.hardCoded
                  : null,
            ]),
            decoration:
                InputDecoration(hintText: 'Confirm your password'.hardCoded),
          ),
        ],
      ],
    );
  }
}

class AuthButton extends StatelessWidget {
  final bool isSignUpMode;
  final AuthViewmodel viewmodel;
  final VoidCallback onPressed;

  const AuthButton({
    super.key,
    required this.isSignUpMode,
    required this.viewmodel,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewmodel,
      builder: (context, _) {
        return GradientButton(
          height: 55.h,
          width: double.infinity,
          onPressed: onPressed,
          child: viewmodel.loading
              ? const CustomProgressIndicator()
              : Text(isSignUpMode ? "Sign up" : "Login".hardCoded),
        );
      },
    );
  }
}

class ToggleAuthModeRow extends StatelessWidget {
  final bool isSignUpMode;
  final VoidCallback onTap;

  const ToggleAuthModeRow({
    super.key,
    required this.isSignUpMode,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Text(
          isSignUpMode
              ? "Already have an account?".hardCoded
              : "Don't have an account yet?".hardCoded,
          style: TextStyle(fontSize: 12.sp, color: AppColors.lightGrey),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            isSignUpMode ? " Login" : " Sign up".hardCoded,
            style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.blueLink,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Text(text.hardCoded),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {}, // Placeholder for actual logic
      child: Image.asset(AppImages.google, height: 70.h),
    );
  }
}

class TermsText extends StatelessWidget {
  const TermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'By joining, you agree to our Terms of Service and Privacy Policy.'
          .hardCoded,
      style: TextStyle(fontSize: 8.h, color: Colors.grey),
      textAlign: TextAlign.center,
    );
  }
}
