import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:pest_gpt/src/common_widget/common_app_bar.dart';
import 'package:pest_gpt/src/common_widget/common_card.dart';
import 'package:pest_gpt/src/common_widget/common_loader.dart';
import 'package:pest_gpt/src/common_widget/common_scaffold.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/pages/pesticides/widget/cart/widget/connect_wallet_widget.dart';
import 'package:pest_gpt/src/pages/transcation_history.dart/controller/transcation_history_controller.dart';
import 'package:pest_gpt/src/resource/constants.dart';
import 'package:pest_gpt/src/resource/image_path.dart';
import 'package:pest_gpt/src/resource/wallet_connect/wallet_connect_controller.dart';
import 'package:pest_gpt/src/utils/bottom_sheet_util.dart';

class TranscationHistory extends StatefulWidget {
  const TranscationHistory({super.key});

  @override
  State<TranscationHistory> createState() => _TranscationHistoryState();
}

class _TranscationHistoryState extends State<TranscationHistory> {
  final TranscationHistoryController controller =
      Get.put(TranscationHistoryController());
  final WalletConnectController walletConnectController = Get.find();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        titleText: StringConstant.transactionHistory.tr,
      ),
      body: FutureBuilder(
        future: controller.fetchTranscationHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CommonLoader(
                loadingText: StringConstant.fetchingTransactionHistory.tr,
              ),
            );
          }

          if (snapshot.hasError && snapshot.data == null) {
            if (!walletConnectController.isWalletConnected.value) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                showAppBottomSheet(const ConnectWalletWidget());
              });
            }
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (snapshot.data!.isEmpty) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    IMAGEPATH.emptyTaskList,
                    height: 300,
                    width: 300,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "No Transcation History",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: CommonCard(
                  child: ListTile(
                    title: Text(snapshot.data![index].name),
                    subtitle: Text(
                      "${snapshot.data![index].cost} ${Constants.currencySymbol}",
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blueGrey,
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text(
                          DateFormat('MMM d').format(
                            DateTime.fromMillisecondsSinceEpoch(
                              snapshot.data![index].dateOfPurchase
                                  .millisecondsSinceEpoch,
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
