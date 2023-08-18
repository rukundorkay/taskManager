import 'package:flutter/material.dart';
import 'package:taskmanager/core/utils/style.dart';
import 'package:taskmanager/task.dart';
///[AddNewTaskButton] add new task button
class AddNewTaskButton extends StatelessWidget {
  ///initiliaze[AddNewTaskButton]
  const AddNewTaskButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: AppStyles.spaceSmall,
        top: AppStyles.spaceDefault,
      ),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push<void>(
            MaterialPageRoute(
              builder: (context) => const NewTask(),
            ),
          );
        },
        label: const Text('New task'),
      ),
    );
  }
}
