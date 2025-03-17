import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/pages/home/controller/home_controller.dart';
import 'package:pest_gpt/src/pages/pesticides/controller/pesticide_controller.dart';
import 'package:pest_gpt/src/resource/wallet_connect/wallet_connect_controller.dart';
import 'package:pest_gpt/src/utils/toast/toast_manager.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

class WalletConnected extends GetView<WalletConnectController> {
  final W3MService service;
  const WalletConnected({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${StringConstant.walletConnected.tr} ✅",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              OutlinedButton(
                onPressed: () async {
                  // if (service.isConnected) {
                  await service.disconnect();
                  await Future.delayed(const Duration(milliseconds: 500), () {
                    controller.updateStatus();
                  });
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  side: const BorderSide(color: Colors.red, width: 2.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                child: Text(
                  StringConstant.disconnectWallet.tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildTextAndWidget(
          StringConstant.selectedNetwork.tr,
          W3MNetworkSelectButton(service: service),
        ),
        _buildTextAndWidget(
          StringConstant.balance.tr,
          W3MAccountButton(service: service),
        ),
        const Divider(),
        Container(
          color: Colors.yellow[200],
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            StringConstant.walletWarning.tr,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Divider(),
        CommonPrimaryButton(
          onPressed: () {
            final userInfo = Get.find<HomeController>().userInfo.value;
            final pesticideController = Get.find<PesticideController>();
            if (userInfo == null) {
              ToastManager.showError("User Info not found");
              return;
            }
            final List<String> pesticideName = [];
            final List<int> cost = [];
            for (var pesticide in pesticideController.selectedPesticideList) {
              pesticideName.add(pesticide.name);
              cost.add(int.parse(pesticide.cost));
            }
            controller.buyPesticide(userInfo.id!, pesticideName, cost);
          },
          title: StringConstant.buy.tr,
        ),
      ],
    );
  }

  Widget _buildTextAndWidget(String text, Widget widget) {
    return Column(
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              widget,
            ],
          ),
        ),
      ],
    );
  }
}
