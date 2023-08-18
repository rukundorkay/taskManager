import 'package:flutter/material.dart';
import 'package:taskmanager/core/utils/extensions/context_extension.dart';
import 'package:taskmanager/core/utils/style.dart';

////[SingleTask] widget holds the information of an individual widget
class SingleTask extends StatelessWidget {
  const SingleTask({
    Key? key,
    required this.name,
    required this.startDate,
    required this.endDate,
  }) : super(key: key);

  final String name;
  final String startDate;
  final String endDate;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppStyles.radius)),
      ),
      child: ListTile(
        leading: Icon(
          Icons.task,
          size: AppStyles.spaceEnormous,
        ),
        title: Text(
          name,
          style: TextStyle(
            color: context.colors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(
            top: AppStyles.spaceTiny,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(' from $startDate'),
              Text('-'),
              Text(' to $endDate'),
            ],
          ),
        ),
      ),
    );
  }
}
