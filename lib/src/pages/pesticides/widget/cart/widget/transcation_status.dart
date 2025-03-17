import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pest_gpt/src/common_widget/common_loader.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/resource/image_path.dart';
import 'package:pest_gpt/src/resource/wallet_connect/wallet_connect_controller.dart';

class TranscationStatusWidget extends GetView<WalletConnectController> {
  final TransactionStatus status;
  const TranscationStatusWidget({super.key, required this.status});

  void launchBlockExplorer() async {
    var service = await controller.w3mService;
    service.launchBlockExplorer();
  }

  @override
  Widget build(BuildContext context) {
    if (status == TransactionStatus.inProgress) {
      return CommonLoader(
        loadingText: StringConstant.transactionInProgress.tr,
        buttonWidget: CommonPrimaryButton(
          title: StringConstant.openBlockExplorer.tr,
          onPressed: launchBlockExplorer,
        ),
      );
    } else if (status == TransactionStatus.success) {
      return _buildStatus(
        StringConstant.transactionSuccess.tr,
        IMAGEPATH.successAnimation,
        StringConstant.openBlockExplorer.tr,
        launchBlockExplorer,
      );
    } else {
      return _buildStatus(
        StringConstant.transactionFailed.tr,
        IMAGEPATH.failedAnimation,
        StringConstant.tryAgain.tr,
        () async {
          Get.find<WalletConnectController>().resetTransactionStatus();
        },
      );
    }
  }

  Widget _buildStatus(
    String title,
    String lottifilePath,
    String buttonText,
    void Function() onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Lottie.asset(lottifilePath, height: 200),
          CommonPrimaryButton(
            onPressed: onPressed,
            title: buttonText,
          ),
        ],
      ),
    );
  }
}
