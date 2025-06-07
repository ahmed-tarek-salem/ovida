import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/constants/app_icons.dart';
import 'package:ovida/src/core/constants/app_theme.dart';
import 'package:ovida/src/core/extensions/hardcoded.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ovida/src/core/services/dependency_injection/di_service.dart';
import 'package:ovida/src/features/user_info/presentation/viewmodel/user_info_viewmodel.dart';
import 'package:ovida/src/features/user_info/presentation/widgets/text_field_with_header.dart';
import 'package:intl/intl.dart';

class PersonalInfoContainer extends StatelessWidget {
  const PersonalInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final viewmodel = di.get<UserInfoViewmodel>();
    final user = viewmodel.userInfo?.user;
    final userInfo = viewmodel.userInfo;
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
                initialValue: userInfo?.user.firstName,
                decoration: InputDecoration(
                    hintText: "Enter your full name".hardCoded))),
        TextFieldWithHeader(
            header: "Date of Birth",
            textField: FormBuilderDateTimePicker(
              name: "date_of_birth",
              inputType: InputType.date,
              format: DateFormat("dd/MM/yyyy"),
              initialDate: DateTime(2000),
              lastDate: DateTime.now(),
              decoration: InputDecoration(
                  hintText: "Select your date of birth".hardCoded,
                  suffixIcon: Icon(Icons.calendar_today)),
            )),
        TextFieldWithHeader(
            header: "Gender",
            textField: FormBuilderDropdown(
                name: "gender",
                hint: Text("Select your gender".hardCoded, style: hintStyle),
                initialValue: user?.gender,
                icon: SvgPicture.asset(
                  AppIcons.arrowDown,
                ),
                items: [
                  DropdownMenuItem(value: "male", child: Text("Male")),
                  DropdownMenuItem(value: "female", child: Text("Female")),
                ])),
        TextFieldWithHeader(
            header: "Phone Number",
            textField: FormBuilderTextField(
              name: 'phoneNumber',
              initialValue: user?.phoneNumber,
              decoration: InputDecoration(
                  hintText: "Enter your phone number".hardCoded),
              keyboardType: TextInputType.phone,
            )),
        TextFieldWithHeader(
            header: "Emergency Phone Number",
            textField: FormBuilderTextField(
              initialValue: user?.emergencyContact?.phoneNumber,
              name: 'emergencyContact',
              decoration: InputDecoration(
                  hintText: "Enter your emergency phone number".hardCoded),
              keyboardType: TextInputType.phone,
            )),
      ],
    );
  }
}
