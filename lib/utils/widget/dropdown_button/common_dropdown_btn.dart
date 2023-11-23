import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vbmsports/utils/common/color.dart';
import 'package:vbmsports/utils/common/text_style.dart';

class CustomDropdownButton {
  static Widget commonDropdown({
    required String title,
    required List<String> listData,
    String? selectedValue,
    required Function(String) onChanged,
  }) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(Get.context!).hintColor,
          ),
        ),
        items: listData
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextAppStyle.bodyDefault()
                        .copyWith(color: AppColor.colorDark),
                  ),
                ))
            .toList(),
        // value: selectedValue,
        onChanged: (value) => onChanged(value!),
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 40,
          width: 160,
          decoration: BoxDecoration(
            color: AppColor.colorLight,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColor.colorGrey300),
          )
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
      ),
    );
  }
}
