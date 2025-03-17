import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pest_gpt/src/app.dart';
import 'package:pest_gpt/src/pages/transcation_history.dart/controller/transcation_history_controller.dart';
import 'package:pest_gpt/src/resource/llm/llm_controller.dart';
import 'package:pest_gpt/src/resource/wallet_connect/wallet_connect_controller.dart';

Future<void> main() async {
  await GetStorage.init();
  await dotenv.load(fileName: "assets/.env");
  Get.put(LLMController());
  Get.put(WalletConnectController());
  Get.put(TranscationHistoryController());
  
  return runApp(const App());
}
