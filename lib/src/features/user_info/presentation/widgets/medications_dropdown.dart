import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/constants/app_icons.dart';
import 'package:ovida/src/core/extensions/hardcoded.dart';
import 'package:ovida/src/features/user_info/data/models/medication_model.dart';

class MedicationsDropdown extends StatefulWidget {
  final List<MedicationModel> items;
  final Function(List<MedicationModel> selectedItem) onChanged;
  const MedicationsDropdown(
      {super.key, required this.items, required this.onChanged});

  @override
  State<MedicationsDropdown> createState() => _MedicationsDropdownState();
}

class _MedicationsDropdownState extends State<MedicationsDropdown> {
  final dropDownKey = GlobalKey<DropdownSearchState<MedicationModel>>();

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<MedicationModel>(
      key: dropDownKey,
      items: (filter, search) {
        return widget.items;
      },
      compareFn: (item1, item2) => item1.brandName == item2.brandName,
      popupProps: PopupProps.dialog(
        showSelectedItems: true,
        itemBuilder: (context, item, isSelected, isSKL) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: Text(
              item.brandName ?? "",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          );
        },
        showSearchBox: true,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            hintText: "Search medication".hardCoded,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
      ),
      suffixProps: DropdownSuffixProps(
        dropdownButtonProps: DropdownButtonProps(
          iconSize: 24.sp,
          iconOpened: SvgPicture.asset(AppIcons.arrowUp,
              height: 16.sp, fit: BoxFit.scaleDown),
          iconClosed: SvgPicture.asset(AppIcons.arrowDown,
              height: 16.sp, fit: BoxFit.scaleDown),
        ),
      ),
      dropdownBuilder: (context, selectedItem) => SizedBox(
        child: Text(selectedItem?.brandName ?? '',
            style: TextStyle(color: AppColors.gradientStart, fontSize: 12.sp)),
      ),
      itemAsString: (item) => item.brandName ?? '',
      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(
          hintText: "Select medication".hardCoded,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
