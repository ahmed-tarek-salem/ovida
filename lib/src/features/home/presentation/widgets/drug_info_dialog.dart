import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovida/src/features/home/data/models/doses_model.dart';

class DrugInfoDialog extends StatelessWidget {
  final MedicationDose? medication;
  const DrugInfoDialog({super.key, required this.medication});

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        medication?.medicationDetails?.brandName ?? "-",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        medication?.medicationDetails?.genericName ?? "-",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close, size: 24.r),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Text(
              'General Drug Information',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16.h),
            _buildInfoRow(
                'Drug Class:', medication?.medicationDetails?.drugClass ?? "-"),
            SizedBox(height: 8.h),
            _buildInfoRow('Dosage:', medication?.dosage ?? "-"),
            SizedBox(height: 8.h),
            _buildInfoRow('Frequency:', medication?.frequency ?? "-"),
            SizedBox(height: 8.h),
            _buildInfoRow('Indications:',
                medication?.medicationDetails?.indications?.join(', ') ?? "-"),
            SizedBox(height: 8.h),
            _buildInfoRow(
                'Contraindications:',
                medication?.medicationDetails?.contraindications?.join(', ') ??
                    "-"),
          ],
        ),
      ),
    );
  }
}
