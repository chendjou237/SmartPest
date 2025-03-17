import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pest_gpt/src/common_widget/common_card.dart';
import 'package:pest_gpt/src/common_widget/common_icon_button.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/pages/home/controller/home_controller.dart';
import 'package:pest_gpt/src/pages/pest_task/pest_task_details.dart';
import 'package:pest_gpt/src/resource/image_path.dart';

class PestTaskList extends GetView<HomeController> {
  const PestTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.pestTasks.value.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(IMAGEPATH.emptyList, height: 200, width: 200),
                  Text(
                    StringConstant.noPestDetected.tr,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : ListView(
                shrinkWrap: true,
                children: controller.pestTasks.value.map((pestTask) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 15,
                    ),
                    child: CommonCard(
                      child: ListTile(
                        onTap: () => {
                          Get.to(
                            PestTaskDetailsPage(pestName: pestTask.pestName),
                          )
                        },
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(pestTask.pestName),
                            CommonIconButton(
                              color: Colors.red,
                              icon: Icons.delete,
                              onPressed: () {
                                controller.deletePestTask(pestTask.pestName);
                              },
                            ),
                          ],
                        ),
                        subtitle: Text("Total Task ${pestTask.tasks.length}"),
                      ),
                    ),
                  );
                }).toList(),
              );
      },
    );
  }
}

class PestTaskItem extends StatelessWidget {
  const PestTaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
