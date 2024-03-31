class AppRouting {
  static const home = "/";
  static const generateLE = "/generate-le";
  static const customizeFees = "/customize-fees";
  static const support = "/support";
  static const account = "/account";
  static const myProfile = "my-profile";
  static const credentials = "credentials";
  static const accountPlans = "account-plans";
  static const billing = "billing";
  static const integrations = "integrations";

  String getPathFromAcc(String path) {
    return "$account/path";
  }
}
