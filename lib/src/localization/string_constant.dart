import 'package:lang_internationalization/lang_internationalization.dart';

@LangInternationalization(["en_US", "zh_CN"])
class StringConstant {
  static const String appName = 'Parallel Farm';
  static const String welcome = 'Welcome';
  static const String introToPestShield =
      'Welcome to the future of farming. Smart Pest is a platform that helps you to detect pests in your crops and provides you with the best solutions to protect your crops.';
  static const String welcomeToPFarmDesc = 'Welcome to the future of farming';
  static const String invalidEmail = 'Invalid Email';
  static const String userNameCannotBeEmpty = 'User Name cannot be empty';
  static const String passwordCannotBeEmpty = 'Password cannot be empty';
  static const String somethingWentWrong = 'Something went wrong';
  static const String loginSuccess = 'Login Success';
  static const String noPestDetected =
      "No pest history found. Please use the Detect Pest feature to identify pests.";
  static const String logout = 'Logout';
  static const String welcomeToPestShield = 'Welcome to Smart Pest';
  static const String registeringUser = 'Registering User, Please wait...';

  // login
  static const String email = 'Email';
  static const String password = 'Password';
  static const String forgotPassword = 'Forgot your password?';
  static const String signIn = 'Sign In';
  static const String signInWithFingerprint = 'Sign In With Fingerprint';
  static const String orUse = 'OR USE';
  static const String pestShield = 'Smart Pest';

  // register
  static const String register = 'Register';
  static const String createAccount = 'Create Account';
  static const String userName = 'User Name';
  static const String fullName = 'Full Name';
  static const String mobileNumber = 'Mobile Number';
  static const String congfirmPassword = 'Confirm Password';
  static const String alreadyHaveAnAccount = 'Already have an account?';
  static const String signUp = 'Sign Up';

  // home
  static const String home = 'Home';
  static const String apply = 'Apply';
  static const String addAsTask = 'Add as Task';
  static const String tasks = 'Tasks';
  static const String pestTasks = 'Pest Tasks';

  //pest detection
  static const String detectPest = 'Detect Pest';
  static const String failedToDetectPest = 'Failed to detect pest';
  static const String pestDetected = 'Pest detected';
  static const String pestDetails = 'Pest Details';
  static const String showPestDetails = 'Show Pest Details';
  static const String captureImage = 'Capture Image';
  static const String pickFromGallery = 'Pick From Gallery';
  static const String cameraInitError = 'Camera initialization error';

  //pesticides
  static const String pesticides = 'Pesticides';
  static const String viewPesticides = 'View Pesticides';

  //cart
  static const String buy = 'Buy';
  static const String walletWarning =
      'Please note that this is a test mode. Make sure you are using a test wallet to buy the product. Any transactions made on the mainnet might not be refunded.';
  static const String connectWallet = 'Connect Wallet';
  static const String connectWalletTitle = 'Connect Wallet to Buy Product';
  static const String walletConnected = 'Wallet Connected';
  static const String selectedNetwork = 'Selected Network';
  static const String balance = 'Balance';
  static const String disconnectWallet = 'Disconnect ';
  static const String transactionSuccess = 'Transaction Success';
  static const String buyMore = 'Buy More';
  static const String transactionFailed = 'Transaction Failed';
  static const String openBlockExplorer = 'Open Block Explorer';
  static const String tryAgain = 'Try Again';
  static const String transactionInProgress =
      'Your transaction is being confirmed on the blockchain. This could take a moment.';

  //transaction history
  static const String transactionHistory = 'Transaction History';
  static const String noTransactionHistory = 'No Transaction History';
  static const String loadingUserDetails = 'Loading User Details';

  //common
  static const String fetchingTransactionHistory =
      'Fetching Transaction History';
}
