import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovida/src/core/extensions/hardcoded.dart';
import 'package:ovida/src/features/user_info/presentation/widgets/text_field_with_header.dart';

class MedicalVisitsContainer extends StatelessWidget {
  const MedicalVisitsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'Add your medical visits'.hardCoded,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.blue),
        ),
        SizedBox(height: 16.h),
        TextFieldWithHeader(
          header: "Medical Visits".hardCoded,
          textField: FormBuilderTextField(
            name: "medical_visits",
            decoration: InputDecoration(
              hintText: "Enter your medical visits".hardCoded,
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
                child: TextFieldWithHeader(
              header: "Date".hardCoded,
              textField: FormBuilderTextField(
                name: "date",
                decoration: InputDecoration(
                  hintText: "Ex: 2023-10-01".hardCoded,
                  border: OutlineInputBorder(),
                ),
              ),
            )),
            SizedBox(width: 8),
            Expanded(
                child: TextFieldWithHeader(
              header: "Doctor's Name".hardCoded,
              textField: FormBuilderTextField(
                name: "doctor_name",
                decoration: InputDecoration(
                  hintText: "Ex: Dr. Smith".hardCoded,
                  border: OutlineInputBorder(),
                ),
              ),
            )),
          ],
        ),
      ],
    );
  }
}
