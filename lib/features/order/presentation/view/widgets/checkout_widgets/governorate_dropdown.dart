import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/model/governorate_model.dart';

class GovernorateDropdown extends StatelessWidget {
  final int? value;
  final Function(int?) onChanged;

  const GovernorateDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      initialValue: value,
      decoration: InputDecoration(
        labelText: 'Governorate *',
        prefixIcon: const Icon(Icons.location_city_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
        ),
      ),
      items: GovernorateData.egyptGovernorates.map((gov) {
        return DropdownMenuItem<int>(
          value: gov.id,
          child: Text('${gov.nameAr} - ${gov.nameEn}'),
        );
      }).toList(),
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value <= 0) {
          return 'Please select a governorate';
        }
        return null;
      },
    );
  }
}