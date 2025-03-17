import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pest_gpt/src/pages/transcation_history.dart/controller/transcation_history_controller.dart';
import 'package:pest_gpt/src/resource/contract_abi/contract_abi.dart';
import 'package:pest_gpt/src/utils/toast/toast_manager.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

const chainId = "11155111"; // sepolia chain id
final _sepoliaChain = W3MChainInfo(
  chainName: 'Sepolia',
  namespace: 'eip155:$chainId',
  chainId: chainId,
  tokenName: 'ETH',
  rpcUrl: 'https://rpc.sepolia.org/',
  blockExplorer: W3MBlockExplorer(
    name: 'Sepolia Explorer',
    url: 'https://sepolia.etherscan.io/',
  ),
);

enum TransactionStatus { init, inProgress, success, failed }

class WalletConnectController extends GetxController {
  W3MService? _w3mService;
  RxBool isWalletConnected = false.obs;
  Rx<TransactionStatus> transcationStatus = TransactionStatus.init.obs;

  WalletConnectController() {
    initalize();
  }

  void resetTransactionStatus() {
    transcationStatus.value = TransactionStatus.init;
  }

  Future<void> initalize() async {
    W3MChainPresets.chains.putIfAbsent(chainId, () => _sepoliaChain);
    _w3mService = W3MService(
      projectId: 'd8eb95f605374ff6e204ae7326531e8b',
      metadata: const PairingMetadata(
        name: 'Web3Modal Flutter Example',
        description: 'Web3Modal Flutter Example',
        url: 'https://www.walletconnect.com/',
        icons: ['https://walletconnect.com/walletconnect-logo.png'],
        redirect: Redirect(
          native: 'pestGPT://',
          universal: 'https://www.walletconnect.com',
        ),
      ),
    );
    await _w3mService!.init();
    _w3mService!.selectChain(_sepoliaChain);
    isWalletConnected.value = _w3mService!.isConnected;
    _w3mService!.getApprovedMethods();
  }

  Future<W3MService> get w3mService async {
    if (_w3mService == null) {
      await initalize();
    }
    return _w3mService!;
  }

  void updateStatus() {
    isWalletConnected.value = _w3mService!.isConnected;
    if (isWalletConnected.value) {
      ToastManager.showSuccess("Wallet Connected Successfully");
    } else {
      ToastManager.showError("Wallet Disconnected");
    }
  }

  Future<void> buyPesticide(
    String userId,
    List<String> pesticideName,
    List<int> cost,
  ) async {
    try {
      if (pesticideName.isEmpty || cost.isEmpty) {
        throw Exception("Pesticide names or costs cannot be empty.");
      }

      final totalCost =
          cost.fold(0, (previousValue, element) => previousValue + element);
      List<BigInt> costBigInt = cost.map((e) => BigInt.from(e)).toList();

      var service = await w3mService;
      if (service.session == null || service.session!.address == null) {
        ToastManager.showError("Wallet not connected");
        return;
      }
      service.launchConnectedWallet();
      final result = await service.requestWriteContract(
        topic: service.session!.topic,
        chainId: 'eip155:$chainId',
        deployedContract: deployedContract,
        functionName: 'buyPesticides',
        transaction: Transaction(
          from: EthereumAddress.fromHex(service.session!.address!),
          value: EtherAmount.fromInt(EtherUnit.wei, totalCost),
        ),
        parameters: [
          userId,
          pesticideName,
          costBigInt,
        ],
      );
      if (result is String &&
          (result.contains("User declined") ||
              result.contains("User rejected"))) {
        ToastManager.showError("User Declined Transaction");
      } else {
        transcationStatus.value = TransactionStatus.inProgress;
        await listenToEvents();
        transcationStatus.value = TransactionStatus.success;
        Get.find<TranscationHistoryController>().clearTranscationHistory();
      }
    } catch (e) {
      print("Transaction Failed: $e");
      ToastManager.showError("Transaction Failed: $e");
      transcationStatus.value = TransactionStatus.failed;
    }
  }

  Future<void> listenToEvents() async {
    final client = Web3Client(_sepoliaChain.rpcUrl, http.Client());
    final purchaseMadeEvent = deployedContract.event("PurchaseMade");
    var subscription = client
        .events(FilterOptions.events(
            contract: deployedContract, event: purchaseMadeEvent))
        .take(1)
        .listen((event) {
      final decoded =
          purchaseMadeEvent.decodeResults(event.topics!, event.data!);

      final from = decoded[0] as EthereumAddress;
      from.toString();
      final pesticideName = decoded[1];
      final costOfPesticide = decoded[2] as BigInt;
      ToastManager.showSuccess(
        "Transcation Successfull for $pesticideName at $costOfPesticide",
      );
    });
    await subscription.asFuture();
    await subscription.cancel();
    await client.dispose();
  }

  String shortenEthereumAddress(String address) {
    return "${address.substring(0, 6)}...${address.substring(address.length - 4)}";
  }

  @override
  void onClose() {
    _w3mService?.dispose();
    super.onClose();
  }
}
