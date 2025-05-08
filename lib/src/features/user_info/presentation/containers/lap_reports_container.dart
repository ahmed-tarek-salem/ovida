import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ovida/src/core/extensions/hardcoded.dart';
import 'package:ovida/src/features/user_info/presentation/widgets/text_field_with_header.dart';

class LapReportsContainer extends StatelessWidget {
  const LapReportsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'Add your lab reports'.hardCoded,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.blue),
        ),
        SizedBox(height: 16),
        TextFieldWithHeader(
          header: "Lab Reports".hardCoded,
          textField: FormBuilderTextField(
            name: "lab_reports",
            decoration: InputDecoration(
              hintText: "Enter your lab reports".hardCoded,
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
