import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/constants/app_icons.dart';

class CustomDropdownSingleSelection extends StatefulWidget {
  final List<String> items;
  final Function(String selectedItem) onChanged;
  final String? searchHintText;
  const CustomDropdownSingleSelection({
    super.key,
    required this.items,
    required this.onChanged,
    this.searchHintText,
  });

  @override
  State<CustomDropdownSingleSelection> createState() =>
      _CustomDropdownSingleSelectionState();
}

class _CustomDropdownSingleSelectionState
    extends State<CustomDropdownSingleSelection> {
  final dropDownKey = GlobalKey<DropdownSearchState>();

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      key: dropDownKey,
      items: (filter, search) {
        return widget.items;
      },
      onChanged: (selectedItem) {
        if (selectedItem != null) {
          widget.onChanged(selectedItem);
        }
      },
      compareFn: (item1, item2) => item1 == item2,
      popupProps: PopupProps.dialog(
        showSelectedItems: true,
        itemBuilder: (context, item, isSelected, isSKL) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: Text(
              item,
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
            hintText: widget.searchHintText,
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
        child: Text(
          selectedItem ?? "",
          style: TextStyle(color: AppColors.gradientStart, fontSize: 12.sp),
        ),
      ),
      itemAsString: (item) => item,
      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(
          hintText: widget.searchHintText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
