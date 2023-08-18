import 'package:flutter/material.dart';
import 'package:taskmanager/core/utils/style.dart';
import 'package:taskmanager/task.dart';

class AddNewTaskButton extends StatelessWidget {
  const AddNewTaskButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: AppStyles.spaceSmall,
        top: AppStyles.spaceDefault,
      ),
      child: ElevatedButton.icon(
        icon: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push<void>(
            MaterialPageRoute(
              builder: (context) => const NewTask(),
            ),
          );
        },
        label: Text('New task'),
      ),
    );
  }
}
