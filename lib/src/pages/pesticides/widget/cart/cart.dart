import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_loader.dart';
import 'package:pest_gpt/src/pages/pesticides/widget/cart/widget/transcation_status.dart';
import 'package:pest_gpt/src/pages/pesticides/widget/cart/widget/wallet_connected.dart';
import 'package:pest_gpt/src/pages/pesticides/widget/cart/widget/connect_wallet_widget.dart';
import 'package:pest_gpt/src/resource/wallet_connect/wallet_connect_controller.dart';

class CartBottomSheet extends GetView<WalletConnectController> {
  const CartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FutureBuilder(
        future: controller.w3mService,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting ||
              snap.data == null) {
            return const Center(
              child: CommonLoader(),
            );
          }
          return Obx(() {
            if (controller.transcationStatus.value == TransactionStatus.init) {
              if (controller.isWalletConnected.value) {
                return WalletConnected(service: snap.data!);
              } else {
                return const ConnectWalletWidget();
              }
            } else {
              return TranscationStatusWidget(
                status: controller.transcationStatus.value,
              );
            }
          });
        },
      ),
    );
  }
}
