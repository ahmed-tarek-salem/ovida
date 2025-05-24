import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/constants/app_icons.dart';
import 'package:ovida/src/core/constants/app_theme.dart';
import 'package:ovida/src/core/extensions/hardcoded.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ovida/src/features/user_info/presentation/widgets/text_field_with_header.dart';

class PersonalInfoContainer extends StatelessWidget {
  const PersonalInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'Set-up your personal information'.hardCoded,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primary),
        ),
        SizedBox(height: 16.h),
        TextFieldWithHeader(
            header: "Full Name".hardCoded,
            textField: FormBuilderTextField(
                name: "first_name",
                decoration: InputDecoration(
                    hintText: "Enter your full name".hardCoded))),
        TextFieldWithHeader(
            header: "Date of Birth",
            textField: FormBuilderTextField(
                name: "date_of_birth",
                decoration: InputDecoration(
                    hintText: "Select your date of birth".hardCoded))),
        TextFieldWithHeader(
            header: "Gender",
            textField: FormBuilderDropdown(
                name: "gender",
                hint: Text("Select your gender".hardCoded, style: hintStyle),
                icon: SvgPicture.asset(
                  AppIcons.arrowDown,
                ),
                items: [
                  DropdownMenuItem(value: "0", child: Text("Male")),
                  DropdownMenuItem(value: "1", child: Text("Female")),
                ])),
        TextFieldWithHeader(
            header: "Phone Number",
            textField: FormBuilderTextField(
              name: 'phone_number',
              decoration: InputDecoration(
                  hintText: "Enter your phone number".hardCoded),
              keyboardType: TextInputType.phone,
            )),
        TextFieldWithHeader(
            header: "Emergency Phone Number",
            textField: FormBuilderTextField(
              name: 'phone_number',
              decoration: InputDecoration(
                  hintText: "Enter your emergency phone number".hardCoded),
              keyboardType: TextInputType.phone,
            )),
      ],
    );
  }
}
