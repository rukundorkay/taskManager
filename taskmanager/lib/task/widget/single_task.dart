import 'package:flutter/material.dart';
import 'package:taskmanager/core/utils/extensions/context_extension.dart';
import 'package:taskmanager/core/utils/style.dart';
import 'package:taskmanager/logic/add_task.dart';

////[SingleTask] widget holds the information of an individual widget
class SingleTask extends StatelessWidget {
  ///initiliaze [SingleTask]
  const SingleTask({
    super.key,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.id,
  });

  ///task id
  final String id;

  ///task name
  final String name;

  ///task startDate
  final String startDate;

  ///task endDate
  final String endDate;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(id),
      onDismissed: (direction) async {
        await tasks.doc(id).delete();
      },
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppStyles.radius)),
        ),
        child: ListTile(
          leading: const Icon(
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
                const Text('-'),
                Text(' to $endDate'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
