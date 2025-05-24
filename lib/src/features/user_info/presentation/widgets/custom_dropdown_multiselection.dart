import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/constants/app_constants.dart';
import 'package:ovida/src/core/constants/app_icons.dart';
import 'package:ovida/src/core/shared/widgets/gradient_elevated_button.dart';

class CustomDropdownMultiSelection extends StatefulWidget {
  final List<String> items;
  final List<String> initialSelectedItems;
  final String searchHintText;
  final Function(List<String> selectedItems) onChanged;
  const CustomDropdownMultiSelection(
      {super.key,
      required this.items,
      required this.initialSelectedItems,
      required this.searchHintText,
      required this.onChanged});

  @override
  State<CustomDropdownMultiSelection> createState() =>
      _CustomDropdownMultiSelectionState();
}

class _CustomDropdownMultiSelectionState
    extends State<CustomDropdownMultiSelection> {
  final dropDownKey = GlobalKey<DropdownSearchState<String>>();

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>.multiSelection(
      key: dropDownKey,
      suffixProps: DropdownSuffixProps(
        dropdownButtonProps: DropdownButtonProps(
          iconSize: 24.sp,
          iconOpened: SvgPicture.asset(AppIcons.arrowUp,
              height: 16.sp, fit: BoxFit.scaleDown),
          iconClosed: SvgPicture.asset(AppIcons.arrowDown,
              height: 16.sp, fit: BoxFit.scaleDown),
        ),
      ),
      dropdownBuilder: (context, selectedItems) => SizedBox(
        child: Wrap(
          spacing: 8.sp,
          runSpacing: 4.sp,
          children: selectedItems
              .map((item) => Chip(
                    label: Text(item,
                        style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                    deleteIcon: Icon(Icons.close, size: 16.sp),
                    onDeleted: () {
                      dropDownKey.currentState!.removeItem(item);
                      widget.onChanged(
                          dropDownKey.currentState!.getSelectedItems);
                    },
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r)),
                    deleteIconColor: AppColors.error,
                    backgroundColor:
                        AppColors.gradientEnd.withValues(alpha: 0.5),
                  ))
              .toList(),
        ),
      ),
      selectedItems: widget.initialSelectedItems,
      items: (filter, infiniteScrollProps) => widget.items
          .where((item) => item.toLowerCase().contains(filter.toLowerCase()))
          .toList(),
      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
      popupProps: PopupPropsMultiSelection<String>.menu(
        validationBuilder: (context, selectedItems) {
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppConstants.horizontalPadding)
                    .copyWith(bottom: 16.h),
            child: GradientButton(
                onPressed: () {
                  widget.onChanged(selectedItems);
                  dropDownKey.currentState!.popupOnValidate();
                },
                child: Text("Submit")),
          );
        },
        showSelectedItems: true,
        checkBoxBuilder: (context, item, isDisabled, isSelected) => Checkbox(
          onChanged: (val) {},
          value: isSelected,
          checkColor: Colors.white,
          activeColor: AppColors.gradientStart,
          side: BorderSide(
            color: AppColors.gradientStart,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
        ),
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
    );
  }
}
