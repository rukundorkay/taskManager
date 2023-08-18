import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/core/utils/extensions/context_extension.dart';
import 'package:taskmanager/core/utils/style.dart';
import 'package:taskmanager/logic/add_task.dart';
import 'package:taskmanager/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Tasks List'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AddNewTaskButton(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                left: AppStyles.spaceSmall,
                right: AppStyles.spaceSmall,
              ),
              child: StreamBuilder<QuerySnapshot>(
                stream: tasks.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(
                      color: context.colors.secondary,
                    );
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot task = snapshot.data!.docs[index];
                      return SingleTask(
                        name: task['name'],
                        startDate: task['startDate'],
                        endDate: task['endDate'],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
