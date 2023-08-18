import 'package:flutter/material.dart';
import 'package:taskmanager/core/utils/style.dart';
import 'package:taskmanager/logic/add_task.dart';
import 'package:taskmanager/logic/helpers/datepicker.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  TextEditingController taskController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
        centerTitle: true,
      ),
      body: Column(children: [
        Taskfield(),
        dateField(
          context: context,
          label: 'start Date',
          hint: 'starting Date',
          isStartingDate: true,
        ),
        dateField(
          context: context,
          label: 'end date',
          hint: 'ending date',
        ),
        Padding(
          padding: const EdgeInsets.all(AppStyles.spaceLarge),
          child: ElevatedButton(
            onPressed: () async {
              await addTask(
                taskName: taskController.text,
                startDate: startDateController.text,
                endDate: endDateController.text,
              );
              Navigator.pop(context);
            },
            child: Text('save '),
          ),
        )
      ]),
    );
  }

  Container Taskfield() {
    return Container(
      margin: const EdgeInsets.only(
        left: AppStyles.spaceMedium,
        right: AppStyles.spaceMedium,
        top: AppStyles.spaceMedium,
      ),
      child: Form(
        // autovalidateMode: AutovalidateMode.always,
        child: TextFormField(
          controller: taskController,
          decoration: InputDecoration(
            hintText: 'enter task',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Text(
              'task',
              style: TextStyle(fontSize: AppStyles.spaceDefault),
            ),
          ),
        ),
      ),
    );
  }

  Widget dateField({
    required BuildContext context,
    required hint,
    required label,
    bool isStartingDate = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(
        left: AppStyles.spaceMedium,
        right: AppStyles.spaceMedium,
        top: AppStyles.spaceMedium,
      ),
      child: TextFormField(
        controller: isStartingDate ? startDateController : endDateController,
        readOnly: true,
        onTap: () async {
          final date = await datepicker(context: context) as String;
          setState(() {
            if (isStartingDate) {
              startDateController.text = date;
            } else {
              endDateController.text = date;
            }
          });
        },
        decoration: InputDecoration(
          hintText: hint,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text(
            label,
            style: TextStyle(fontSize: AppStyles.spaceDefault),
          ),
        ),
      ),
    );
  }
}
