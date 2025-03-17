import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_card.dart';
import 'package:pest_gpt/src/models/pest/pest_info.dart';
import 'package:pest_gpt/src/models/pest/pest_model.dart';
import 'package:pest_gpt/src/pages/pest_detect_details/controller/pest_details_controller.dart';
import 'package:pest_gpt/src/pages/pest_info_page/pest_info_page.dart';

class ExpandPestDetails extends StatefulWidget {
  final PestModel pestModel;
  const ExpandPestDetails({super.key, required this.pestModel});

  @override
  State<ExpandPestDetails> createState() => _ExpandPestDetailsState();
}

class _ExpandPestDetailsState extends State<ExpandPestDetails> {
  bool _customTileExpanded = false;
  PestDetailsController controller = Get.find<PestDetailsController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ExpansionTile(
        title: Text(
          widget.pestModel.pestName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        tilePadding: const EdgeInsets.only(top: 10, bottom: 10),
        leading: CommonCard(
          height: 50,
          width: 50,
          child: Hero(
            tag: widget.pestModel.image,
            child: Image.memory(
              widget.pestModel.image,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        trailing: Icon(
          _customTileExpanded
              ? Icons.arrow_drop_up_sharp
              : Icons.arrow_drop_down,
        ),
        children: [
          controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : _buildPestInfo(
                  controller.pestDetails[widget.pestModel.pestName],
                  widget.pestModel,
                ),
        ],
        onExpansionChanged: (bool expanded) {
          setState(() {
            _customTileExpanded = expanded;
          });
        },
      );
    });
  }

  _buildPestInfo(LLMPestInfo? pestDetail, PestModel pestModel) {
    if (pestDetail == null) {
      return const Center(
        child: Text("Failed to fetch details"),
      );
    } else {
      return Column(
        children: [
          Text(
            pestDetail.pestInfo ?? "N/A",
            textAlign: TextAlign.justify,
          ),
          TextButton(
            onPressed: () {
              Get.to(PestInfoPage(pestModel, pestDetail));
            },
            child: const Text('View More'),
          )
        ],
      );
    }
  }
}
