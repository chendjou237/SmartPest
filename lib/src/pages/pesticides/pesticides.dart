import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_app_bar.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/common_widget/common_scaffold.dart';
import 'package:pest_gpt/src/models/pest/pest_info.dart';
import 'package:pest_gpt/src/pages/pesticides/controller/pesticide_controller.dart';
import 'package:pest_gpt/src/pages/pesticides/widget/cart/cart.dart';
import 'package:pest_gpt/src/pages/pesticides/widget/pesticides_list_item.dart';
import 'package:pest_gpt/src/resource/wallet_connect/wallet_connect_controller.dart';

class PesticidesPage extends StatelessWidget {
  final PesticideController controller = Get.put(PesticideController());
  final LLMPestInfo pestInfo;
  PesticidesPage({
    super.key,
    required this.pestInfo,
  });

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: const CommonAppBar(
        titleText: 'Pesticides',
      ),
      body: pestInfo.pesticides?.isEmpty ?? true
          ? const Center(
              child: Text('No pesticides found'),
            )
          : ListView.builder(
              itemCount: pestInfo.pesticides!.length,
              itemBuilder: (context, index) {
                return PesticidesListItem(
                  pesticide: pestInfo.pesticides![index],
                  onPesticideSelected: () {
                    controller.addPesticide(pestInfo.pesticides![index]);
                  },
                  onPesticideUnselected: () {
                    controller.removePesticide(pestInfo.pesticides![index]);
                  },
                );
              },
            ),
      floatingActionButton: Obx(() {
        return controller.selectedPesticideList.isNotEmpty
            ? CommonPrimaryButton(
                height: 50,
                width: 100,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      Get.find<WalletConnectController>()
                          .resetTransactionStatus();
                      return const CartBottomSheet();
                    },
                  );
                },
                titleWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Badge(
                      label: Text(
                        controller.selectedPesticideList.length.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      child: Icon(
                        Icons.shopping_cart_rounded,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      controller.totalPesticideCost.toString(),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.surface,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            : Container();
      }),
    );
  }
}
