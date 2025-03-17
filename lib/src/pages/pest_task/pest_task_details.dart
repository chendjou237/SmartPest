import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_app_bar.dart';
import 'package:pest_gpt/src/common_widget/common_scaffold.dart';
import 'package:pest_gpt/src/common_widget/common_tab_header.dart';
import 'package:pest_gpt/src/pages/home/controller/home_controller.dart';
import 'package:pest_gpt/src/pages/pest_task/widget/task_list.dart';

class PestTaskDetailsPage extends StatefulWidget {
  final String pestName;
  const PestTaskDetailsPage({super.key, required this.pestName});

  @override
  State<PestTaskDetailsPage> createState() => _PestTaskDetailsPageState();
}

class _PestTaskDetailsPageState extends State<PestTaskDetailsPage> {
  final HomeController controller = Get.find<HomeController>();
  bool showCompletedTab = false;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var pestTask = controller.pestTasks.value.firstWhere((element) {
        return element.pestName == widget.pestName;
      });
      return CommonScaffold(
        appBar: CommonAppBar(
          titleText: "${widget.pestName.split(' ')[0].capitalize} Task's",
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              CommonTabHeader(
                  numberOfTab: 2,
                  tabHeaders: const [
                    "Pending",
                    "Completed",
                  ],
                  onChangeTab: (_) {
                    setState(() {
                      showCompletedTab = !showCompletedTab;
                    });
                  }),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: showCompletedTab
                    ? TaskList(
                        tasks: pestTask.tasks.where((element) {
                          return element.isCompleted;
                        }).toList(),
                        pestName: pestTask.pestName,
                        isCompleted: true,
                      )
                    : TaskList(
                        tasks: pestTask.tasks.where((element) {
                          return !element.isCompleted;
                        }).toList(),
                        pestName: pestTask.pestName,
                      ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
