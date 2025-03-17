import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_app_bar.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/common_widget/common_scaffold.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/models/pest/pest_info.dart';
import 'package:pest_gpt/src/models/pest/pest_model.dart';
import 'package:pest_gpt/src/pages/pest_info_page/widget/pest_image_n_climate.dart';
import 'package:pest_gpt/src/pages/pest_info_page/widget/precaution_list.dart';
import 'package:pest_gpt/src/pages/pesticides/pesticides.dart';
import 'package:pest_gpt/src/resource/image_path.dart';

class PestInfoPage extends StatelessWidget {
  final PestModel pestModel;
  final LLMPestInfo pestInfo;
  const PestInfoPage(this.pestModel, this.pestInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        titleText: pestModel.pestName,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                PestImageNClimate(pestModel: pestModel, pestInfo: pestInfo),
                const SizedBox(height: 16),
                _buildPestInfo(pestInfo, pestModel),
              ],
            ),
          ),
          CommonPrimaryButton(
            color: Theme.of(Get.context!).colorScheme.surface,
            onPressed: () => {
              Get.to(
                PesticidesPage(pestInfo: pestInfo),
              )
            },
            titleWidget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    IMAGEPATH.pesticideIcon,
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    StringConstant.viewPesticides.tr,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPestInfo(LLMPestInfo pestInfo, PestModel pestModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        pestInfo.precautions != null
            ? PrecautionList(
                pestInfo.precautions!,
                pestModel: pestModel,
              )
            : const SizedBox(),
        const SizedBox(height: 16),
        const SizedBox(height: 16),
      ],
    );
  }
}
