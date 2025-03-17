import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pest_gpt/src/common_widget/common_card.dart';
import 'package:pest_gpt/src/common_widget/common_icon_button.dart';
import 'package:pest_gpt/src/models/pest/pest_tasks.dart';
import 'package:pest_gpt/src/pages/home/controller/home_controller.dart';
import 'package:pest_gpt/src/resource/image_path.dart';

class TaskList extends GetView<HomeController> {
  final List<Task> tasks;
  final String pestName;
  final bool isCompleted;
  const TaskList({
    super.key,
    required this.tasks,
    required this.pestName,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                IMAGEPATH.emptyTaskList,
                height: 200,
                width: 200,
              ),
              Text(
                "No ${isCompleted ? "Completed" : "Pending"} Tasks",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: CommonCard(
                  child: ListTile(
                    title: Text(tasks[index].taskName),
                    trailing: CommonIconButton(
                      height: 30,
                      width: 30,
                      color: isCompleted ? Colors.red : Colors.green,
                      icon: isCompleted ? Icons.close : Icons.check,
                      iconSize: 20,
                      onPressed: () {
                        tasks[index].isCompleted = !tasks[index].isCompleted;
                        controller.updatePestTask(pestName, tasks[index]);
                      },
                    ),
                  ),
                ),
              );
            },
          );
  }
}
