class Env {
  static const String apiBaseUrlOffice = "http://192.168.58.2:8000";
  static const String apiBaseUrlHome = "http://192.168.31.25:8000";
  // final envType = "prod";
  final envType = "dev";

  static String get apiBaseUrl => apiBaseUrlHome;
}
