import 'package:flutter/material.dart';
import 'package:taskmanager/core/utils/extensions/context_extension.dart';
import 'package:intl/intl.dart';

///[datepicker]is fuction supports picking of date
Future datepicker({required BuildContext context}) async {
  final now = DateTime.now();
  final DateTime? pickedDate;

  pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(now.year + 1),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(primary: context.colors.primary),
        ),
        child: child!,
      );
    },
  );

  if (pickedDate != null) {
    final formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

    return formattedDate;
  }
}
